package com.multi.gazee.product;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.gazee.member.MemberDAO;
import com.multi.gazee.member.MemberVO;
import com.multi.gazee.productImage.ProductImageDAO;
import com.multi.gazee.productImage.ProductImageVO;
import com.multi.gazee.transactionHistory.TransactionHistoryDAO;
import com.multi.gazee.weka.WekaRecommendService;

@Controller // 스프링에서 제어하는 역할로 등록!
public class ProductController {
	
	@Autowired
	ProductService ps;
	
	@RequestMapping("product/best")
	public String best(Model model) throws Exception {
		return ps.best(model);
	}

	@RequestMapping("product/userBest")
	public String userBest(String memberId, Model model) throws Exception {
		return ps.userBest(memberId, model);
	}

	@RequestMapping("product/wekaBest")
	public String wekaBest(String memberId, WekaRecommendService wekaRecommendService, Model model) throws Exception {
		return ps.wekaBest(memberId, wekaRecommendService, model);
	}


	@RequestMapping("product/searchList")
	public void searchList(PageVO vo, String search, Model model) {
		ps.searchList(vo, search, model);
	}

	@RequestMapping("product/productList")
	public void productList(PageVO vo, String search, Model model) {
		ps.productList(vo, search, model);
	}

	@RequestMapping("product/categoryList")
	public void categoryList(PageVO vo, String category, Model model) {
		ps.categoryList(vo, category, model);
	}


	@RequestMapping("product/productList2")
	public String productList2(PageVO vo, String category, Model model) throws Exception {
		return ps.productList2(vo, category, model);
	}

	@RequestMapping("product/viewsCount")
	public void viewsCount(int productId) {
		ps.viewCount(productId);
	}

	/* 판매중인 상품 */
	@RequestMapping("product/searchListOnSale")
	public void searchListOnSale(PageVO vo, String search, Model model) {
		ps.searchListOnSale(vo, search, model);
	}
	
	@RequestMapping("product/productListOnSale")
	public String productListOnSale(PageVO vo, String search, Model model) throws Exception {
		return ps.productListOnSale(vo, search, model);
	}

	
	@RequestMapping("product/categoryListOnSale")
	public void categoryListOnSale(PageVO vo, String category, Model model) {
		ps.categoryListOnSale(vo, category, model);
	}
	
	@RequestMapping("product/productListOnSale2")
	public String productListOnSale2(PageVO vo, String category, Model model) throws Exception {
		return ps.productListOnSale2(vo, category, model);
	}

	
	/* 판매하기 */
	@RequestMapping("product/register")
	public void productRegister(HttpSession session, ProductVO product, HttpServletResponse response) {
		ps.productRegister(product, response);
	}

	/* 상품판매자 확인 */
	@RequestMapping("product/checkSeller")
	@ResponseBody
	public String checkSeller(int productId) throws Exception {
		return ps.checkSeller(productId);
	}

}
