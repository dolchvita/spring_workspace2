package com.edu.mvc1.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReboardController {
	
	@GetMapping("/client/list")
	public ModelAndView getList() {
		return new ModelAndView("board/list");
	}
	
	
}
