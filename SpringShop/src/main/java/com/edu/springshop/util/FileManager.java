package com.edu.springshop.util;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.edu.springshop.domain.Product;

@Component
public class FileManager {
	
	public void save(Product product, String dir) {
		MultipartFile[] photoList=product.getPhoto();
		
		try {
		for(int i=0; i<photoList.length; i++) {
				Thread.sleep(10);
			
				MultipartFile photo=photoList[i];
				String filename=createName(photo.getOriginalFilename());
			
				photo.transferTo(new File(dir+filename));
			}	
		
			}catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	
	
	public String createName(String filename) {
		long time=System.currentTimeMillis();
		String ext=filename.substring(filename.lastIndexOf(".")+1, filename.length());
		String createName=time+"."+ext;
		return createName;
	}
	
	
}
