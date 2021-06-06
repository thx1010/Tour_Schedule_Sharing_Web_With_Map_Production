package net.developia.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import net.developia.board.dto.AdminDTO;
import net.developia.board.dto.GradeDTO;
import net.developia.board.dto.GradenumDTO;
import net.developia.board.dto.MapDTO;
import net.developia.board.dto.NoticeDTO;
import net.developia.board.dto.PageDTO;
import net.developia.board.dto.PlaceDTO;
import net.developia.board.dto.PointDTO;
import net.developia.board.dto.PointTransactionLogDTO;
import net.developia.board.dto.ThemeDTO;
import net.developia.board.dto.UserDTO;

public interface AdminDAO {

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

	List<UserDTO> getUserInfoForPage(PageDTO pageDTO) throws SQLException;

	List<GradeDTO> getGradeList() throws SQLException;

	long getSearchedMemberCount(String keyword) throws SQLException;

	List<UserDTO> getSearchedUserInfoForPage(Map<String, Object> param) throws SQLException;
	
	void updatePermit(MapDTO mapDTO) throws Exception;

	void updateReject(MapDTO mapDTO) throws Exception;

	List<MapDTO> getPermitMapList() throws Exception;

	List<MapDTO> getRejectMapList() throws Exception;

	void insertNotice(NoticeDTO noticedto) throws Exception;

	List<NoticeDTO> selectNotice() throws Exception;
	
}
