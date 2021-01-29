package com.springboot.pjt1.product.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.pjt1.repository.dto.Product;
import com.springboot.pjt1.repository.dto.ProductReview;
import com.springboot.pjt1.repository.mapper.ProductMapper;
import com.springboot.pjt1.repository.mapper.ProductReviewMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductMapper mapper;
	ProductReviewMapper reviewMapper;
	
	
	@Override
	public Map<String, Object> searchProductDetail(String name) throws IOException {
		Map<String, Object> map = new HashMap<>();
		Product product = selectProductByExactName(name);
		map.put("product", product);
		map.put("review", reviewMapper.selectProductReviewByProductNo(product.getProductNo()));
		map.put("bestPrice", bestPriceList(name));
		return map;
	}
	
	@Override
	public List<Product> searchProduct() {
		return mapper.selectProduct();
	}
	@Override
	public List<Product> searchProductByName(String name) {
		return mapper.selectProductByName(name);
	}
	@Override
	public Product selectProductByExactName(String name) {
		return mapper.selectProductByExactName(name);
	}
	@Override
	public List<Product> searchProductByCategory(String category) {
		return mapper.selectProductByCategory(category);
	}
	@Override
	public List<Product> selectProductByNameAndCategory(Product product) {
		return mapper.selectProductByNameAndCategory(product);
	}
	
	public Map<String, Object> bestPriceList(String name) {
		Map<String, Object> map = new HashMap<>();
		
		// 여기서 쿠팡, 뭐시기, 뭐시기 최저가 크롤링 결과 map 에 넣기
		
		return map;
	}
}
