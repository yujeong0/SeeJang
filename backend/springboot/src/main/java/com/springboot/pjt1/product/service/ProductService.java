package com.springboot.pjt1.product.service;

import java.util.List;
import java.util.Map;

import com.springboot.pjt1.repository.dto.Product;

public interface ProductService {

	List<Product> searchProduct();

	List<Product> searchProductByName(String name);

	List<Product> searchProductByCategory(String category);

	List<Product> selectProductByNameAndCategory(Product product);

}