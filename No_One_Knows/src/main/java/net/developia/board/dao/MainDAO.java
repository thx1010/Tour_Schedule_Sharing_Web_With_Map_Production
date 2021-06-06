package net.developia.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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

public interface MainDAO {

	List<UserDTO> getUserList(UserDTO userDTO) throws Exception;

	List<PointDTO> getPointList(UserDTO userDTO) throws Exception;

	List<MapRegisterDTO> getMapList() throws Exception;

	List<MapRegisterDTO> getMapNewList() throws Exception;

	List<PlaceDTO> getImageSlide(MapDTO mapDTO) throws Exception;

	List<MapRegisterDTO> getMapData(MapDTO mapDTO) throws Exception;

	void addtoCart(MapRegisterDTO mapregisterDTO) throws Exception;

	void addtoLike(MapRegisterDTO mapregisterDTO) throws Exception;

	List<MapDTO> getLikeContent(UserDTO userno) throws Exception;

	List<MapDTO> getCartContent(UserDTO userno) throws Exception;

	List<ThemeDTO> getCategoryContent() throws Exception;

	List<MapDTO> classifyCategory(MapRegisterDTO categoryno) throws Exception;

	void updateLikeCount(MapRegisterDTO mapregisterDTO) throws Exception;

	void deleteLike(MapRegisterDTO likeinfo) throws Exception;

	List<MapDTO> getLikedeleteContent(MapRegisterDTO likeinfo) throws Exception;

	long countCartMap(UserDTO userno) throws SQLException;

	List<MapDTO> getCartContentForPage(Map<String, Object> map) throws SQLException;

	long countLikeMap(UserDTO userno) throws SQLException;

	List<MapDTO> getLikeContentForPage(Map<String, Object> map) throws SQLException;

	List<MapDTO> getCartContentForKeyword(Map<String, Object> param) throws SQLException;

	long countCartMapForKeyword(Map<String, Object> param) throws SQLException;

	List<MapRegisterDTO> getMapBestList() throws Exception;

	List<MapRegisterDTO> getMapMyList(ThemeDTO themeDTO) throws Exception;

	List<MapRegisterDTO> getMapViewmoreList() throws Exception;

	List<PointChargeDTO> getPointChargeList(UserDTO userDTO) throws Exception;

	List<PointSpendDTO> getPointSpendList(UserDTO userDTO) throws Exception;

	List<MapDTO> getMapStatusList(UserDTO userDTO) throws Exception;

	List<MapDTO> getMapPurchaseList(UserDTO userDTO) throws Exception;

	List<MapDTO> getPayModalContent(MapDTO mapdto) throws Exception;

	void insertintoPurchase(MapPurchaseDTO purchasedto) throws Exception;

	void deleteCart(MapPurchaseDTO purchasedto) throws Exception;

	List<ChatRoomDTO> getChatroom() throws Exception;

	List<ChatRoomDTO> getroomInfo(ChatRoomDTO chatrooom) throws Exception;

	void insertRegisterRoom(RegisterChatRoomDTO registerchatroom) throws Exception;

	List<ChatMessageDTO> getMessageInfo(ChatMessageDTO message) throws Exception;

	List<ChatMessageDTO> getMessageCountInfo(ChatMessageDTO message) throws Exception;

	NoticeDTO selectNoticeCount() throws Exception;

}
