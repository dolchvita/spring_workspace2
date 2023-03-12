package com.edu.springshop.aop;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springshop.exception.AdminException;

@ControllerAdvice
public class AdminGlobalException {

	@ExceptionHandler(AdminException.class)
	public ModelAndView handle(AdminException e) {
		ModelAndView mav=new ModelAndView("admin/error/result");
		mav.addObject("e", e);
		return mav;
	}
	
	// 현재 이 예외객체가 실행되는 시점은?
	// --> 어드민 세션 없이 다른 페이지 접근했을 때 ! -- 그럼 로그인 실패시에도 적용해보자!
	
}
