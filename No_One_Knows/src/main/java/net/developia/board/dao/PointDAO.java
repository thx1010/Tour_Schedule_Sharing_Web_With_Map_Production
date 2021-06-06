package net.developia.board.dao;

import net.developia.board.dto.*;

public interface PointDAO {

	UserDTO selectUserInfo(UserDTO userDTO) throws Exception;

	void createPoint() throws Exception;

	PointDTO selectPointInfo(UserDTO userno) throws Exception;

	void updateUserPointno(PointDTO pointDTO) throws Exception;

	void insertPointCharge(PointChargeDTO pointchargeInfo) throws Exception;

	void insertPointSpend(PointSpendDTO pointspendInfo) throws Exception;

	void updatePointIncrease(PointChargeDTO pointchargeDTO) throws Exception;

	void updatePointDecrease(PointSpendDTO pointspendDTO) throws Exception;

	UserDTO getUserInfobyNo(UserDTO userDTO) throws Exception;

}
