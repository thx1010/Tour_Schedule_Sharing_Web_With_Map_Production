package net.developia.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {
	long review_no;
	long review_rate;
	String review_content;
	long map_no;
	long user_no;
	String user_name;
}
