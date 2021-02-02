package com.springboot.pjt1.repository.dto;

import org.springframework.web.multipart.MultipartRequest;

public class Tmp {
	MultipartRequest file;
	String mode;
	
	public MultipartRequest getReq() {
		return file;
	}
	public void setReq(MultipartRequest req) {
		System.out.println("req");
		System.out.println(req);
		this.file = req;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		System.out.println("mode");
		System.out.println(mode);
		this.mode = mode;
	}
	
	
}
