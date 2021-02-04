package com.springboot.pjt1.shoppingList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.pjt1.repository.dto.ShoppingList;
import com.springboot.pjt1.repository.mapper.ShoppingListMapper;

@Service
public class ShoppingListServiceImpl implements ShoppingListService   {

	@Autowired
	ShoppingListMapper mapper;
	
	@Override
	public List<ShoppingList> selectShoppingListByMemberId(String MemeberId) {
		return mapper.selectShoppingListByMemberId(MemeberId);
	}

	@Override
	public int insertShoppingList(ShoppingList shoppingList) {
		mapper.insertShoppingList(shoppingList);
		return shoppingList.getShoppingListNo();
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
