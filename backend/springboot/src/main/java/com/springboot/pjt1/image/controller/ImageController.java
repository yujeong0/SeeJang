package com.springboot.pjt1.image.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.springboot.pjt1.image.service.ImageService;

@CrossOrigin(origins = { "http://localhost:8080" }, allowCredentials = "true")
@RestController
public class ImageController {

	@Autowired
	private ImageService service;
	
	@PostMapping("/searchImage")
	public Map<String, Object> searchImage(MultipartRequest request) {
		System.out.println(request);
		
		MultiValueMap<String, MultipartFile> map = (MultiValueMap<String, MultipartFile>) request.getMultiFileMap();
		if (map.size() == 0) {
			System.out.println("파일이 없습니다.");
			return null;
		}
		else {
			MultipartFile file = map.get("file").get(0);	// 이미지 파일
			MultipartFile mode = map.get("mode").get(0);	// 모드 이름
			
			// 파일을 지정된 경로로 저장
			String fileName = service.storeFile(file); 
			System.out.println(fileName);
			
			Map<String, Object> resultMap = null;
			// mode 별 다른 동작
			switch(mode.getOriginalFilename()) {
			case "1":	// 1  : 일반인
				try {
					return service.searchProductDetail(service.getProductName(fileName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			case "2":	// 2  : 시각장애인 위치 찾기 음성출력으로 왼쪽, 오른쪽에 있다.
				String itemName = map.get("item").get(0).getOriginalFilename();	// 찾는 상품이름
				resultMap = new HashMap<>();
				resultMap.put("result", service.getDirection(fileName, itemName));
				break;
			case "3":	// 3  : 시각장애인 상품 확인 음성출력으로 이거 뭐다 
				resultMap = new HashMap<>();
				resultMap.put("result", service.getProductName(service.getProductName(fileName)));
				break;
			}
			return resultMap;
		
		}
	}
}