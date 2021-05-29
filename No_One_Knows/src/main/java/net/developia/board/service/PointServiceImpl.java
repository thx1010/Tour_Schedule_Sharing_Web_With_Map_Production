package net.developia.board.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import lombok.extern.slf4j.*;
import net.developia.board.dao.*;
import net.developia.board.dto.*;

@Slf4j
@Service
public class PointServiceImpl implements PointService{
	@Autowired
	private PointDAO pointDAO;

	@Override
	public UserDTO selectUserInfo(UserDTO userDTO) throws Exception {
		try {
			return pointDAO.selectUserInfo(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void createPoint() throws Exception {
		try {
			pointDAO.createPoint();
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public PointDTO selectPointInfo(UserDTO userno) throws Exception {
		try {
			return pointDAO.selectPointInfo(userno);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateUserPointno(PointDTO pointDTO) throws Exception {
		try {
			pointDAO.updateUserPointno(pointDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void insertPointCharge(PointChargeDTO pointchargeInfo) throws Exception {
		try {
			pointDAO.insertPointCharge(pointchargeInfo);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void insertPointSpend(PointSpendDTO pointspendInfo) throws Exception {
		try {
			pointDAO.insertPointSpend(pointspendInfo);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updatePointIncrease(PointChargeDTO pointchargeInfo) throws Exception {
		try {
			pointDAO.updatePointIncrease(pointchargeInfo);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updatePointDecrease(PointSpendDTO pointspendInfo) throws Exception {
		try {
			pointDAO.updatePointDecrease(pointspendInfo);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public UserDTO getUserInfobyNo(UserDTO userDTO) throws Exception {
		try {
			return pointDAO.getUserInfobyNo(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

}
