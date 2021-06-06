package net.developia.board.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class MapPurchaseDTO {
	long purchase_no;
	String purchase_regdate;
	long map_no;
	long user_no;
}
