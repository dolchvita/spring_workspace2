package com.edu.springshop.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springshop.domain.Category;
import com.edu.springshop.domain.Product;
import com.edu.springshop.model.category.CategoryService;
import com.edu.springshop.model.product.ProductDAO;
import com.edu.springshop.model.product.ProductService;

@Controller
public class ShopController {
	@Autowired
	private ProductService productService;
	
	
	@GetMapping("/main")
	public ModelAndView getMain() {
		ModelAndView mav=new ModelAndView("shop/index");
		return mav;
	}
	
	
	@GetMapping("/shop")
	public ModelAndView getShop() {
		List<Product> productList=productService.selectAll();
		ModelAndView mav=new ModelAndView("shop/shop");
		mav.addObject("productList", productList);
		return mav;
	}
	
	
	
	@GetMapping("/shop/detail")
	public ModelAndView getDetail(int product_idx) {
		Product product=productService.select(product_idx);
		ModelAndView mav=new ModelAndView("shop/product_details");
		mav.addObject("product", product);
		return mav;
	}
	
}
