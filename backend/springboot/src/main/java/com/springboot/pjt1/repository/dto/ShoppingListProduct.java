package com.springboot.pjt1.repository.dto;

public class ShoppingListProduct {
	private int shoopingListNo;
	private int productNo;
	private String productName;
	private String prdouctPrice;
	private int quantitiy;
	
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getShoopingListNo() {
		return shoopingListNo;
	}
	public void setShoopingListNo(int shoopingListNo) {
		this.shoopingListNo = shoopingListNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrdouctPrice() {
		return prdouctPrice;
	}
	public void setPrdouctPrice(String prdouctPrice) {
		this.prdouctPrice = prdouctPrice;
	}
	public int getQuantitiy() {
		return quantitiy;
	}
	public void setQuantitiy(int quantitiy) {
		this.quantitiy = quantitiy;
	}
	@Override
	public String toString() {
		return "ShoppingListProduct [shoopingListNo=" + shoopingListNo + ", productNo=" + productNo + ", productName="
				+ productName + ", prdouctPrice=" + prdouctPrice + ", quantitiy=" + quantitiy + "]";
	}

	
	
	
}
