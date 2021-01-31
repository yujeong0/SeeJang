package com.springboot.pjt1.shoppingList.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.springboot.pjt1.repository.dto.ShoppingList;
import com.springboot.pjt1.repository.mapper.ShoppingListMapper;

@Service
public class ShoppingListServiceImpl implements ShoppingListService   {

	ShoppingListMapper mapper;
	
	@Override
	public List<ShoppingList> selectProductReviewByProductNo(String MemeberId) {
		return mapper.selectShoppingListByMemberId(MemeberId);
	}

	@Override
	public void insertShoppingList(ShoppingList shoppingList) {
		mapper.insertShoppingList(shoppingList);
	}

	@Override
	public void updateShoppingList(ShoppingList shoppingList) {
		mapper.updateShoppingList(shoppingList);
	}

	@Override
	public void deleteShoppingListByShoppingListNo(int shoppingListNo) {
		mapper.deleteShoppingListByShoppingListNo(shoppingListNo);
	}
	
}
