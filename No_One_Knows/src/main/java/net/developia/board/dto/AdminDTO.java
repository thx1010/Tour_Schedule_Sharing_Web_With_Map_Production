package net.developia.board.dto;

import java.io.*;

import org.apache.commons.codec.digest.*;

import lombok.*;

@Getter
@Setter
@ToString
public class AdminDTO implements Serializable{
	private long admin_no;
	private String admin_id;
	private String admin_pw;
	
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = DigestUtils.sha512Hex(admin_pw);
	}
}
