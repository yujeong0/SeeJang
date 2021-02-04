package com.springboot.pjt1.shoppingList.service;

import java.util.List;

import com.springboot.pjt1.repository.dto.ShoppingList;

public interface ShoppingListService {

	List<ShoppingList> selectShoppingListByMemberId(String MemeberId);

	int insertShoppingList(ShoppingList shoppingList);

	void updateShoppingList(ShoppingList shoppingList);

	void deleteShoppingListByShoppingListNo(int shoppingListNo);

}