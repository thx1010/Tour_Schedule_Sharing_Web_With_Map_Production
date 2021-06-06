package net.developia.board.dto;

import java.io.*;

import lombok.*;

@Getter
@Setter
@ToString
public class PointChargeDTO implements Serializable{
	private long point_charge_no;
	private long point_increase;
	private String point_charge_log;
	private String point_charge_date;
	private PointDTO pointDTO;
}
