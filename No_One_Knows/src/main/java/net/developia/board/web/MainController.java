package net.developia.board.web;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import lombok.extern.slf4j.*;
import net.developia.board.dto.*;
import net.developia.board.service.*;

@Slf4j
@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private ThemeService themeService;
	
	@Autowired
	private PointService pointService;
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping(value="/main")
	public ModelAndView main(Model model) throws Exception {
		List<NoticeDTO> noticelist = adminService.selectNotice();
		NoticeDTO noticecount = mainService.selectNoticeCount();
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("noticecount", noticecount);
		return new ModelAndView("main");
	}
	
	@GetMapping(value = "/main/origin", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapRegisterDTO> main_origin() throws Exception {
		List<MapRegisterDTO> mainInfoList = mainService.getMapList();
		return mainInfoList;
	}
	
	@GetMapping(value = "/main/viewmore", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapRegisterDTO> main_viewmore() throws Exception {
		List<MapRegisterDTO> mainInfoList = mainService.getMapViewmoreList();
		return mainInfoList;
	}
	
	@GetMapping(value = "/cartpage/cartlist/search/{searchKeyword}/{userno}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> main_new(@PathVariable String searchKeyword,
			@PathVariable long userno
			/*@PathVariable long pageno*/) throws Exception {
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(userno);
		log.info("[CartSearch] userInfo : {}", userDTO);
		
		//PageDTO pageDTO = new PageDTO();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("user", userDTO);
		param.put("keyword", searchKeyword);
		
		long count = mainService.countCartMapForKeyword(param);
		
		
		//pageDTO.setTotalArticle(count);		
		//pageDTO.setEachArticlePerPage(5);
		//pageDTO.setPageBlock(10);		
		//pageDTO.setCurrentPage(pageno);
		//pageDTO.calculatePage();
		//param.put("page", pageDTO);
		
		//log.info("[Cartsys] 페이지 정보 : {}", pageDTO);
		log.info("[Cartsys] 토탈 장바구니 개수: : {}", count);
		List<MapDTO> cartList = mainService.getCartContentForKeyword(param);
				
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("cartList", cartList);
		//data.put("pageDTO", pageDTO);
		
		return data;
	}
	
	@GetMapping(value = "/main/newlist", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapRegisterDTO> main_new() throws Exception {
		List<MapRegisterDTO> mainInfoList = mainService.getMapNewList();
		return mainInfoList;
	}
	
	
	@GetMapping(value = "/main/bestlist", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapRegisterDTO> main_best() throws Exception {
		List<MapRegisterDTO> mainInfoList = mainService.getMapBestList();
		return mainInfoList;
	}
	
	@GetMapping(value = "/main/mylist/")
	@ResponseBody
	public ModelAndView main_mylist() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("result");
		mav.addObject("msg", "로그인을 해주세요");
		mav.addObject("url", "/board/main");
		return mav;
	}
	
	@GetMapping(value = "/main/mylist/{theme_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapRegisterDTO> main_my(@ModelAttribute ThemeDTO themeDTO) throws Exception {
		List<MapRegisterDTO> mainInfoList = mainService.getMapMyList(themeDTO);
		return mainInfoList;
	}
	@RequestMapping(value = "/main/detailmodal/{map_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<PlaceDTO> main_detailmodal(
			@ModelAttribute MapDTO mapDTO) throws Exception {
		List<PlaceDTO> imageslide = mainService.getImageSlide(mapDTO);
		return imageslide;
	}
	
	@RequestMapping(value = "/main/mapdata/{map_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapRegisterDTO> main_mapdata(
			@ModelAttribute MapDTO mapDTO) throws Exception {
		List<MapRegisterDTO> mapdata = mainService.getMapData(mapDTO);
		return mapdata;
	}
	
	@RequestMapping(value = "/main/cart/{map_no}/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ModelAndView main_addtocart(
			@ModelAttribute MapRegisterDTO mapregisterDTO) throws Exception {

		mainService.addtoCart(mapregisterDTO);
		return new ModelAndView("main");
	}
	
	@RequestMapping(value = "/main/like/{map_no}/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapRegisterDTO> main_addtolike(
			@ModelAttribute MapRegisterDTO mapregisterDTO) throws Exception {
		mainService.addtoLike(mapregisterDTO);
		mainService.updateLikeCount(mapregisterDTO);
		List<MapRegisterDTO> mainInfoList = mainService.getMapList();
		return mainInfoList;
	}
	
	@GetMapping(value="/likepage")
	public ModelAndView likepage() throws Exception {
		return new ModelAndView("likepage");
	}
	
	@RequestMapping(value = "/likepage/likelist/{user_no}/{page_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> likepage_addContent(
			@ModelAttribute UserDTO userno, @PathVariable long page_no) throws Exception {
		//List<MapDTO> mainInfoList = mainService.getLikeContent(userno);
		
		PageDTO pageDTO = new PageDTO();
		
		log.info("[CartSys] 유저정보 : {}", userno.toString());
		long count = mainService.countLikeMap(userno);
		
		pageDTO.setTotalArticle(count);		//조건에 맞는 총 data 개수
		pageDTO.setEachArticlePerPage(5);	//한 페이지당 data 개수
		pageDTO.setPageBlock(10);			//보여줄 페이지 개수
		pageDTO.setCurrentPage(page_no);	//현재 페이지
		pageDTO.calculatePage();
		log.info("[Cartsys] 페이지 정보 : {}", pageDTO);
		log.info("[Cartsys] 토탈 찜 개수: : {}", count);
		//List<MapDTO> cartList = mainService.getCartContent(userno);
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("page", pageDTO);
		param.put("user", userno);
		
		List<MapDTO> likeList = mainService.getLikeContentForPage(param);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("likeList", likeList);
		data.put("pageDTO", pageDTO);
		
		return data;
	}
	
	@RequestMapping(value = "/likepage/category", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ThemeDTO> likepage_addCategory() throws Exception {
		List<ThemeDTO> categoryList = mainService.getCategoryContent();
		return categoryList;
	}
	
	@RequestMapping(value = "/likepage/category/{theme_no}/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapDTO> likepage_selectCategory(
			@ModelAttribute MapRegisterDTO categoryno) throws Exception {
		 List<MapDTO> categoryList = mainService.classifyCategory(categoryno);
		return categoryList;
	}
	
	@RequestMapping(value = "/likepage/delete/{map_no}/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapDTO> likepage_delete(
			@ModelAttribute MapRegisterDTO likeinfo) throws Exception {
		 mainService.deleteLike(likeinfo);
		 List<MapDTO> mainInfoList = mainService.getLikedeleteContent(likeinfo);
		 return mainInfoList;
	}
	
	@RequestMapping(value = "/likepage/gotocart/{map_no}/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapDTO> likepage_gotocart(
			@ModelAttribute MapRegisterDTO likeinfo) throws Exception {
		 mainService.deleteLike(likeinfo);
		 mainService.addtoCart(likeinfo);
		 List<MapDTO> mainInfoList = mainService.getLikedeleteContent(likeinfo);
		 return mainInfoList;
	}
	
	@GetMapping(value="/mypage/")
	public ModelAndView mypage2() throws Exception {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("result");
			mav.addObject("msg", "로그인을 해주세요");
			mav.addObject("url", "/board/login");
			return mav;
	}
	
	@GetMapping(value="/mypage/{user_no}")
	public ModelAndView mypage(@ModelAttribute UserDTO userDTO
							, Model model
							, @PathVariable long user_no) throws Exception {
		log.info(userDTO.toString());
		try {
			userDTO.setUser_no(user_no);
			List<UserDTO> userlist = mainService.getUserList(userDTO);
			log.info(userlist.toString());
			List<PointDTO> pointlist = mainService.getPointList(userDTO);
			log.info(pointlist.toString());
			List<PointChargeDTO> pointchargelist = mainService.getPointChargeList(userDTO);
			List<PointSpendDTO> pointspendlist = mainService.getPointSpendList(userDTO);
			List<MapDTO> mapstatuslist = mainService.getMapStatusList(userDTO);
			List<MapDTO> mappurchaselist = mainService.getMapPurchaseList(userDTO);
			model.addAttribute("userlist", userlist);
			model.addAttribute("pointlist", pointlist);
			model.addAttribute("pointchargelist", pointchargelist);
			model.addAttribute("pointspendlist", pointspendlist);
			model.addAttribute("mapstatuslist", mapstatuslist);
			model.addAttribute("mappurchaselist", mappurchaselist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("mypage");
	}
	
	
	@GetMapping(value="/cartpage")
	public ModelAndView cartpage(Model model) throws Exception {
		List<NoticeDTO> noticelist = adminService.selectNotice();
		NoticeDTO noticecount = mainService.selectNoticeCount();
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("noticecount", noticecount);
		return new ModelAndView("cartpage");
	}
	
	@RequestMapping(value = "/cartpage/cartlist/{user_no}/{page_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public /*List<MapDTO>*/Map<String, Object> cartpage_addContent(
			@ModelAttribute UserDTO userno, @PathVariable long page_no) throws Exception {
		PageDTO pageDTO = new PageDTO();
		
		log.info("[CartSys] 유저정보 : {}", userno.toString());
		long count = mainService.countCartMap(userno);
		
		pageDTO.setTotalArticle(count);		//조건에 맞는 총 data 개수
		pageDTO.setEachArticlePerPage(5);	//한 페이지당 data 개수
		pageDTO.setPageBlock(10);			//보여줄 페이지 개수
		pageDTO.setCurrentPage(page_no);	//현재 페이지
		pageDTO.calculatePage();
		log.info("[Cartsys] 페이지 정보 : {}", pageDTO);
		log.info("[Cartsys] 토탈 장바구니 개수: : {}", count);
		//List<MapDTO> cartList = mainService.getCartContent(userno);
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("page", pageDTO);
		param.put("user", userno);
		
		List<MapDTO> cartList = mainService.getCartContentForPage(param);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("cartList", cartList);
		data.put("pageDTO", pageDTO);
		return data;
	}
	
	@GetMapping(value = "/cartpage/payformaps/{map_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapDTO> paymodal_addContent(
			@ModelAttribute MapDTO mapdto) throws Exception {
		List<MapDTO> mainInfoList = mainService.getPayModalContent(mapdto);
		return mainInfoList;
	}
	
	@RequestMapping(value = "/cartpage/paybutton/{map_no}/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ModelAndView  paymodal_purchase(
			@ModelAttribute MapPurchaseDTO purchasedto) throws Exception {
		mainService.insertintoPurchase(purchasedto);
		//결제 프로세스
		long user_no = purchasedto.getUser_no();
		UserDTO userno = new UserDTO();
		userno.setUser_no(user_no);
		PointDTO pointDTO = pointService.selectPointInfo(userno);
		pointDTO.setUserDTO(userno);
		PointSpendDTO pointspendInfo = new PointSpendDTO();
		pointspendInfo.setPoint_decrease(3000);
		pointspendInfo.setPoint_spend_log("[게시물 구매] 포인트 결제");
		pointspendInfo.setPointDTO(pointDTO);
		pointService.insertPointSpend(pointspendInfo);
		pointService.updatePointDecrease(pointspendInfo);
		
		return new ModelAndView("cartpage");
	}
	
	@RequestMapping(value = "/cartpage/delete/{map_no}/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapDTO> paymodal_deleteContent(
			@ModelAttribute MapPurchaseDTO purchasedto) throws Exception {
		mainService.deleteCart(purchasedto);
		long number = purchasedto.getUser_no();
		UserDTO userno = new UserDTO();
		userno.setUser_no(number);
		List<MapDTO> mainInfoList = mainService.getCartContent(userno);
		return mainInfoList;
	}
	
	@GetMapping(value="/coursemaker")
	public ModelAndView coursemaker() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<ThemeDTO> themeList = null;
		try {
			themeList = themeService.getThemeList();
		} catch (Exception e) {
			
		}
		
		mav.setViewName("coursemaker");
		mav.addObject("themeList", themeList);
		return mav;
	}
	
	@GetMapping(value="/chatroom")
	public ModelAndView chatroom(Model model) throws Exception {
		List<NoticeDTO> noticelist = adminService.selectNotice();
		NoticeDTO noticecount = mainService.selectNoticeCount();
		
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("noticecount", noticecount);
		return new ModelAndView("chatroom");
	}
	
	@GetMapping(value = "/chatroom/getroom", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ChatRoomDTO> chat_getroom() throws Exception {
		List<ChatRoomDTO> chatroom = mainService.getChatroom();
		return chatroom;
	}
	
	@RequestMapping(value = "/chatroom/payforcommu/{room_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ChatRoomDTO> chat_getroominfo(@ModelAttribute ChatRoomDTO chatrooom) throws Exception {
		List<ChatRoomDTO> roominfo = mainService.getroomInfo(chatrooom);
		return roominfo;
	}
	
	@RequestMapping(value = "/chatroom/paybutton/{user_no}/{room_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ModelAndView chat_paycommunity(@ModelAttribute UserDTO userdto, @ModelAttribute ChatRoomDTO chatroom) throws Exception {
		long user_no = userdto.getUser_no();
		UserDTO userno = new UserDTO();
		userno.setUser_no(user_no);
		PointDTO pointDTO = pointService.selectPointInfo(userno);
		pointDTO.setUserDTO(userno);
		PointSpendDTO pointspendInfo = new PointSpendDTO();
		pointspendInfo.setPoint_decrease(5000);
		pointspendInfo.setPoint_spend_log("[커뮤니티 가입] 포인트 결제");
		pointspendInfo.setPointDTO(pointDTO);
		pointService.insertPointSpend(pointspendInfo);
		pointService.updatePointDecrease(pointspendInfo);
		long room = chatroom.getRoom_no();
		RegisterChatRoomDTO registerchatroom = new RegisterChatRoomDTO();
		registerchatroom.setRoom_no(room);
		registerchatroom.setUser_no(user_no);
		mainService.insertRegisterRoom(registerchatroom);
		
		return new ModelAndView("chatroom");
	}
	
	@RequestMapping(value = "/main/message/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ChatMessageDTO> chat_message(@ModelAttribute ChatMessageDTO message) throws Exception {
		List<ChatMessageDTO> messageinfo = mainService.getMessageInfo(message);
		return messageinfo;
	}
	
	@RequestMapping(value = "/main/messagecount/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ChatMessageDTO> chat_messagecount(@ModelAttribute ChatMessageDTO message) throws Exception {
		List<ChatMessageDTO> messageinfo = mainService.getMessageCountInfo(message);
		return messageinfo;
	}
}
