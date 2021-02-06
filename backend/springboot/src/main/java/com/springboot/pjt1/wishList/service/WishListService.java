package com.springboot.pjt1.wishList.service;

import java.util.List;

import com.springboot.pjt1.repository.dto.WishList;

public interface WishListService {

	List<WishList> searchWishListByMemberId(String memberId);

	void addWishListByMemberId(WishList wishList);

	void removeWishListByNo(int wishNo);

}