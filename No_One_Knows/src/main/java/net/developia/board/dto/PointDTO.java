package net.developia.board.dto;

import java.io.*;

import lombok.*;

@Getter
@Setter
@ToString
public class PointDTO implements Serializable{
	private long point_no;
	private long point_current;
	private UserDTO userDTO;
}
