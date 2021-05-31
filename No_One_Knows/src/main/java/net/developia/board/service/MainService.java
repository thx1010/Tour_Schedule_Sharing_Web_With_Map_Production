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

}
