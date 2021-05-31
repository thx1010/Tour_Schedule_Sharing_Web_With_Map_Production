package net.developia.board.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class MapRegisterDTO {
	long map_no;
	String map_title;
	String map_subtitle;
	String map_content;
	String map_photo;
	long map_like;
	String map_country;
	String map_state;
	String map_city;
	String register_regdate;
	long user_no;
	String user_id;
	String user_photo;
}
