package com.springboot.pjt1.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.pjt1.repository.dto.ProductReview;
import com.springboot.pjt1.repository.mapper.ProductReviewMapper;

@Service
public class ProductReviewServiceImpl implements ProductReviewService {

	@Autowired
	ProductReviewMapper mapper;
	
	@Override
	public List<ProductReview> selectProductReviewByProductNo(int ProductNo) {
		return mapper.selectProductReviewByProductNo(ProductNo);
	}

	@Override
	public void insertProductReview(ProductReview productReview) {
		mapper.insertProductReview(productReview);
	}

	@Override
	public void updateProductReviewByCommentNo(ProductReview productReview) {
		mapper.updateProductReviewByCommentNo(productReview);
	}

	@Override
	public void deleteProductReviewByCommentNo(int commentNo) {
		mapper.deleteProductReviewByCommentNo(commentNo);
	}
	
}
