package com.springboot.pjt1.shoppingList.controller;

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

import com.springboot.pjt1.repository.dto.ShoppingList;
import com.springboot.pjt1.shoppingList.service.ShoppingListService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" })
@RestController
@RequestMapping("/shoppingList")
public class ShoppingListContorller {
	
	@Autowired
	private ShoppingListService service;
	
	@ApiOperation(value = "쇼핑리스트 제목 등록", response = List.class)
	@PostMapping
	public void insertShoppingList(ShoppingList shoppingList) {
		service.insertShoppingList(shoppingList);
	}

	@ApiOperation(value = "쇼핑리스트 제목 수정", response = List.class)
	@PutMapping
	public void updateShoppingList(ShoppingList shoppingList) throws IOException {
		service.updateShoppingList(shoppingList);
	}
	
	@ApiOperation(value = "쇼핑리스트 제목 삭제", response = List.class)
	@DeleteMapping
	public void deleteProductReviewByCommentNo(@RequestParam int shoppingListNo) {
		service.deleteShoppingListByShoppingListNo(shoppingListNo);
	}

	@ApiOperation(value = "쇼핑리스트들을 가져옴", response = List.class)
	@GetMapping()
	public List<ShoppingList> selectProductReviewByProductNo(@RequestParam("Memeber_id") String MemeberId) {
		return service.selectProductReviewByProductNo(MemeberId);	
	}
	
}
