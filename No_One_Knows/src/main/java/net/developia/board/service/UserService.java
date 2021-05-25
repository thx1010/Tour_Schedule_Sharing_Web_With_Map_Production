package net.developia.board.service;

import net.developia.board.dto.*;

public interface UserService {

	UserDTO login(UserDTO userDTO) throws Exception;

	void signup(UserDTO userDTO) throws Exception;
	
}
