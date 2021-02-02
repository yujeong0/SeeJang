package com.springboot.pjt1.repository.dto;

public class ShoppingList {
	private String memberId;
	private int shoppingListNo;
	private String productName;
	private String productPrice;
	private boolean checked;
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	@Override
	public String toString() {
		return "ShoppingList [memberId=" + memberId + ", shoppingListNo=" + shoppingListNo + ", productName="
				+ productName + ", productPrice=" + productPrice + ", checked=" + checked + "]";
	}
	
	

}
