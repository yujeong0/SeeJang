package com.springboot.pjt1.image.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.pjt1.exception.FileUploadException;
import com.springboot.pjt1.product.service.ProductService;
import com.springboot.pjt1.repository.dto.ImageProperties;

@Service
public class ImageService {
	
    private final Path fileLocation;
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    public ImageService(ImageProperties prop) {
    	// application.properties 에 지정해놓은 폴더경로를 상대경로에서 절대 경로로 변환 후 정규화된 경로(불필요한 부분 제거)를 가진 path 객체 생성..
        this.fileLocation = Paths.get(prop.getUploadDir())	
                .toAbsolutePath().normalize();
        
        try {
            Files.createDirectories(this.fileLocation);
        }catch(Exception e) {
            throw new FileUploadException("파일을 업로드할 디렉토리를 생성하지 못했습니다.", e);
        }
    }

    public String storeFile(MultipartFile file) {
    	// 파일 실제 이름에서 역슬래쉬를 슬래쉬로 바꿈
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        
        try {
            Path targetLocation = this.fileLocation.resolve(fileName);	// 폴더와 파일명 합쳐서 경로 만들기
            
            // 파일 받은 것을 경로에 넣는데 같은 이름이 있다면 덮어쓰기한다.
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
            
            return targetLocation.toString();
        }catch(Exception e) {
            throw new FileUploadException("["+fileName+"] 파일 업로드에 실패하였습니다. 다시 시도하십시오.",e);
        }
    }
    
	public Map<String, Object> searchProductDetail(String name) throws IOException {
		return productService.searchProductDetail(name);
	}
    
    // 일반인과 시각장애인을 위한 상품 확인!! 번호로는 1번 3번
    public String getProductName(String fileName) {	
    	// 여기서 파이썬 코드 돌아감 
    	return "정준영 바보";
    }
    
    // 시각 장애인을 위한 상품 위치 찾기!! 번호로는 2번
    public String getDirection(String fileName) {	
    	// 여기서 파이썬 코드 돌아감 
    	return "정준영 바보";
    }
}
