package com.edu.springboard.model.gallery;

import java.util.List;

import com.edu.springboard.domain.Gallery;

public interface GalleryService {
	public List selectAll();
	public Gallery select(int gallery_idx);
	
	// DML
	public void regist(Gallery gallery, String path);
	public void update(Gallery gallery);
	public void delete(int gallery_idx);
}
