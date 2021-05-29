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
	
	@GetMapping(value="/main")
	public ModelAndView main() throws Exception {
		return new ModelAndView("main");
	}
	
	@GetMapping(value="/likepage")
	public ModelAndView likepage() throws Exception {
		return new ModelAndView("likepage");
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
			model.addAttribute("userlist", userlist);
			model.addAttribute("pointlist", pointlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("mypage");
	}
	
	
	@GetMapping(value="/cartpage")
	public ModelAndView cartpage() throws Exception {
		return new ModelAndView("cartpage");
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
	
	@GetMapping(value="/mapdetail")
	public ModelAndView mapdetail() throws Exception {
		return new ModelAndView("mapdetail");
	}
}
