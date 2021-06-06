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
	List<UserDTO> getUserInfoForPage(PageDTO pageDTO) throws Exception;

	List<GradeDTO> getGradeList() throws Exception;

	long getSearchedMemberCount(String keyword) throws Exception;

	List<UserDTO> getSearchedUserInfoForPage(Map<String, Object> param) throws Exception;
	void updatePermit(MapDTO mapDTO) throws Exception;

	void updateReject(MapDTO mapDTO) throws Exception;

	List<MapDTO> getPermitMapList() throws Exception;

	List<MapDTO> getRejectMapList() throws Exception;

	void insertNotice(NoticeDTO noticedto) throws Exception;

	List<NoticeDTO> selectNotice() throws Exception;
	
}
