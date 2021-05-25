package net.developia.board.dao;

import net.developia.board.dto.*;

public interface AdminDAO {

	AdminDTO adminLogin(AdminDTO adminDTO) throws Exception;

	PointDTO getpointAccount() throws Exception;

	int getMemberCount() throws Exception;

	int getCategoryCount() throws Exception;

	GradenumDTO getGradenum() throws Exception;
	
}
