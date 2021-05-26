package net.developia.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dto.PointDTO;
import net.developia.board.dto.ThemeDTO;
import net.developia.board.dto.UserDTO;
import net.developia.board.service.MainService;
import net.developia.board.service.ThemeService;

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
	
	@GetMapping(value="/newlist")
	public ModelAndView newlist() throws Exception {
		return new ModelAndView("newlist");
	}
	
	@GetMapping(value="/bestlist")
	public ModelAndView bestlist() throws Exception {
		return new ModelAndView("bestlist");
	}
	
	@GetMapping(value="/randomlist")
	public ModelAndView randomlist() throws Exception {
		return new ModelAndView("randomlist");
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
}
