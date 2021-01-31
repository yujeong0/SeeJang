package com.springboot.pjt1.repository.dto;

public class ShoppingList {
	private String memberId;
	private int shoppingListNo;
	private String shoppingListName;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getShoppingListNo() {
		return shoppingListNo;
	}
	public void setShoppingListNo(int shoppingListNo) {
		this.shoppingListNo = shoppingListNo;
	}
	public String getShoppingListName() {
		return shoppingListName;
	}
	public void setShoppingListName(String shoppingListName) {
		this.shoppingListName = shoppingListName;
	}
	@Override
	public String toString() {
		return "ShoppingList [memberId=" + memberId + ", shoppingListNo=" + shoppingListNo + ", shoppingListName="
				+ shoppingListName + "]";
	}
	
}
