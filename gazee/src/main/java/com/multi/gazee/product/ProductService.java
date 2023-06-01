package com.multi.gazee.product;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.multi.gazee.weka.WekaRecommendService;

public interface ProductService {
	String best(Model model) throws Exception;

	String userBest(String memberId, Model model) throws Exception;
	
	String wekaBest(String memberId, WekaRecommendService wekaRecommendService, Model model) throws Exception;

	void searchList(PageVO vo, String search, Model model);
	
	void productList(PageVO vo, String search, Model model);
	
	void categoryList(PageVO vo, String category, Model model);
	
	String productList2(PageVO vo, String category, Model model) throws Exception;
	
	void viewCount(int productId);
	
	void searchListOnSale(PageVO vo, String search, Model model);
	
	String productListOnSale(PageVO vo, String search, Model model) throws Exception;

	void categoryListOnSale(PageVO vo, String category, Model model);
	
	String productListOnSale2(PageVO vo, String category, Model model) throws Exception;

	void productRegister(ProductVO product, HttpServletResponse response);

	String checkSeller(int productId) throws Exception;


}
