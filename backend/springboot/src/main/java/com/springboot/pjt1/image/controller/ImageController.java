package com.springboot.pjt1.image.controller;

import java.nio.file.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.pjt1.image.service.ImageService;
import com.springboot.pjt1.product.controller.ProductController;

@RestController
public class ImageController {

	@Autowired
	private ImageService service;

	@PostMapping("/searchImage")
	public void searchImage(@RequestParam("file") MultipartFile file) {
		// 파일을 지정된 경로로 저장
		Path fileName = service.storeFile(file);
		System.out.println(fileName);
		
		// 사진이 저장된 경로를 파이썬 코드로 줌
		String productName = service.getProductName(fileName.toString());
		
		// 파이썬에서 받은 결과 string으로 db 검색해서 전달해야함..
		// 전달해야할 것은 이마트 product, 최저가 크롤링 결과, 이마트 리뷰.... 아니 이거 어떻게 잘 연결하냐
		
		// 1. 이마트 product 정보
		new ProductController().searchProductByName(productName);
		
		// 2. 이마트 리뷰
		
		// 3. 최저가 크롤링 결과
	}
}
