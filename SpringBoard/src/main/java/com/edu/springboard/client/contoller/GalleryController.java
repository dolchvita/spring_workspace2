package com.edu.springboard.client.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GalleryController {

	@RequestMapping("/gallery/registform")
	public ModelAndView registForm() {
		return new ModelAndView("gallery/regist2");
	}
	
	
	
}
