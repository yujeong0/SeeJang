package com.springboot.pjt1.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.pjt1.product.service.ProductService;
import com.springboot.pjt1.repository.dto.Product;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "http://localhost:8080" }, allowCredentials = "true")
@RestController
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@ApiOperation(value = "모든 상품 정보를 반환한다.", response = List.class)
	@GetMapping
	public List<Product> searchProduct() {
		return service.searchProduct();
	}

	@ApiOperation(value = "상품명에 맞는 상품 정보를 반환한다.", response = List.class)
	@GetMapping("/{name}")
	public List<Product> searchProductByName(@PathVariable String name) throws IOException {
		return service.searchProductByName(name);
	}
	@ApiOperation(value = "카테고리에 맞는 상품 정보를 반환한다.", response = List.class)
	@GetMapping("/{category}")
	public List<Product> searchProductByCategory(@PathVariable String category) {
		return service.searchProductByCategory(category);
	}

	@ApiOperation(value = "상품명과 카테고리에 맞는 상품 정보를 반환한다.", response = List.class)
	@GetMapping("/nameandcategory")
	public List<Product> selectProductByNameAndCategory(@RequestParam("name") String name, @RequestParam("category") String category) {
		return service.selectProductByNameAndCategory(new Product(name, category));
	}
	
	@ApiOperation(value = "상품 상세 정보, 최저가, 리뷰를 반환한다.", response = Map.class)
	@GetMapping("/detail/{name}")
	public Map<String, Object> searchProductDetail(@PathVariable String name) throws IOException {
		return service.searchProductDetail(name);
	}
}
