package com.edu.springshop.shop.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springshop.util.Message;

@RestController
@RequestMapping("/rest/member")
public class RestMemberController {
	
	
	@GetMapping("/google/geo")
	public ResponseEntity<Message> getLocation(){
		
		Message message=new Message();
		ResponseEntity<Message> entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}
	
}
