package net.developia.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatMessageDTO {
	long chat_no;
	long room_no;
	long user_no;
	String user_name;
	String user_id;
	
	String chat_message;
	String chat_date;
}
