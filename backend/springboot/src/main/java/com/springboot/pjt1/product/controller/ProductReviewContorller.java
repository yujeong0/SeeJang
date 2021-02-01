package com.springboot.pjt1.product.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.pjt1.product.service.ProductReviewService;
import com.springboot.pjt1.repository.dto.ProductReview;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "http://localhost:8080" }, allowCredentials = "true")
@RestController
@RequestMapping("/product/review")
public class ProductReviewContorller {
	
	@Autowired
	private ProductReviewService service;
	
	@ApiOperation(value = "리뷰를 등록한다.", response = List.class)
	@PostMapping
	public void insertProductReview(ProductReview productReview) {
		service.insertProductReview(productReview);
	}

	@ApiOperation(value = "리뷰를 수정한다.", response = List.class)
	@PutMapping
	public void searchProductByName(ProductReview productReview) throws IOException {
		service.updateProductReviewByCommentNo(productReview);
	}
	
	@ApiOperation(value = "리뷰를 삭제한다.", response = List.class)
	@DeleteMapping
	public void deleteProductReviewByCommentNo(@RequestParam int commentNo) {
		service.deleteProductReviewByCommentNo(commentNo);
	}

	@ApiOperation(value = "리뷰를 가져온다.", response = List.class)
	@GetMapping()
	public List<ProductReview> selectProductReviewByProductNo(@RequestParam("product_no") int productNo) {
		return service.selectProductReviewByProductNo(productNo);	
	}
	
}
