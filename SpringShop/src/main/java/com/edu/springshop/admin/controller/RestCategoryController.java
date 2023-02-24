package com.edu.springshop.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springshop.domain.Category;
import com.edu.springshop.model.category.CategoryService;

@RestController
@RequestMapping("/rest")
public class RestCategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/category")
	public List<Category> getList(){
		return categoryService.selectAll();
	}
	
	@PostMapping("/category")
	//public 
	
}
