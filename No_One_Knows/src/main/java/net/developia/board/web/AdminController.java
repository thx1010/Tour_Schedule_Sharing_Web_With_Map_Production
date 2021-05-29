package net.developia.board.web;

import java.util.*;

import javax.servlet.http.*;

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
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PointService pointService;
	
	
	@GetMapping(value="/adminlogin")
	public ModelAndView adminlogin() throws Exception {
		return new ModelAndView("adminlogin");
	}
	
	@PostMapping(value="/adminlogin")
	public ModelAndView login(@ModelAttribute AdminDTO adminDTO, HttpSession session) {
		log.info(adminDTO.toString());
		ModelAndView mav = new ModelAndView();
		try {
			AdminDTO adminInfo = adminService.adminLogin(adminDTO);
			log.info(adminInfo.toString());

			session.setAttribute("adminInfo", adminInfo);
			mav.setViewName("result");
			mav.addObject("msg", "관리자 로그인 성공했습니다.");
			mav.addObject("url", "adminmain");
		} catch (Exception e) {
			log.info(e.getMessage());
			e.printStackTrace();
			mav.setViewName("result");
			mav.addObject("msg", "잘못된 관리자 로그인 입니다. 다시 시도해주세요.");
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}
	
	@GetMapping(value="/adminmain")
	public ModelAndView adminmain(Model model) throws Exception {
		try {
			PointDTO pointaccount = adminService.getpointAccount();
			int membercount = adminService.getMemberCount();
			int categorycount = adminService.getCategoryCount();
			GradenumDTO gradenumdto = adminService.getGradenum();
			log.info(gradenumdto.toString());
			float grade_first_partio = (float)gradenumdto.getGrade_first() / (float)membercount * 100;
			float grade_second_partio = (float)gradenumdto.getGrade_second() / (float)membercount * 100;
			float grade_third_partio = (float)gradenumdto.getGrade_third() / (float)membercount * 100;
			model.addAttribute("pointaccount", pointaccount);
			model.addAttribute("membercount", membercount);
			model.addAttribute("categorycount", categorycount);
			model.addAttribute("grade_first_partio", grade_first_partio);
			model.addAttribute("grade_second_partio", grade_second_partio);
			model.addAttribute("grade_third_partio", grade_third_partio);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("adminmain");
	}
	
	@GetMapping(value="/adminpoint")
	public ModelAndView adminpoint() throws Exception {
		return new ModelAndView("adminpoint");
	}
	
	@GetMapping(value = "/adminpoint/userinfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<UserDTO> content_list() throws Exception {
		List<UserDTO> userlist = adminService.getUserPointList();
		log.info("유저 정보 값 받아옴");
		log.info(userlist.toString());
		return userlist;
	}
	
	@RequestMapping(value="/adminpoint/userinfo/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<UserDTO> adminpoint_userdetailprint(
			@ModelAttribute UserDTO userDTO) throws Exception {
		try {
			log.info("userDTO_print()메소드 수행");
			log.info(userDTO.toString());
			List<UserDTO> userdetailinfo = adminService.getUserDetail(userDTO);
			log.info(userdetailinfo.toString());
			 return userdetailinfo;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value="/adminpoint/usertransaction/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<PointTransactionLogDTO> adminpoint_usertransactionprint(
			@ModelAttribute UserDTO userDTO) throws Exception {
		try {
			log.info("userDTO_print()메소드 수행");
			log.info(userDTO.toString());
			List<PointTransactionLogDTO> usertransactioninfo = adminService.getUserTransactionInfo(userDTO);
			log.info(usertransactioninfo.toString());
			 return usertransactioninfo;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value="/adminpoint/userpoint/{user_no}/{point_increase}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<PointTransactionLogDTO> adminpoint_userpoint(
			@ModelAttribute UserDTO userDTO,
			@ModelAttribute PointChargeDTO pointchargeDTO
			) throws Exception {
		try {
			log.info("userDTO_print()메소드 수행");
			log.info(userDTO.toString());
			
			//포인트제 루틴
			UserDTO userno = pointService.getUserInfobyNo(userDTO);
			log.info(userno.toString());
			PointDTO pointDTO = pointService.selectPointInfo(userno);
			pointDTO.setUserDTO(userno);
			log.info(pointDTO.toString());
			pointService.updateUserPointno(pointDTO);
			
			log.info(pointchargeDTO.toString());
			long increase = pointchargeDTO.getPoint_increase();
			PointChargeDTO pointchargeInfo = new PointChargeDTO();
			pointchargeInfo.setPoint_increase(increase);
			pointchargeInfo.setPoint_charge_log("관리자 권한 이벤트 포인트");
			pointchargeInfo.setPointDTO(pointDTO);
			log.info(pointchargeInfo.toString());
			
			pointService.insertPointCharge(pointchargeInfo);
			pointService.updatePointIncrease(pointchargeInfo);
			
			return adminService.getUserTransactionInfo(userDTO);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping(value="/adminmember")
	public ModelAndView adminmember() throws Exception {
		return new ModelAndView("adminmember");
	}
	
	
	//멤버 관리 : 기본 정보 불러오기
	@GetMapping(value = "/adminmember/userinfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<UserDTO> usercontent_list() throws Exception {
		List<UserDTO> userlist = adminService.selectUsergradeInfo();
		log.info("유저 정보 값 받아옴");
		log.info(userlist.toString());
		return userlist;
	}
	
	//멤버 관리 : 상세 정보 불러오기
	@RequestMapping(value="/adminmember/userinfo/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<UserDTO> adminmember_userdetailprint(
			@ModelAttribute UserDTO userDTO) throws Exception {
		try {
			log.info("userDTO_print()메소드 수행");
			log.info(userDTO.toString());
			List<UserDTO> userdetailinfo = adminService.getUserDetail(userDTO);
			log.info(userdetailinfo.toString());
			 return userdetailinfo;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//멤버 관리 : 등급 변경
	@RequestMapping(value="/adminmember/altergrade/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<UserDTO> adminmember_usergrade(
			@ModelAttribute UserDTO userDTO
			) throws Exception { //grade_no로 전달
		try {
			log.info("userDTO_print()메소드 수행");
			log.info(userDTO.toString());
			adminService.updateUserGrade(userDTO);
			return adminService.selectUsergradeInfo();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//멤버 관리 : 탈퇴
	@DeleteMapping(value = "/adminmember/out/{user_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<UserDTO> user_delete(
			@ModelAttribute UserDTO userDTO) throws Exception {
		
		log.info("user_delete() 메소드 수행");
		log.info(userDTO.toString());
		
		adminService.deleteMember(userDTO);
		return adminService.selectUsergradeInfo();
	}
	
	@GetMapping(value="/admincategory")
	public ModelAndView admincategory() throws Exception {
		return new ModelAndView("admincategory");
	}
	
	//카테고리 관리 : 기본 정보 불러오기
	@GetMapping(value = "/admincategory/categoryinfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ThemeDTO> themecategory_list() throws Exception {
		List<ThemeDTO> categorylist = adminService.selectCategoryList();
		log.info(categorylist.toString());
		return categorylist;
	}
	
	//카테고리 관리 : 카테고리 추가
	@RequestMapping(value="/admincategory/newcategory", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ThemeDTO> themecategory_addtheme(
			@ModelAttribute ThemeDTO themeDTO
			) throws Exception { 
		try {
			log.info("themeDTO_print()메소드 수행");
			log.info(themeDTO.toString());
			adminService.addCategory(themeDTO);
			return adminService.selectCategoryList();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//카테고리 관리 : 카테고리 수정
	@RequestMapping(value="/admincategory/updatecategory", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ThemeDTO> themecategory_updatetheme(
			@ModelAttribute ThemeDTO themeDTO
			) throws Exception { //grade_no로 전달
		try {
			log.info("themeDTO_update_print()메소드 수행");
			log.info(themeDTO.toString());
			adminService.updateCategory(themeDTO);
			return adminService.selectCategoryList();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//카테고리 관리 : 카테고리 삭제
	@DeleteMapping(value = "/admincategory/deletecategory/{theme_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ThemeDTO> category_delete(
			@ModelAttribute ThemeDTO themeDTO) throws Exception {
			
		log.info("theme_delete() 메소드 수행");
		log.info(themeDTO.toString());
			
		adminService.deleteCategory(themeDTO);
		return adminService.selectCategoryList();
	}
	
	// 맵 아티클 관리
	@GetMapping(value="/adminarticle")
	public ModelAndView adminarticle() throws Exception {
		return new ModelAndView("adminarticle");
	}
	
	//맵 정보 받아오기 (리스트)
	@GetMapping(value = "/adminarticle/mapinfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapDTO> map_list() throws Exception {
		List<MapDTO> maplist = adminService.getMapList();
		log.info("유저 정보 값 받아옴");
		log.info(maplist.toString());
		return maplist;
	}
	
	// 관리 : 상세 정보 불러오기
	@RequestMapping(value="/adminarticle/mapinfo/{map_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MapDTO> map_list_detailprint(
			@ModelAttribute MapDTO mapDTO) throws Exception {
		try {
			log.info("mapDTO_print()메소드 수행");
			log.info(mapDTO.toString());
			List<MapDTO> mapdetailinfo = adminService.getMapDetail(mapDTO);
			log.info(mapdetailinfo.toString());
			 return mapdetailinfo;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//장소 상세 정보 불러오기
	@RequestMapping(value="/adminarticle/mapinfo/placeinfo/{map_no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<PlaceDTO> place_list_detailprint(
			@ModelAttribute MapDTO mapDTO) throws Exception {
		try {
			log.info("mapDTO_print()메소드 수행");
			log.info(mapDTO.toString());
			List<PlaceDTO> placedetailinfo = adminService.getPlaceDetail(mapDTO);
			log.info(placedetailinfo.toString());
			 return placedetailinfo;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
