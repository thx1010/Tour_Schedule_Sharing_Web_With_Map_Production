package net.developia.board.dto;

import java.io.*;

import lombok.*;

@Getter
@Setter
@ToString
public class PointSpendDTO implements Serializable{
	private long point_spend_no;
	private long point_decrease;
	private String point_spend_log;
	private String point_spend_date;
	private PointDTO pointDTO;
}
