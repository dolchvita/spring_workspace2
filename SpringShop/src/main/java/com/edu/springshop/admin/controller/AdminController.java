package com.edu.springshop.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	Logger logger=LoggerFactory.getLogger(this.getClass().getName());
	
	@GetMapping("/main")
	public ModelAndView getMain(HttpServletRequest request) {
		logger.info("관리자 서블릿 작동");
		return new ModelAndView("admin/index");
	}
	
	@GetMapping("/loginform")
	public ModelAndView loginForm(HttpServletRequest request) {
		return new ModelAndView("admin/login/loginform");
	}
}
