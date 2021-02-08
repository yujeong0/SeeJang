package com.springboot.pjt1.repository.dto;


public class Images {
	private byte[] image;
	private char state;
	private int num;
	
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
