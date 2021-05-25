package net.developia.board.service;

import net.developia.board.dto.*;

public interface PointService {

	UserDTO selectUserInfo(UserDTO userDTO) throws Exception;

	void createPoint() throws Exception;

	PointDTO selectPointInfo(UserDTO userno) throws Exception;

	void updateUserPointno(PointDTO pointDTO) throws Exception;

	void insertPointCharge(PointChargeDTO pointchargeInfo) throws Exception;

	void insertPointSpend(PointSpendDTO pointspendInfo) throws Exception;

	void updatePointIncrease(PointChargeDTO pointchargeInfo) throws Exception;

	void updatePointDecrease(PointSpendDTO pointspendInfo) throws Exception;

}
