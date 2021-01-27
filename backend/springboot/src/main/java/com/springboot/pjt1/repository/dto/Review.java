package com.springboot.pjt1.repository.dto;

public class Review {
	private int product_no;
	private String score;
	private String comment;
	private String date;
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Review [product_no=" + product_no + ", score=" + score + ", comment=" + comment + ", date=" + date
				+ "]";
	}
	
}
