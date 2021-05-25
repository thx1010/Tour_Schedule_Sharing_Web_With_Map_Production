package net.developia.board.web;

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
			int grade_first_partio = gradenumdto.getGrade_first() / membercount * 100;
			int grade_second_partio = gradenumdto.getGrade_second() / membercount * 100;
			int grade_third_partio = gradenumdto.getGrade_third() / membercount * 100;
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
	
	@GetMapping(value="/adminmember")
	public ModelAndView adminmember() throws Exception {
		return new ModelAndView("adminmember");
	}
	
	@GetMapping(value="/adminarticle")
	public ModelAndView adminarticle() throws Exception {
		return new ModelAndView("adminarticle");
	}
	
	@GetMapping(value="/admincategory")
	public ModelAndView admincategory() throws Exception {
		return new ModelAndView("admincategory");
	}
}
