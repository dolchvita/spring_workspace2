package com.edu.springboard.model.gallery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.edu.springboard.domain.Gallery;
import com.edu.springboard.domain.Photo;
import com.edu.springboard.model.util.FileManager;

@Service
public class GalleryServiceImpl implements GalleryService{
	@Autowired
	private FileManager fileManager;
	@Autowired
	@Qualifier("mybatisGalleryDAO")
	private GalleryDAO galleryDAO;
	
	@Override
	public List selectAll() {
		return null;
	}

	@Override
	public Gallery select(int gallery_idx) {
		return null;
	}

	
	@Override
	public void regist(Gallery gallery, String path) {
		// 1 파일 저장
		//fileManager.save(gallery, path);
		
		// 2 갤러리 저장
		galleryDAO.insert(gallery);
		
		// 사진을 대입을 안 한 것 같은데?
		List<Photo> photoList=gallery.getPhotoList();
		
		//3 포토 저장

	}

	@Override
	public void update(Gallery gallery) {
		
	}

	@Override
	public void delete(int gallery_idx) {
		
	}

}
