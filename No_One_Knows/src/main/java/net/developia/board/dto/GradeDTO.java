package net.developia.board.dto;

import java.io.*;

import lombok.*;

@Getter
@Setter
@ToString
public class GradeDTO implements Serializable{
	private long grade_no;
	private String grade_name;
}
