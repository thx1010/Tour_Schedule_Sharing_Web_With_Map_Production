package net.developia.board.web;

import java.util.*;

import javax.servlet.http.*;

import org.json.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

<<<<<<< HEAD
import lombok.extern.slf4j.Slf4j;
import net.developia.board.dto.MapDTO;
import net.developia.board.dto.PlaceDTO;
import net.developia.board.dto.RouteDTO;
import net.developia.board.dto.ThemeDTO;
import net.developia.board.dto.UserDTO;
import net.developia.board.service.ChatService;
import net.developia.board.service.MapService;
import net.developia.board.service.ThemeService;
=======
import lombok.extern.slf4j.*;
import net.developia.board.dto.*;
import net.developia.board.service.*;
>>>>>>> 39518d9d1ba616cd55e0c0493815b864cd2c9c26

@Slf4j
@Controller
@RequestMapping("/mapcontrol")
public class MapController {
	@Autowired
	private MapService mapService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private ThemeService themeService;
	
	@Autowired
	private PointService pointService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String dynamicMarker() {
		return "maker";
	}
	
	@RequestMapping(value="/position", method=RequestMethod.POST)
	@ResponseBody
	public String getPosition(@RequestParam Map<String, Object> position) {
		log.info("[새좌표]" + (String)position.get("lat") + " , " + (String)position.get("lng"));
		log.info("[도로명]" + (String)position.get("loadAddr"));
		log.info("[지번]" + (String)position.get("addr"));
		return "success";
	}
	
	@RequestMapping(value="/coursemake", method=RequestMethod.POST)
	@ResponseBody
	public String getAllData(@RequestBody String mapData, HttpSession session) {
		//log.info(mapData);
		
		JSONObject jObject = new JSONObject(mapData);
		log.info("[jObject] :: " + jObject.toString());
		List<PlaceDTO> placeList = new ArrayList<PlaceDTO>();
		List<RouteDTO> routeList = new ArrayList<RouteDTO>();
		JSONArray jPlaceInfos = jObject.getJSONArray("placeInfos");
		JSONArray jRouteInfos = jObject.getJSONArray("routeInfos");
		JSONObject jMapInfo = jObject.getJSONObject("mapInfo");
		
		log.info("[jPlaceInfos] :: " + jPlaceInfos.toString());
		log.info("[jRouteInfos] :: " + jRouteInfos.toString());
		log.info("[mapInfo] : " + jMapInfo.toString());
				
		MapDTO mapDTO = new MapDTO();
		mapDTO.setMap_title(jMapInfo.getString("map_title"));
		mapDTO.setMap_subtitle(jMapInfo.getString("map_subtitle"));
		mapDTO.setMap_country(jMapInfo.getString("map_country"));
		mapDTO.setMap_state(jMapInfo.getString("map_state"));
		mapDTO.setMap_city(jMapInfo.getString("map_city"));
		mapDTO.setMap_content(jMapInfo.getString("map_content"));
		mapDTO.setMap_photo(jMapInfo.getString("map_photo"));
		mapDTO.setMap_placett(jPlaceInfos.length());
		log.info("[mapInfoverify] : " + mapDTO.toString());
		try {
			ThemeDTO themeDTO = themeService.getThemeForThemeNo(jMapInfo.getLong("theme_no"));
			mapDTO.setThemeDTO(themeDTO);
			log.info(themeDTO.toString());
		} catch (JSONException e) {
			log.info(e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.info(e.getMessage());
		}
		
		
	
		try {
			long mapNo = mapService.getNextMapNo();
			
			mapDTO.setMap_no(mapNo);
			/*
			 * map_status
			 * [0] : 등록대기상태(등록시 default)
			 * [1] : 등록완료상태
			 * [2] : 등록거절상태
			 * [3] : 신고누적상태
			 */
			log.info("맵등록시작");
			mapService.addMap(mapDTO);
			chatService.addChatRoom(mapDTO);
			log.info("맵등록끝");
			for(int i=0; i<jPlaceInfos.length(); i++) {
				JSONObject obj = jPlaceInfos.getJSONObject(i);
				PlaceDTO placeDTO = new PlaceDTO();
				placeDTO.setPlace_name(obj.getString("place_name"));
				placeDTO.setPlace_lat(obj.getString("place_lat"));
				placeDTO.setPlace_lng(obj.getString("place_lng"));
				placeDTO.setPlace_loadaddr(obj.getString("place_loadaddr"));
				placeDTO.setPlace_addr(obj.getString("place_addr"));
				placeDTO.setPlace_photo(obj.getString("place_photo"));
				placeDTO.setPlace_content(obj.getString("place_content"));
				placeDTO.setPlace_course_no(obj.getLong("place_course_no"));
				placeDTO.setMap_no(mapNo);
				
				placeList.add(placeDTO);
				log.info("[" + i + "번째place]" + placeDTO.toString());
				
				
			}
			
			for(int i=0; i<jRouteInfos.length(); i++) {
				JSONObject obj = jRouteInfos.getJSONObject(i);
				RouteDTO routeDTO = new RouteDTO();
				routeDTO.setRoute_name(obj.getString("route_name"));
				routeDTO.setRoute_path(obj.getString("route_path"));
				routeDTO.setRoute_type(obj.getString("route_type"));
				routeDTO.setRoute_course_no(obj.getLong("route_course_no"));
				routeDTO.setRoute_content(obj.getString("route_content"));
				routeDTO.setRoute_option(obj.getString("route_option"));
				routeDTO.setMap_no(mapNo);
				
				routeList.add(routeDTO);
				log.info("[" + i + "번째route]" + routeDTO.toString());
			}
			for(PlaceDTO place : placeList) {
				mapService.addPlace(place);
			}
			
			for(RouteDTO route : routeList) {
				mapService.addRoute(route);
			}
			
			
			Map<String, Object> register = new HashMap<String, Object>();
			UserDTO userDTO = (UserDTO)session.getAttribute("userInfo");
			register.put("userInfo", userDTO);
			register.put("mapInfo", mapDTO);
			mapService.addRegister(register);
			/*포인트 추가*/
			UserDTO userno = mapService.getUserno(mapDTO);
			PointDTO pointDTO = pointService.selectPointInfo(userno);
			pointDTO.setUserDTO(userno);
			log.info(pointDTO.toString());
			pointService.updateUserPointno(pointDTO);
			
			PointChargeDTO pointchargeInfo = new PointChargeDTO();
			pointchargeInfo.setPoint_increase(5000);
			pointchargeInfo.setPoint_charge_log("[ 게시물 등록 ] 추가 포인트");
			pointchargeInfo.setPointDTO(pointDTO);
			log.info(pointchargeInfo.toString());
			
			pointService.insertPointCharge(pointchargeInfo);
			pointService.updatePointIncrease(pointchargeInfo);
			/*포인트 추가 끝*/
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//redirect할 url넘겨주기
		return Long.toString(mapDTO.getMap_no());
	}

	
	/*
	@RequestMapping(value="/coursemake", method=RequestMethod.POST)
	@ResponseBody
	public String getAllData(@RequestParam(value="placeInfos[]") List<Map<String, Object>> placeInfos,
			@RequestParam(value="mapInfo") Map<String, Object> mapInfo) {
		
		
		log.info("[맵리스트]\n");
		log.info(mapInfo.toString());
		
		
		log.info("[장소리스트]\n");
		for(Map<String, Object> place : placeInfos) {
			log.info(place.toString());
		}
		
		
		for(Map<String, Object> map : resultMap) {
			log.info("[좌표리스트] : " + map.get("place_lat") + "," + map.get("place_lng"));
			log.info("[도로명]" + (String)map.get("place_loadaddr"));
			log.info("[지번]" + (String)map.get("place_addr"));
			log.info("[장소]" + (String)map.get("place_name"));
			log.info("[순번]" + map.get("place_course_no"));
			log.info("[이미지]" + (String)map.get("place_photo"));
			log.info("[내용]" + (String)map.get("place_content"));
			
			//mapService.makeCourse();
			
		}
		
		return "success";
	}
	*/
	
	@GetMapping("/coursedraw/{mapno}")
	public ModelAndView courseDraw(@PathVariable("mapno") String mapno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		log.info("[drawer map번호] : " + mapno);
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userInfo");
		if(userDTO == null) {
			mav.setViewName("result");
			mav.addObject("msg", "로그인하세요");
			mav.addObject("url", "/board/login");
			return mav;
		} //else 맵 구매자 혹은 등록자인지 검증 필수
		
		
		try {
			MapDTO mapDTO = mapService.getMapForMapNo(Long.parseLong(mapno));
			log.info(mapDTO.toString());
			List<PlaceDTO> placeList = mapService.getPlaceListForMapNo(Long.parseLong(mapno));
			List<RouteDTO> routeList = mapService.getRouteListForMapNo(Long.parseLong(mapno));
			
			UserDTO userno = mapService.getUserno(mapDTO);
			UserDTO userInfo = mapService.getUserList(userno);
			log.info(userInfo.toString());
			mav.setViewName("coursedrawer");
			mav.addObject("userInfo", userInfo);
			mav.addObject("mapInfo", mapDTO);
			mav.addObject("placeList", placeList);
			mav.addObject("routeList", routeList);
			log.info(placeList.toString());
			log.info(routeList.toString());
		} catch(Exception e) {
			log.info(e.getMessage());
			mav.setViewName("result");
			mav.addObject("msg", "맵정보를 불러오는데 실패했습니다");
			mav.addObject("url", "redirect:main");
		}
	
		return mav;
	}
	
	
}
