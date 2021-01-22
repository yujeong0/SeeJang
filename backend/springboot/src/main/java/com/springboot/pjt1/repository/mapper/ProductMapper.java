package com.springboot.pjt1.repository.mapper;

import java.util.List;

import com.springboot.pjt1.repository.dto.Product;

public interface ProductMapper {
	
	List<Product> selectProduct();
	
	List<Product> selectProductByName(String name);
	
	List<Product> selectProductByCategory(String category);
	
	List<Product> selectProductByNameAndCategory(Product product);
}
