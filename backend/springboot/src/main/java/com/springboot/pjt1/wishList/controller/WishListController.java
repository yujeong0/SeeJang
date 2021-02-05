package com.springboot.pjt1.wishList.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.pjt1.repository.dto.WishList;
import com.springboot.pjt1.wishList.service.WishListService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, allowCredentials = "true")
@RestController
@RequestMapping("/wishList")
public class WishListController {
	
	@Autowired
	WishListService service;
	
	@ApiOperation(value = "사용자의 모든 찜 목록을 반환한다.", response = List.class)
	@GetMapping
	public List<WishList> searchWishListByMemberId(String memberId) {
		return service.searchWishListByMemberId(memberId);
	}
	
	@ApiOperation(value = "찜 목록을 추가한다.", response = Integer.class)
	@PostMapping("/add")
	public String addWishListByMemberId(WishList wishList) {
		try { 
			service.addWishListByMemberId(wishList);
			return "OK";
		} catch(Exception e) {
			return "FAIL";
		}
	}
	
	@ApiOperation(value = "사용자의 찜 목록 중 한 항목을 삭제한다.", response = Integer.class)
	@PostMapping("/remove")
	public String removeWishListByNo(int wishNo) {
		try { 
			service.removeWishListByNo(wishNo);
			return "OK";
		} catch(Exception e) {
			return "FAIL";
		}
	}
}
