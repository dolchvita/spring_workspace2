package com.edu.springshop.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.edu.springshop.domain.Pimg;
import com.edu.springshop.domain.Product;

@Component
public class FileManager {
	
	public void save(Product product, String dir) {
		MultipartFile[] photoList=product.getPhoto();
		
		// 1-4) 대입한 pimg를 저장해서 담기 위한 리스트 선언
		List<Pimg> pimgList=new ArrayList<Pimg>();
		
		try {
		for(int i=0; i<photoList.length; i++) {
				Thread.sleep(10);
			
				MultipartFile photo=photoList[i];
				String filename=createName(photo.getOriginalFilename());
			
				// 1-3) 반환받은 포토들을 pimg에 대입하기
				Pimg pimg=new Pimg();
				pimg.setProduct(product);
				pimg.setFilename(filename);
				
				//1-5) 세팅된 DTO 저장하기
				pimgList.add(pimg);
				
				photo.transferTo(new File(dir+filename));
			}
		
		// 1-6) 완성된 리스트 엮어주기
		product.setPimgList(pimgList);
		
			}catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}catch (InterruptedException e1) {
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
