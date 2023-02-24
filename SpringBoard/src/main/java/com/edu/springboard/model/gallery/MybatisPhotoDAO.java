package com.edu.springboard.model.gallery;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.springboard.domain.Photo;
import com.edu.springboard.exception.PhotoException;
@Repository
public class MybatisPhotoDAO implements PhotoDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Photo select(int photo_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public void insert(Photo photo) throws PhotoException{
		int result=sqlSessionTemplate.insert("Photo.insert", photo);
		if(result<1) {
			throw new PhotoException("사진 등록 실패");
		}
	}

	@Override
	public void deleteByGallery(int gallery_idx) {
		// TODO Auto-generated method stub
		
	}

}
