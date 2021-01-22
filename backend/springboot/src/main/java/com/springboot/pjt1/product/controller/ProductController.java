package com.springboot.pjt1.product.controller;

import java.util.List;

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

@CrossOrigin(origins = { "*" })
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
	@GetMapping("/name/{name}")
	public List<Product> searchProductByName(@PathVariable String name) {
		return service.searchProductByName(name);
	}
	@ApiOperation(value = "카테고리에 맞는 상품 정보를 반환한다.", response = List.class)
	@GetMapping("/category/{category}")
	public List<Product> searchProductByCategory(@PathVariable String category) {
		return service.searchProductByCategory(category);
	}

	@ApiOperation(value = "상품명과 카테고리에 맞는 상품 정보를 반환한다.", response = List.class)
	@GetMapping("/nameandcategory")
	public List<Product> selectProductByNameAndCategory(@RequestParam("name") String name, @RequestParam("category") String category) {
		return service.selectProductByNameAndCategory(new Product(name, category));
	}
}
