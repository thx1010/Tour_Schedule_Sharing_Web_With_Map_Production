package net.developia.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dao.ChatDAO;
import net.developia.board.dto.ChatMessageDTO;
import net.developia.board.dto.ChatRoomDTO;
import net.developia.board.dto.MapDTO;

@Slf4j
@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	public ChatRoomDTO getChatRoom(long room_no) throws Exception {
		try {
			return chatDAO.getChatRoom(room_no);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public int addMessage(ChatMessageDTO chatMessage) throws Exception {
		try {
			return chatDAO.addMessage(chatMessage);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void addChatRoom(MapDTO mapDTO) throws Exception {
		try {
			chatDAO.addChatRoom(mapDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

	@Override
	public List<ChatMessageDTO> getChatHistory(long room_no) throws Exception {
		List<ChatMessageDTO> chatHistory = null;
		try {
			chatHistory = chatDAO.getChatHistory(room_no);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return chatHistory;
	}

}
