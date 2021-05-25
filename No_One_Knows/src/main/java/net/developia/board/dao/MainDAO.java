package net.developia.board.dao;

import java.util.*;

import net.developia.board.dto.*;

public interface MainDAO {

	List<UserDTO> getUserList(UserDTO userDTO) throws Exception;

	List<PointDTO> getPointList(UserDTO userDTO) throws Exception;

}
