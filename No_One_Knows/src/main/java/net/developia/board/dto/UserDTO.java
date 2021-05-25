package net.developia.board.dto;

import java.io.*;

import org.apache.commons.codec.digest.*;

import lombok.*;

@Getter
@Setter
@ToString
public class UserDTO implements Serializable{
	private long user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private int user_age;
	private String user_gender;
	private String user_joindate;
	private String user_phone;
	private long theme_no;
	private String user_address;
	private GradeDTO GradeDTO;
	private PointDTO PointDTO;
	
	public void setUser_pw(String user_pw) {
		this.user_pw = DigestUtils.sha512Hex(user_pw);
	}
	
	public int getUser_age(int user_age) {
		return this.user_age = 2021 - user_age + 1;
	}
	
	public int setUser_age(int user_age) {
		return this.user_age = 2021 - user_age + 1;
	}
}
