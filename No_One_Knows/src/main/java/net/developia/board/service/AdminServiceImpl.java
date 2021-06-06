package net.developia.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dao.AdminDAO;
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

	@Override
	public PointDTO getpointAccount() throws Exception {
		try {
			PointDTO pointaccount = adminDAO.getpointAccount();
			return pointaccount;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public int getMemberCount() throws Exception {
		try {
			int membercount = adminDAO.getMemberCount();
			return membercount;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public int getCategoryCount() throws Exception {
		try {
			int categorycount = adminDAO.getCategoryCount();
			return categorycount;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public GradenumDTO getGradenum() throws Exception {
		try {
			GradenumDTO gradenumdto = adminDAO.getGradenum();
			return gradenumdto;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<UserDTO> getUserPointList() throws Exception {
		try {
			List<UserDTO> userlist = adminDAO.getUserPointList();
			return userlist;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<UserDTO> getUserDetail(UserDTO userDTO) throws Exception {
		try {
			List<UserDTO> userinfo = adminDAO.getUserDetail(userDTO);
			return userinfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<PointTransactionLogDTO> getUserTransactionInfo(UserDTO userDTO) throws Exception {
		try {
			List<PointTransactionLogDTO> usertransactioninfo = adminDAO.getUserTransactionInfo(userDTO);
			return usertransactioninfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<UserDTO> selectUsergradeInfo() throws Exception {
		try {
			List<UserDTO>  usergradeinfo = adminDAO.selectUsergradeInfo();
			return usergradeinfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateUserGrade(UserDTO userDTO) throws Exception {
		try {
			adminDAO.updateUserGrade(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void deleteMember(UserDTO userDTO) throws Exception {
		try {
			adminDAO.deleteMember(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<ThemeDTO> selectCategoryList() throws Exception {
		try {
			List<ThemeDTO>  themeinfo = adminDAO.selectCategoryList();
			return themeinfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void addCategory(ThemeDTO themeDTO) throws Exception {
		try {
			adminDAO.addCategory(themeDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateCategory(ThemeDTO themeDTO) throws Exception {
		try {
			adminDAO.updateCategory(themeDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void deleteCategory(ThemeDTO themeDTO) throws Exception {
		try {
			adminDAO.deleteCategory(themeDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getMapList() throws Exception {
		try {
			List<MapDTO> maplist = adminDAO.getMapList();
			return maplist;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getMapDetail(MapDTO mapDTO) throws Exception {
		try {
			List<MapDTO> maplist = adminDAO.getMapDetail(mapDTO);
			return maplist;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<PlaceDTO> getPlaceDetail(MapDTO mapDTO) throws Exception {
		try {
			List<PlaceDTO> placelist = adminDAO.getPlaceDetail(mapDTO);
			return placelist;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
	@Override
	public List<UserDTO> getUserInfoForPage(PageDTO pageDTO) throws Exception {
		List<UserDTO> userList = null;
		try {
			userList = adminDAO.getUserInfoForPage(pageDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return userList;
	}

	@Override
	public List<GradeDTO> getGradeList() throws Exception {
		List<GradeDTO> gradeList = null;
		try {
			gradeList = adminDAO.getGradeList();
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return gradeList;
	}

	@Override
	public long getSearchedMemberCount(String keyword) throws Exception {
		long count = 0;
		try {
			count = adminDAO.getSearchedMemberCount(keyword);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return count;
	}

	@Override
	public List<UserDTO> getSearchedUserInfoForPage(Map<String, Object> param) throws Exception {
		List<UserDTO> searchedUserList = null;
		try {
			searchedUserList = adminDAO.getSearchedUserInfoForPage(param);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return searchedUserList;
	}


	@Override
	public void updatePermit(MapDTO mapDTO) throws Exception {
		try {
			adminDAO.updatePermit(mapDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateReject(MapDTO mapDTO) throws Exception {
		try {
			adminDAO.updateReject(mapDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getPermitMapList() throws Exception {
		try {
			List<MapDTO> maplist = adminDAO.getPermitMapList();
			return maplist;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getRejectMapList() throws Exception {
		try {
			List<MapDTO> maplist = adminDAO.getRejectMapList();
			return maplist;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void insertNotice(NoticeDTO noticedto) throws Exception {
		try {
			adminDAO.insertNotice(noticedto);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<NoticeDTO> selectNotice() throws Exception {
		try {
			List<NoticeDTO> noticelist = adminDAO.selectNotice();
			return noticelist;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}
