package com.edu.springshop.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springshop.domain.Admin;
import com.edu.springshop.exception.AdminException;
import com.edu.springshop.model.admin.AdminService;
import com.edu.springshop.util.Message;

@RestController
@RequestMapping("/rest")
public class RestAdminController {
	@Autowired
	private AdminService adminService;
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@PostMapping("/login/admin")
	public ResponseEntity<Message> loginCkeck(Admin admin, HttpServletRequest request){
		Admin obj=adminService.select(admin);
		
		HttpSession session=request.getSession();
		session.setAttribute("admin", obj);
		
		Message message=new Message();
		message.setMsg("로그인 성공");
		ResponseEntity<Message> entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}
	
	
	
	@ExceptionHandler(AdminException.class)
	public ResponseEntity<Message> handle(AdminException e){
		Message message=new Message();
		message.setMsg(e.getMessage());
		ResponseEntity<Message> entity=new ResponseEntity<Message>(message, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	}
	
	
}
