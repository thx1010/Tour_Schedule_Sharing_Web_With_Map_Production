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
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PointService pointService;
	
	@GetMapping(value="/login")
	public ModelAndView login() throws Exception {
		return new ModelAndView("login");
	}	
	
	@PostMapping(value="/login")
	public ModelAndView login(@ModelAttribute UserDTO userDTO, HttpSession session) {
		log.info(userDTO.toString());
		ModelAndView mav = new ModelAndView();
		try {
			UserDTO userInfo = userService.login(userDTO);
			log.info(userInfo.toString());

			session.setAttribute("userInfo", userInfo);
			mav.setViewName("result");
			mav.addObject("msg", "로그인 성공했습니다.");
			mav.addObject("url", "main");
		} catch (Exception e) {
			log.info(e.getMessage());
			e.printStackTrace();
			mav.setViewName("result");
			mav.addObject("msg", "잘못된 사용자입니다. 다시 시도해주세요.");
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}
	
	@GetMapping(value="/signup")
	public ModelAndView signup() throws Exception {
		return new ModelAndView("signup");
	}
	
	@PostMapping(value="/signup")
	public ModelAndView signup(@ModelAttribute UserDTO userDTO) throws Exception {
		log.info(userDTO.toString());
		ModelAndView mav = new ModelAndView();
		try {
			pointService.createPoint();
			log.info("[signup] user info : " + userDTO);
			
			userService.signup(userDTO);
			UserDTO userno = pointService.selectUserInfo(userDTO);
			
			log.info("유저 인포 불러옴"+ userno.toString());
			PointDTO pointDTO = pointService.selectPointInfo(userno);
			
			pointDTO.setUserDTO(userno);
			log.info(pointDTO.toString());
			pointService.updateUserPointno(pointDTO);
			
			PointChargeDTO pointchargeInfo = new PointChargeDTO();
			pointchargeInfo.setPoint_increase(2000);
			pointchargeInfo.setPoint_charge_log("회원가입 포인트 적립");
			pointchargeInfo.setPointDTO(pointDTO);
			log.info(pointchargeInfo.toString());
			
			/*
			PointSpendDTO pointspendInfo = new PointSpendDTO();
			pointspendInfo.setPoint_decrease(0);
			pointspendInfo.setPoint_spend_log("회원가입 포인트 유지");
			pointspendInfo.setPointDTO(pointDTO);
			log.info(pointspendInfo.toString());
			*/
			pointService.insertPointCharge(pointchargeInfo);
			//pointService.insertPointSpend(pointspendInfo);

			pointService.updatePointIncrease(pointchargeInfo);
			//pointService.updatePointDecrease(pointspendInfo);
			
			mav.setViewName("result");
			mav.addObject("msg", "회원가입 포인트 2000P가 적립되었어요 ! ");
			mav.addObject("url", "login");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("result");
			mav.addObject("msg", "회원가입 실패했습니다. 다시 시도해주세요.");
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}
	
	@GetMapping(value="/logout")
	public ModelAndView logout() throws Exception {
		return new ModelAndView("logout");
	}

}
