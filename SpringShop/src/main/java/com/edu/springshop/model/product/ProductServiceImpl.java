package com.edu.springshop.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.springshop.domain.Pimg;
import com.edu.springshop.domain.Product;
import com.edu.springshop.util.FileManager;

@Service
public class ProductServiceImpl implements ProductService{
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
	public void regist(Product product, String dir) {
		// 로컬 파일 저장부터..
		fileManager.save(product, dir);
		
		List<Pimg> pimgList=product.getPimgList();
		product.setPimgList(pimgList);

		productDAO.insert(product);
		//
		
		
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
