package net.developia.board.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class ChatRoomDTO {
	long room_no;
	String room_name;
	String room_content;
	String room_image;
}
