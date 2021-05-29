package net.developia.board.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class MapDTO {
	long map_no;
	String map_title;
	String map_subtitle;
	String map_content;
	String map_photo;
	long map_like;
	String map_regdate;
	String map_country;
	String map_state;
	String map_city;
	long map_placett;
	long map_status;
	String theme_name;
	ThemeDTO ThemeDTO;
}
