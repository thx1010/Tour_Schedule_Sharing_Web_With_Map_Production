package net.developia.board.dao;

import java.sql.SQLException;
import java.util.List;

import net.developia.board.dto.ChatMessageDTO;
import net.developia.board.dto.ChatRoomDTO;
import net.developia.board.dto.MapDTO;

public interface ChatDAO {

	public ChatRoomDTO getChatRoom(long room_no) throws SQLException;

	public int addMessage(ChatMessageDTO chatMessage) throws SQLException;

	public void addChatRoom(MapDTO mapDTO) throws SQLException;

	public List<ChatMessageDTO> getChatHistory(long room_no) throws SQLException;

}
