package net.developia.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceDTO {
	long place_no;
	String place_name;
	String place_addr;
	String place_loadaddr;
	String place_lat;
	String place_lng;
	String place_content;
	String place_photo;
	long place_course_no;
	long map_no;
}
