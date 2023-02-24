package com.edu.springshop.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	Logger logger=LoggerFactory.getLogger(this.getClass().getName());
	
	@GetMapping("/main")
	public ModelAndView getMain() {
		logger.info("관리자 서블릿 작동");
		return new ModelAndView("admin/index");
	}
}
