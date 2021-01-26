package com.springboot.pjt1.product.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.pjt1.repository.dto.Product;
import com.springboot.pjt1.repository.dto.Review;
import com.springboot.pjt1.repository.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductMapper mapper;

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
	
	public Map<String, Object> bestPriceList() {
		Map<String, Object> map = new HashMap<>();
		
		// 여기서 쿠팡, 뭐시기, 뭐시기 최저가 크롤링 결과 map 에 넣기
		
		return map;
	}
	
	@Override
	public List<Review> reviewList(String name) throws IOException {
		// 여기서 이마트몰 리뷰 크롤링 결과 map 에 넣기
		List<Review> reviews = new ArrayList<>();
		
		Document doc = Jsoup.connect(selectProductByExactName(name).getReviewLink()).get();
		Elements stars = doc.select(".star em");
		Elements comments = doc.select("div.cdtl_cmt_tx v2 span"); 
		
		for (int i = 0; i < stars.size(); i++) {
			Review r = new Review();
			r.setScore(stars.get(i).toString());
			r.setScore(comments.get(i).toString());
			reviews.add(r);
		}
		
		return reviews;
	}
}
