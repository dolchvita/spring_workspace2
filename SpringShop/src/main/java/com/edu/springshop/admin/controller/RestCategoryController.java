package com.edu.springshop.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springshop.domain.Category;
import com.edu.springshop.exception.CategoryException;
import com.edu.springshop.model.category.CategoryDAO;
import com.edu.springshop.model.category.CategoryService;
import com.edu.springshop.util.Message;

@RestController
@RequestMapping("/rest")
public class RestCategoryController {
	@Autowired
	private CategoryService categoryService;
	private Logger logger=LoggerFactory.getLogger(this.getClass().getName());
	
	@GetMapping("/category")
	public List<Category> getList(){
		return categoryService.selectAll();
	}
	
	@PostMapping("/category")
	public ResponseEntity<Message> regist(Category category){
		categoryService.insert(category);
		
		// 메시지 보내기
		Message message=new Message();
		message.setMsg("등록 성공");
		ResponseEntity<Message> entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}
	
	
	// 예외 처리
	@ExceptionHandler(CategoryException.class)
	public ResponseEntity<Message> handle(CategoryException e){
		Message message=new Message();
		message.setMsg(e.getMessage());
		ResponseEntity<Message> entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}
	
	
}
