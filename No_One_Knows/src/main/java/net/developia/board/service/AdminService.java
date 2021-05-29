package net.developia.board.service;

import java.util.*;

import net.developia.board.dto.*;

public interface AdminService {

	AdminDTO adminLogin(AdminDTO adminDTO) throws Exception;

	PointDTO getpointAccount() throws Exception;

	int getMemberCount() throws Exception;

	int getCategoryCount() throws Exception;

	GradenumDTO getGradenum() throws Exception;

	List<UserDTO> getUserPointList() throws Exception;

	List<UserDTO> getUserDetail(UserDTO userDTO) throws Exception;

	List<PointTransactionLogDTO> getUserTransactionInfo(UserDTO userDTO) throws Exception;

	List<UserDTO> selectUsergradeInfo() throws Exception;

	void updateUserGrade(UserDTO userDTO) throws Exception;

	void deleteMember(UserDTO userDTO) throws Exception;

	List<ThemeDTO> selectCategoryList() throws Exception;

	void addCategory(ThemeDTO themeDTO) throws Exception;

	void updateCategory(ThemeDTO themeDTO) throws Exception;

	void deleteCategory(ThemeDTO themeDTO) throws Exception;

	List<MapDTO> getMapList() throws Exception;

	List<MapDTO> getMapDetail(MapDTO mapDTO) throws Exception;

	List<PlaceDTO> getPlaceDetail(MapDTO mapDTO) throws Exception;
	
}
