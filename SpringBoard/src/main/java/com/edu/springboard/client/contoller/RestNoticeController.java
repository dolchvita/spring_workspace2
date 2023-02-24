package com.edu.springboard.client.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboard.domain.Notice;
import com.edu.springboard.exception.NoticeException;
import com.edu.springboard.model.notice.NoticeService;
import com.edu.springboard.model.notice.NoticeServiceImpl;

@RestController
@RequestMapping("/rest")
public class RestNoticeController {
	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("/notices")
	public List<Notice> getList(){
		return noticeService.selectAll();
	}
	
	
	@PostMapping("/notices")
	public String regist(Notice notice) {
		noticeService.insert(notice);
		return "ok";
	}
	
	
	@GetMapping("/notices/{notice_idx}")
	public Notice select(@PathVariable("notice_idx") int notice_idx) {
		return noticeService.select(notice_idx);
	}
	
	
	//수정
	@PutMapping("/notices")
	public String update(Notice notice) {
		noticeService.update(notice);
		return "ok";
	}
	
	
	//삭제
	@DeleteMapping("notices/{notice_idx}")
	public String delete(@PathVariable("notice_idx") int notice_idx) {
		noticeService.delete(notice_idx);
		return "ok";
	}
	
	
	@ExceptionHandler(NoticeException.class)
	public String handle(NoticeException e) {
		return e.getMessage();
	}
	
}
