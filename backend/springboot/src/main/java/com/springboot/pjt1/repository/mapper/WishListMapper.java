package com.springboot.pjt1.repository.mapper;

import java.util.List;

import com.springboot.pjt1.repository.dto.WishList;

public interface WishListMapper {
	
	public List<WishList> selectWishListByMemberId(String memberId);

	public void insertWishList(WishList wishList);
	
	public void deleteWishListByNo(int wishNo);
	
}
