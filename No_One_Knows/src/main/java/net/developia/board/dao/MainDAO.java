package net.developia.board.dao;

import java.util.*;

import net.developia.board.dto.*;

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

}
