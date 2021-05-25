package net.developia.board.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import lombok.extern.slf4j.*;
import net.developia.board.dao.*;
import net.developia.board.dto.*;

@Slf4j
@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public List<UserDTO> getUserList(UserDTO userDTO) throws Exception {
		try {
			return mainDAO.getUserList(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<PointDTO> getPointList(UserDTO userDTO) throws Exception {
		try {
			return mainDAO.getPointList(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

}
