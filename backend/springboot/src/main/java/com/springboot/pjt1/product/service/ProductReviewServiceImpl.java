package com.springboot.pjt1.product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.springboot.pjt1.repository.dto.ProductReview;
import com.springboot.pjt1.repository.mapper.ProductReviewMapper;

@Service
public class ProductReviewServiceImpl implements ProductReviewService {

	ProductReviewMapper mapper;
	
	@Override
	public List<ProductReview> selectProductReviewByProductNo(int ProductNo) {
		return mapper.selectProductReviewByProductNo(ProductNo);
	}

	@Override
	public int insertProductReview(ProductReview productReview) {
		mapper.insertProductReview(productReview);
		return 0;
	}

	@Override
	public int updateProductReviewByCommentNo(ProductReview productReview) {
		mapper.updateProductReviewByCommentNo(productReview);
		return 0;
	}

	@Override
	public int deleteProductReviewByCommentNo(int commentNo) {
		mapper.deleteProductReviewByCommentNo(commentNo);
		return 0;
	}
	
}
