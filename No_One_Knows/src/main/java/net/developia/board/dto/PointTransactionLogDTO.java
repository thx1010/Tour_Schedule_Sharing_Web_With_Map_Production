package net.developia.board.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class PointTransactionLogDTO {
	private long point_no;
	private long point_current;
	private long point_decrease;
	private String point_spend_log;
	private String point_spend_date;
	private long point_increase;
	private String point_charge_log;
	private String point_charge_date;
}
