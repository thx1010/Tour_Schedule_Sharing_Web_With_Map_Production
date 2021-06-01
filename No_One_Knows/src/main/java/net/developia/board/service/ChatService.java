package net.developia.board.service;

import java.util.List;

import net.developia.board.dto.ChatMessageDTO;
import net.developia.board.dto.ChatRoomDTO;
import net.developia.board.dto.MapDTO;

public interface ChatService {

	ChatRoomDTO getChatRoom(long room_no) throws Exception;

	int addMessage(ChatMessageDTO chatMessage) throws Exception;

	void addChatRoom(MapDTO mapDTO) throws Exception;

	List<ChatMessageDTO> getChatHistory(long room_no) throws Exception;

}
