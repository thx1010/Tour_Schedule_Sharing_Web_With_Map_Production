package net.developia.board.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import lombok.extern.slf4j.*;
import net.developia.board.dao.*;
import net.developia.board.dto.*;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public AdminDTO adminLogin(AdminDTO adminDTO) throws Exception {
		try {
			AdminDTO adminInfo = adminDAO.adminLogin(adminDTO);
			if (adminInfo == null) {
				throw new RuntimeException("아이디 혹은 비밀번호가 틀립니다.");
			}
			return adminInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}
