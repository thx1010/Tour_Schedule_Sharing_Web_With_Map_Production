package net.developia.board.service;

import java.util.*;

import net.developia.board.dto.*;

public interface MainService {

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

	long countCartMap(UserDTO userno) throws Exception;

	List<MapDTO> getCartContentForPage(Map<String, Object> map) throws Exception;

	long countLikeMap(UserDTO userno) throws Exception;

	List<MapDTO> getLikeContentForPage(Map<String, Object> map) throws Exception;

	List<MapDTO> getCartContentForKeyword(Map<String, Object> param) throws Exception;

	long countCartMapForKeyword(Map<String, Object> param) throws Exception;

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
