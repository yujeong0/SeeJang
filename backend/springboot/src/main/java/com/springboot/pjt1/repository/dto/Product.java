package com.springboot.pjt1.repository.dto;

public class Product {
	private int productNo;
	private String productName;
	private String productPrice;
	private String category;
	private String reviewLink;
	private String imageName;
	
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getReviewLink() {
		return reviewLink;
	}
	public void setReviewLink(String reviewLink) {
		this.reviewLink = reviewLink;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Product(String productName, String category) {
		this.productName = productName;
		this.category = category;
	}
	
}
