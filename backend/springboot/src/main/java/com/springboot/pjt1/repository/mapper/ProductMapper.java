package com.springboot.pjt1.repository.mapper;

import java.util.List;

import com.springboot.pjt1.repository.dto.Product;
import com.springboot.pjt1.repository.dto.ProductReview;

public interface ProductMapper {
	
	List<Product> selectProduct();
	
	List<Product> selectProductByName(String name);

	Product selectProductByExactName(String name);
	
	List<Product> selectProductByCategory(String category);
	
	List<Product> selectProductByNameAndCategory(Product product);
	
	List<ProductReview> selectProductReviewByProductNo(int ProductNo);
	int insertProductReview(ProductReview productReview);
	int updateProductReviewByCommentNo(ProductReview productReview);
	int deleteProductReviewByCommentNo(int commentNo);
}
