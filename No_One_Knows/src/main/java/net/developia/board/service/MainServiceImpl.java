package net.developia.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dao.MainDAO;
import net.developia.board.dto.ChatMessageDTO;
import net.developia.board.dto.ChatRoomDTO;
import net.developia.board.dto.MapDTO;
import net.developia.board.dto.MapPurchaseDTO;
import net.developia.board.dto.MapRegisterDTO;
import net.developia.board.dto.NoticeDTO;
import net.developia.board.dto.PlaceDTO;
import net.developia.board.dto.PointChargeDTO;
import net.developia.board.dto.PointDTO;
import net.developia.board.dto.PointSpendDTO;
import net.developia.board.dto.RegisterChatRoomDTO;
import net.developia.board.dto.ThemeDTO;
import net.developia.board.dto.UserDTO;

@Slf4j
@Service
public class MainServiceImpl implements MainService {

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

	@Override
	public List<MapRegisterDTO> getMapList() throws Exception {
		try {
			List<MapRegisterDTO> mainMapInfo = mainDAO.getMapList();
			return mainMapInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapRegisterDTO> getMapNewList() throws Exception {
		try {
			List<MapRegisterDTO> mainMapInfo = mainDAO.getMapNewList();
			return mainMapInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<PlaceDTO> getImageSlide(MapDTO mapDTO) throws Exception {
		try {
			List<PlaceDTO> imageslide = mainDAO.getImageSlide(mapDTO);
			return imageslide;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapRegisterDTO> getMapData(MapDTO mapDTO) throws Exception {
		try {
			List<MapRegisterDTO> mapdata = mainDAO.getMapData(mapDTO);
			return mapdata;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void addtoCart(MapRegisterDTO mapregisterDTO) throws Exception {
		try {
			mainDAO.addtoCart(mapregisterDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void addtoLike(MapRegisterDTO mapregisterDTO) throws Exception {
		try {
			mainDAO.addtoLike(mapregisterDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public List<MapDTO> getLikeContent(UserDTO userno) throws Exception {
		try {
			List<MapDTO> mapdata = mainDAO.getLikeContent(userno);
			return mapdata;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getCartContent(UserDTO userno) throws Exception {
		try {
			List<MapDTO> mapdata = mainDAO.getCartContent(userno);
			return mapdata;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<ThemeDTO> getCategoryContent() throws Exception {
		try {
			List<ThemeDTO> categorydata = mainDAO.getCategoryContent();
			return categorydata;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> classifyCategory(MapRegisterDTO categoryno) throws Exception {
		try {
			List<MapDTO> categorydata = mainDAO.classifyCategory(categoryno);
			return categorydata;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateLikeCount(MapRegisterDTO mapregisterDTO) throws Exception {
		try {
			mainDAO.updateLikeCount(mapregisterDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void deleteLike(MapRegisterDTO likeinfo) throws Exception {
		try {
			mainDAO.deleteLike(likeinfo);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getLikedeleteContent(MapRegisterDTO likeinfo) throws Exception {
		try {
			List<MapDTO> likedata = mainDAO.getLikedeleteContent(likeinfo);
			return likedata;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapRegisterDTO> getMapBestList() throws Exception {
		try {
			List<MapRegisterDTO> mainMapInfo = mainDAO.getMapBestList();
			return mainMapInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapRegisterDTO> getMapMyList(ThemeDTO themeDTO) throws Exception {
		try {
			List<MapRegisterDTO> mainMapInfo = mainDAO.getMapMyList(themeDTO);
			return mainMapInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapRegisterDTO> getMapViewmoreList() throws Exception {
		try {
			List<MapRegisterDTO> mainMapInfo = mainDAO.getMapViewmoreList();
			return mainMapInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<PointChargeDTO> getPointChargeList(UserDTO userDTO) throws Exception {
		try {
			List<PointChargeDTO> pointchargeInfo = mainDAO.getPointChargeList(userDTO);
			return pointchargeInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<PointSpendDTO> getPointSpendList(UserDTO userDTO) throws Exception {
		try {
			List<PointSpendDTO> pointspendInfo = mainDAO.getPointSpendList(userDTO);
			return pointspendInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getMapStatusList(UserDTO userDTO) throws Exception {
		try {
			List<MapDTO> mapstatusInfo = mainDAO.getMapStatusList(userDTO);
			return mapstatusInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getMapPurchaseList(UserDTO userDTO) throws Exception {
		try {
			List<MapDTO> mappurchaseInfo = mainDAO.getMapPurchaseList(userDTO);
			return mappurchaseInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapDTO> getPayModalContent(MapDTO mapdto) throws Exception {
		try {
			List<MapDTO> mappurchaseInfo = mainDAO.getPayModalContent(mapdto);
			return mappurchaseInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void insertintoPurchase(MapPurchaseDTO purchasedto) throws Exception {
		try {
			mainDAO.insertintoPurchase(purchasedto);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void deleteCart(MapPurchaseDTO purchasedto) throws Exception {
		try {
			mainDAO.deleteCart(purchasedto);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<ChatRoomDTO> getChatroom() throws Exception {
		try {
			List<ChatRoomDTO> chatroom = mainDAO.getChatroom();
			return chatroom;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<ChatRoomDTO> getroomInfo(ChatRoomDTO chatrooom) throws Exception {
		try {
			List<ChatRoomDTO> chatroominfo = mainDAO.getroomInfo(chatrooom);
			return chatroominfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void insertRegisterRoom(RegisterChatRoomDTO registerchatroom) throws Exception {
		try {
			mainDAO.insertRegisterRoom(registerchatroom);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<ChatMessageDTO> getMessageInfo(ChatMessageDTO message) throws Exception {
		try {
			List<ChatMessageDTO> messageinfo = mainDAO.getMessageInfo(message);
			return messageinfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<ChatMessageDTO> getMessageCountInfo(ChatMessageDTO message) throws Exception {
		try {
			List<ChatMessageDTO> messageinfo = mainDAO.getMessageCountInfo(message);
			return messageinfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public NoticeDTO selectNoticeCount() throws Exception {
		try {
			NoticeDTO cnt = mainDAO.selectNoticeCount();
			return cnt;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public long countCartMap(UserDTO userno) throws Exception {
		long count = 0;
		try {
			count = mainDAO.countCartMap(userno);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return count;
	}

	@Override
	public List<MapDTO> getCartContentForPage(Map<String, Object> map) throws Exception {
		List<MapDTO> cartList = null;
		try {
			cartList = mainDAO.getCartContentForPage(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return cartList;
	}

	@Override
	public long countLikeMap(UserDTO userno) throws Exception {
		long count = 0;
		try {
			count = mainDAO.countLikeMap(userno);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return count;
	}

	@Override
	public List<MapDTO> getLikeContentForPage(Map<String, Object> map) throws Exception {
		List<MapDTO> likeList = null;
		try {
			likeList = mainDAO.getLikeContentForPage(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return likeList;
	}

	@Override
	public List<MapDTO> getCartContentForKeyword(Map<String, Object> param) throws Exception {
		List<MapDTO> cartList = null;
		try {
			cartList = mainDAO.getCartContentForKeyword(param);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return cartList;
	}

	@Override
	public long countCartMapForKeyword(Map<String, Object> param) throws Exception {
		long count = 0;
		try {
			count = mainDAO.countCartMapForKeyword(param);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return 0;
	}

}
