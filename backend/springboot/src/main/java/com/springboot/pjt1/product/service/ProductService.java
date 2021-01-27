package com.springboot.pjt1.product.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.springboot.pjt1.repository.dto.Product;
import com.springboot.pjt1.repository.dto.Review;

public interface ProductService {

	List<Product> searchProduct();

	List<Product> searchProductByName(String name);

	Product selectProductByExactName(String name);

	List<Product> searchProductByCategory(String category);

	List<Product> selectProductByNameAndCategory(Product product);

	List<Review> reviewList(String name) throws IOException;

	Map<String, Object> searchProductDetail(String name) throws IOException;

}