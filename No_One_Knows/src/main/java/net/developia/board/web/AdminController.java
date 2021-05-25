package net.developia.board.web;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
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
	public ModelAndView adminmain() throws Exception {
		return new ModelAndView("adminmain");
	}
}
