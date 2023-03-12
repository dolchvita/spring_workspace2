package com.edu.springshop.aop;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.edu.springshop.exception.AdminException;
import com.edu.springshop.util.Message;

@RestControllerAdvice
public class RestAdminGlobalException {
	
	@ExceptionHandler(AdminException.class)
	public ResponseEntity<Message> handle(AdminException e){
		Message message=new Message();
		message.setMsg("Rest 글로벌 예외호출 : "+e.getMessage());
		ResponseEntity<Message> entity=new ResponseEntity<Message>(message, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	}
	
}
