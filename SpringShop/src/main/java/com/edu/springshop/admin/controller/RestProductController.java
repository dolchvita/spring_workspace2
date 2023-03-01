package com.edu.springshop.admin.controller;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.edu.springshop.domain.Product;
import com.edu.springshop.model.product.ProductService;

@RestController
@RequestMapping("/rest")
public class RestProductController {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ProductService productService;
	
	@PostMapping("/product")
	public String regist(Product product, HttpServletRequest request) {
		logger.info("상품 "+product);
		
		ServletContext application=request.getSession().getServletContext();
		String dir=application.getRealPath("/resources/data/");
		logger.info(dir);
		productService.regist(product, dir);
		return "등록 성공";
	}
	
	
	
}
