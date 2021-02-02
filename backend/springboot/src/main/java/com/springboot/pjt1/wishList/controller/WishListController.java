package com.springboot.pjt1.wishList.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.springboot.pjt1.repository.dto.WishList;
import com.springboot.pjt1.wishList.service.WishListService;

@Controller
public class WishListController {
	
	@Autowired
	WishListService service;
	
	public List<WishList> searchWishListByMemberId(String memberId) {
		return service.searchWishListByMemberId(memberId);
	}

	public int addWishListByMemberId(WishList wishList) {
		return service.addWishListByMemberId(wishList);
	}
	
	public int removeWishListByNo(int wishNo) {
		return service.removeWishListByNo(wishNo);
	}
}
