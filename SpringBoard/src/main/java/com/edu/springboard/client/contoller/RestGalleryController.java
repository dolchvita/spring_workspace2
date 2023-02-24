package com.edu.springboard.client.contoller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.edu.springboard.domain.Gallery;
import com.edu.springboard.exception.GalleryException;
import com.edu.springboard.exception.UploadException;
import com.edu.springboard.model.gallery.GalleryService;
import com.edu.springboard.model.gallery.GalleryServiceImpl;
import com.edu.springboard.model.util.FileManager;

// 비동기 방식으로 요청 처리할 컨트롤러!
@Controller
public class RestGalleryController {
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GalleryService galleryService;
	
	
	@PostMapping("/rest/gallery/regist")
	public String regist(Gallery gallery, HttpServletRequest request) {
		
		// 우선 파일들을 로컬에 등록해보기!
		logger.info(gallery.getTitle());
		logger.info(gallery.getWriter());
		logger.info(gallery.getContent());
		
		MultipartFile[] photo=gallery.getPhoto();
		
		for(int i=0; i<photo.length; i++){
			MultipartFile file=photo[i];
			String filename=file.getOriginalFilename();
			logger.info(filename);
		}
		
		
		// 여기서 디렉토리 경로를 노출시키지 않으려면? --리스너 등록하고 파라미터로 가져오기
		ServletContext context=request.getSession().getServletContext();
		String realPath=context.getRealPath("/resources/data/");
		
		logger.info(realPath);
		
		galleryService.regist(gallery, realPath);
		
		return "ok";
	}
	
	
	// 예외 처리 객체
	@ExceptionHandler(UploadException.class)
	public String handle(UploadException e) {
		return e.getMessage();
	}
	@ExceptionHandler(GalleryException.class)
	public String handle(GalleryException e) {
		return e.getMessage();
	}
	
}
