package com.springboot.pjt1.product.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.springboot.pjt1.repository.dto.Product;
import com.springboot.pjt1.repository.dto.ProductReview;

public interface ProductReviewService {

	List<ProductReview> selectProductReviewByProductNo(int ProductNo);
	void insertProductReview(ProductReview productReview);
	void updateProductReviewByCommentNo(ProductReview productReview);
	void deleteProductReviewByCommentNo(int commentNo);

}