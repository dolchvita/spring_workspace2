package com.edu.springboard.client.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboard.domain.Notice;
import com.edu.springboard.model.notice.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice/registform")
	public ModelAndView registForm() {
		return new ModelAndView("notice/regist");
	}
	
	
	@GetMapping("/notice/list")
	public ModelAndView getList() {
		return new ModelAndView("notice/list");
	}
	
	
	@GetMapping("/notice/detail")
	public ModelAndView getDetail(int notice_idx) {
		ModelAndView mav=new ModelAndView("notice/detail");
		mav.addObject("notice_idx", notice_idx);
		// 1) 여기서 넘긴 idx 는 누가 받아서 처리할까?
		//1-1) 일단 디테일 페이지에 전달 => request가 받음!
		return mav;
	}
	
	
	
	
}
