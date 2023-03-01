package com.edu.springshop.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springshop.domain.Category;
import com.edu.springshop.model.category.CategoryService;

// adminController 에 접근할 때 웹 상에 /admin/ 명시!
@Controller
public class ProductController {
	@Autowired
	private CategoryService categoryService;
	
	// 등록폼은 어차피 보여지니, 보여질 때 데이터 담고 가자!
	@GetMapping("/product/registform")
	public ModelAndView registFrom(HttpServletRequest request) {
		List<Category> categoryList=categoryService.selectAll();
		ModelAndView mav=new ModelAndView("admin/product/regist");
		mav.addObject("categoryList", categoryList);
		return mav;
	}
	
}
