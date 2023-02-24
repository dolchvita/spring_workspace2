package com.edu.springboard.model.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.edu.springboard.domain.Gallery;
import com.edu.springboard.exception.UploadException;

@Component
public class FileManager{
	Logger logger=LoggerFactory.getLogger(this.getClass().getName());
	
	
	// 파일을 로컬 파일에 작성하기!
	public void save(Gallery gallery, String realPath) throws UploadException{
		MultipartFile[] photo=gallery.getPhoto();
		
		for(int i=0; i<photo.length; i++) {
			MultipartFile file=photo[i];
			String name=file.getOriginalFilename();
			logger.info("로거 찍는 중~~~"+name);
			
			// 파일 이름 변경
	
			try {
				file.transferTo(new File(realPath+name));
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
				throw new UploadException("파일 저장 실패");
			} catch (IOException e) {
				e.printStackTrace();
				throw new UploadException("파일 저장 실패");
			}
			
		}
		
	}
	
}
