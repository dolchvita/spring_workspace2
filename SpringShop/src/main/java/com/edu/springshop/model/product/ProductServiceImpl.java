package com.edu.springshop.model.product;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.springshop.domain.Pimg;
import com.edu.springshop.domain.Product;
import com.edu.springshop.util.FileManager;

@Service
public class ProductServiceImpl implements ProductService{
	private Logger logger=LoggerFactory.getLogger(this.getClass().getName());
	@Autowired
	private FileManager fileManager;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private PimgDAO pimgDAO;
	
	@Override
	public List selectAll() {
		return productDAO.selectAll();
	}

	@Override
	public Product select(int product_idx) {
		return productDAO.select(product_idx);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void regist(Product product, String dir) {
		logger.info("상품 "+product);
		
		/* 1 뽀인트
		 	   참조 관계 테이블 등록이 이루어져야 하므로 pk 먼저 가져오기 */
		// 1-1) pk가 존재하고 있음
		productDAO.insert(product);

		// 1-2) 로컬 파일 저장
		fileManager.save(product, dir);
		
		// 저장될 pimg 세팅이 들어가야 하므로 filemanager에서 작업 먼저!
		List<Pimg> pimgList=product.getPimgList();
		
		// 1-7) 세팅된 pimgList에 담긴 DTO들을 insert하기
		for(Pimg pimg:pimgList){
			pimgDAO.insert(pimg);
		}
		
	}

	@Override
	public void update(Product product) {
		// TODO Auto-generated method stub
	}

	@Override
	public void delete(int product_idx) {
		// TODO Auto-generated method stub
	}

}
