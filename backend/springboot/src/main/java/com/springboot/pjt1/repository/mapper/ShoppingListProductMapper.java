package com.springboot.pjt1.repository.mapper;

import java.util.List;

import com.springboot.pjt1.repository.dto.ShoppingList;

public interface ShoppingListProductMapper {
	public List<ShoppingList> selectShoppingListProductByMemberId(String MemeberId);
	public void insertShoppingListProduct(ShoppingList shoppingList);
	public void updateShoppingListProduct(ShoppingList shoppingList);
	public void deleteShoppingListByShoppingListProductNo(int shoppingListNo);
}
