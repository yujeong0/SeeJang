package com.springboot.pjt1.image.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.springboot.pjt1.image.service.ImageService;

@CrossOrigin(origins = { "http://localhost:8080" }, allowCredentials = "true")
@RestController
public class ImageController {

	@Autowired
	private ImageService service;
	
	@GetMapping("/searchImage")
	public Map<String, Object> searchImage(MultipartRequest request) {
		System.out.println(request);
		
		MultiValueMap<String, MultipartFile> map = (MultiValueMap<String, MultipartFile>) request.getMultiFileMap();
		if (map.size() == 0)
			System.out.println("파일이 없습니다.");
		else {
			String fileName = null;
			for (String key : map.keySet()) {
				MultipartFile file = map.get(key).get(0);
				if(file.getOriginalFilename().equals("1")) {	// 1  : 일반인
					try {
						return service.searchProductDetail(service.getProductName(fileName));
					} catch (IOException e) {
						e.printStackTrace();
						return null;
					}
				}
				else if(file.getOriginalFilename().equals("2")) {	// 2  : 시각장애인 위치 찾기 음성출력으로 왼쪽, 오른쪽에 있다.
					Map<String, Object> resultMap = new HashMap<>();
					resultMap.put("result", service.getDirection(service.getProductName(fileName)));
					return resultMap;
					
				}
				else if(file.getOriginalFilename().equals("3")) {	// 3  : 시각장애인 상품 확인 음성출력으로 이거 뭐다 
					Map<String, Object> resultMap = new HashMap<>();
					resultMap.put("result", service.getProductName(service.getProductName(fileName)));
					return resultMap;
				}
				else {	// 파일을 지정된 경로로 저장
					fileName = service.storeFile(map.get(key).get(0)); 
					System.out.println(fileName);
				}
			}
		}
		
		return null;
	}
}