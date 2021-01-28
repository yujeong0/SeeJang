package com.springboot.pjt1.repository.dto;

public class ProductReview {
	private int comment_no;
	private int product_no;
	private String memberId;
	private String memberName;
	private String score;
	private String comment;
	private String date;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_id(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
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
		return "ProductReview [comment_no=" + comment_no + ", product_no=" + product_no + ", memberId=" + memberId
				+ ", memberName=" + memberName + ", score=" + score + ", comment=" + comment + ", date=" + date + "]";
	}

	
}
