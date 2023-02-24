package com.edu.springboard.model.gallery;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.springboard.domain.Gallery;
import com.edu.springboard.exception.GalleryException;

@Repository
public class MybatisGalleryDAO implements GalleryDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Gallery select(int gallery_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public void insert(Gallery gallery) throws GalleryException{
		
		System.out.println("너 어떻게 나오냐 ~~~ "+gallery);
		int result=sqlSessionTemplate.insert("Gallery.insert");
		System.out.println("인서트 되니?? "+gallery.getGallery_idx());

		if(result<1) {
			throw new GalleryException("등록 실패");
		}
	}

	@Override
	public void update(Gallery gallery) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int gallery_idx) {
		// TODO Auto-generated method stub
		
	}

}
