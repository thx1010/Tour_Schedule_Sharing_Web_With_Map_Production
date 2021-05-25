package net.developia.board.service;

import java.util.*;

import net.developia.board.dto.*;

public interface MainService {

	List<UserDTO> getUserList(UserDTO userDTO) throws Exception;

	List<PointDTO> getPointList(UserDTO userDTO) throws Exception;

}
