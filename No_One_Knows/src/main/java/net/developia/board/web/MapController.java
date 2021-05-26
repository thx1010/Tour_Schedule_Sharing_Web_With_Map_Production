package net.developia.board.web;

import java.util.*;

import org.json.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.*;
import net.developia.board.dto.*;
import net.developia.board.service.*;

@Slf4j
@Controller
@RequestMapping("/mapcontrol")
public class MapController {
	@Autowired
	private MapService mapService;
	
	@Autowired
	private ThemeService themeService;
	
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
	public String getAllData(@RequestBody String mapData) {
		//log.info(mapData);
		
		JSONObject jObject = new JSONObject(mapData);
		log.info("[jObject] :: " + jObject.toString());
		List<PlaceDTO> placeList = new ArrayList<PlaceDTO>();
		
		JSONArray jPlaceInfos = jObject.getJSONArray("placeInfos");
		JSONObject jMapInfo = jObject.getJSONObject("mapInfo");
		log.info("[jPlaceInfos] :: " + jPlaceInfos.toString());
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
			
			mapService.addMap(mapDTO);
			
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
			
			for(PlaceDTO place : placeList) {
				mapService.addPlace(place);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//redirect할 url넘겨주기
		return "success";
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
	
	
}
