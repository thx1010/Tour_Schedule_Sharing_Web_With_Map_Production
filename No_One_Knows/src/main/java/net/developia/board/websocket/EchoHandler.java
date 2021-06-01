package net.developia.board.websocket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dto.ChatMessageDTO;
import net.developia.board.dto.ChatRoomDTO;
import net.developia.board.dto.UserDTO;
import net.developia.board.service.ChatService;

@Slf4j
@Controller
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	ChatService chatService;
	
	
	private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	private static int count = 0;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		count++;
		log.info("[ChatSys] {} 연결성공 => 총 접속 인원 : {} 명", session.getId(), count);
		//log.info("[chat system] " + "채팅방 입장자 : " + session.getPrincipal().getName());
		//sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		ChatMessageDTO chatMessage = objectMapper.readValue(msg, ChatMessageDTO.class);
		log.info("[CyatSys] 메시지 -> {}", chatMessage.toString());
		ChatRoomDTO chatRoom = chatService.getChatRoom(chatMessage.getRoom_no());
		
		if(RoomList.get(Long.toString(chatRoom.getRoom_no())) == null && chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
			ArrayList<WebSocketSession> sessionInfo = new ArrayList<WebSocketSession>();
			sessionInfo.add(session);
			sessionList.put(session, Long.toString(chatRoom.getRoom_no()));
			RoomList.put(Long.toString(chatRoom.getRoom_no()), sessionInfo);
			log.info("[ChatSys] {} 번 채팅방 생성", chatRoom.getRoom_no());
		} else if(RoomList.get(Long.toString(chatRoom.getRoom_no())) != null && chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
			RoomList.get(Long.toString(chatRoom.getRoom_no())).add(session);
			sessionList.put(session, Long.toString(chatRoom.getRoom_no()));
			log.info("[ChatSys] {} 번 채팅방 입장", chatRoom.getRoom_no());
			
			
			/*
			 * chatMessage.setChat_message("님이 입장하셨습니다."); TextMessage textMessage = new
			 * TextMessage(chatMessage.getUser_name() + "," + chatMessage.getUser_id() + ","
			 * + chatMessage.getChat_message()); for(WebSocketSession sess :
			 * RoomList.get(Long.toString(chatRoom.getRoom_no()))) {
			 * //log.info("[ChatSys] {} 방 접속인원 {} " , chatRoom.getRoom_no(), sess);
			 * sess.sendMessage(textMessage); }
			 */
		} else if(RoomList.get(Long.toString(chatRoom.getRoom_no())) != null && !chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
			TextMessage textMessage = new TextMessage(chatMessage.getUser_name() + "," + chatMessage.getUser_id() + "," + chatMessage.getChat_message());
			
			int sessionCount = 0;
			
			for(WebSocketSession sess : RoomList.get(Long.toString(chatRoom.getRoom_no()))) {
				log.info("[ChatSys] {} 방 접속인원 {} " , chatRoom.getRoom_no(), sess);
				sess.sendMessage(textMessage);
				sessionCount++;
			}
			
			int ret = 0;
			try {
				log.info("[ChatSys]저장될 채팅데이터 : " + chatMessage.toString());
				ret = chatService.addMessage(chatMessage);
				
			} catch(Exception e) {
				log.info(e.getMessage());
			} finally {
				if(ret == 1) {
					log.info("[ChatSys]메세지 전송 및 DB 저장 성공");
				} else {
					log.info("[ChatSys]메세지 전송 실패");
				}
			}
			
			
		}
		//log.info("[chat system] {}로부터 {} 받음", session.getId(), message.getPayload());
		//log.info(message.getPayload());
	
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		count--;
		log.info("[ChatSys] {} 연결끊김 => 총 접속 인원 : {} 명", session.getId(), count);
		if(sessionList.get(session) != null) {
			RoomList.get(sessionList.get(session)).remove(session);
		}
	}
	

	@RequestMapping(value="/chat/{room_no}", method=RequestMethod.GET)
	public ModelAndView chat(@PathVariable long room_no, HttpSession session) {
		//구매한 map_no인지 체크
		
		ModelAndView mav = new ModelAndView();
		log.info("[ChatSys]현재 로그인한 유저 정보 불러오기...");
		UserDTO userDTO = (UserDTO)session.getAttribute("userInfo");
		
		if(userDTO == null) {
			mav.setViewName("result");
			mav.addObject("msg", "로그인 하세요");
			mav.addObject("url", "login");
			return mav;
		}
		log.info("[ChatSys]현재 로그인한 유저 정보 {}", userDTO.toString());
		
		List<ChatMessageDTO> chatHistory = null;
		ChatRoomDTO roomInfo = null;
		try {
			log.info("[ChatSys]채팅 히스토리 불러오기...");
			chatHistory = chatService.getChatHistory(room_no);
			log.info("[ChatSys]채팅 히스토리 불러오기...완료 {}", chatHistory.size());
			log.info("[ChatSys]채팅방 불러오기...");
			roomInfo = chatService.getChatRoom(room_no);
			log.info("[ChatSys]채팅방 불러오기...완료 {}", roomInfo.getRoom_name());
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		
		mav.setViewName("chatting");
		mav.addObject("userInfo", userDTO);
		mav.addObject("roomInfo", roomInfo);
		mav.addObject("chatHistory", chatHistory);
	
		return mav;
	}
}
