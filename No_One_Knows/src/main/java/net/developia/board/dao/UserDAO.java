package net.developia.board.dao;

import net.developia.board.dto.*;

public interface UserDAO {

	UserDTO login(UserDTO userDTO) throws Exception;

	void signup(UserDTO userDTO) throws Exception;
	
}
