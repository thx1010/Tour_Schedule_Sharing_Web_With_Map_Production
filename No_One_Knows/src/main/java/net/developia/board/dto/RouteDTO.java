package net.developia.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RouteDTO {
	long route_no;
	String route_name;
	String route_type;
	String route_content;
	String route_path;
	String route_option;
	long route_course_no;
	long map_no;
}
