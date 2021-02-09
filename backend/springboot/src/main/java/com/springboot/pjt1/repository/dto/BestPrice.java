package com.springboot.pjt1.repository.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(description = "사이트 최저가 정보를 담는 dto")
public class BestPrice {
	@ApiModelProperty(notes = "최저가 사이트명")
	private String siteName;
	@ApiModelProperty(notes = "상품명")
	private String productName;
	@ApiModelProperty(notes = "상품가격")
	private String price;
	@ApiModelProperty(notes = "최저가 사이트 링크")
	private String link;
	
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
}
