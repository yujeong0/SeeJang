package com.springboot.pjt1.image.controller;

import java.nio.file.Path;
import java.util.Enumeration;

import org.apache.ibatis.javassist.bytecode.Descriptor.Iterator;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.util.MultiValueMap;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.springboot.pjt1.image.service.ImageService;
import com.springboot.pjt1.product.service.ProductService;

@CrossOrigin(origins = { "*" })
@RestController
public class ImageController {

	@Autowired
	private ImageService service;

	@PostMapping("/saveImage")
	public void saveImage(MultipartRequest file) {
		// 1  : 일반인
		// 2  : 시각장애인 위치 찾기 음성출력으로 왼쪽, 오른쪽에 있다.
		// 3  : 시각장애인 상품 확인 음성출력으로 이거 뭐다 
		System.out.println(file);
		MultiValueMap<String, MultipartFile> map = (MultiValueMap<String, MultipartFile>) file.getMultiFileMap();
		if (map.size() == 0)
			System.out.println("파일이 없습니다.");
		else {
			for (String key : map.keySet()) {
				Path fileName = service.storeFile(map.get(key).get(0)); 
				System.out.println(fileName);
				// 파일을 지정된 경로로 저장
				// 사진이 저장된 경로를 파이썬 코드로 줌
				String productName = service.getProductName(fileName.toString());
				System.out.println(productName);
				
				// 파이썬에서 받은 결과 string으로 db 검색해서 전달해야함..
				// 전달해야할 것은 이마트 product, 최저가 크롤링 결과, 이마트 리뷰.... 아니 이거 어떻게 잘 연결하냐
				
				// 1. 이마트 product 정보
//				new ProductController().searchProductByName(productName);
//				productService.searchProductDetail("이름");
				// 2. 이마트 리뷰
				
				// 3. 최저가 크롤링 결과
			}
		}
		
	}
//	@PostMapping("/blind/place")
//	public void searchPlace(MultipartRequest file) {
//		
//	}
//	@PostMapping("/blind/check")
//	public void searchCheck(MultipartRequest file) {
//		
//	}
//	@PostMapping("/blind/check")
//	public void searchCheck(MultipartRequest file) {
//		
//	}
}