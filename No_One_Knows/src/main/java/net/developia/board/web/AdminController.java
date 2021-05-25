package net.developia.board.web;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import lombok.extern.slf4j.*;

@Slf4j
@Controller
public class AdminController {
	@GetMapping(value="/adminlogin")
	public ModelAndView adminlogin() throws Exception {
		return new ModelAndView("adminlogin");
	}
}
