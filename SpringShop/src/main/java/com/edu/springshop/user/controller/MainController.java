package com.edu.springshop.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	Logger logger=LoggerFactory.getLogger(this.getClass().getName());
	
	@GetMapping("/main")
	public ModelAndView getMain() {
		logger.info("유저용 서블릿 작동");
		return null;
	}
}
