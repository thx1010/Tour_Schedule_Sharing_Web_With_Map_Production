package net.developia.board.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import lombok.extern.slf4j.*;
import net.developia.board.dao.*;
import net.developia.board.dto.*;

@Slf4j
@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserDTO login(UserDTO userDTO) throws Exception {
	try {
		UserDTO userInfo = userDAO.login(userDTO);
		if (userInfo == null) {
			throw new RuntimeException("아이디 혹은 비밀번호가 틀립니다.");
		}
		return userInfo;
	} catch (Exception e) {
		log.info(e.getMessage());
		throw e;
	}
	}

	@Override
	public void signup(UserDTO userDTO) throws Exception {
		try {
			userDAO.signup(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}
