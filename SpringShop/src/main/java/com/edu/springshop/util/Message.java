package com.edu.springshop.util;

import lombok.Data;

//  결과 출력시 문자열을 담아서 보낼 객체
@Data
public class Message {
	private int code;
	private String msg;
	
	public void setCode(int code) {
		this.code = code;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

}
