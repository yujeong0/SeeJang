package com.springboot.pjt1.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.pjt1.member.service.MemberService;
import com.springboot.pjt1.repository.dto.Member;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login")
	public void loginForm() { }
	
	@PostMapping("/login")
	public String login(Member member, HttpSession session) throws Exception {
		member = service.login(member);
		
		if (member != null) {
			session.removeAttribute("msg");
			session.setAttribute("member", member);
			return "index";
		} 
		else {
			session.setAttribute("msg", "아이디 또는 패스워드가 다릅니다.");
			return "redirect:login";
		}		
		
	}
	
	@GetMapping("/regist")
	public void registForm() { }
	
	@PostMapping("/regist")
	public String regist(Member member) throws Exception {
		service.insertMember(member);
		return "index";
	}
	
	@GetMapping("/modify")
	public void modifyForm() { }
	
	@PostMapping("/modify")
	public String modify(Member member) throws Exception {
		service.updateMemberInfo(member);
		return "redirect:detail";
	}
	
	@GetMapping("/delete")
	public void delete() { }
	
	@PostMapping("/delete")
	public String delete(String id, HttpSession session) throws Exception {
		System.out.println("id : " + id);
		service.deleteMember(id);
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/detail")
	public void detail(HttpSession session, Model model) throws Exception {
		model.addAttribute("member", service.selectMemberById(((Member)session.getAttribute("member")).getId()));
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/mypage")
	public void mypage() throws Exception { }
	
	
	@GetMapping("/checkDupId")
	@ResponseBody
	public Map<String, Object> checkDupId(String id, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		System.out.println(id);
		Member member = service.selectMemberById(id);
		System.out.println(member);
		// 아이디가 없으면
		if(member == null) {
			map.put("msg", "사용이 가능한 아이디입니다.");
			map.put("result", true);
			return map;
		}
		
		map.put("msg", "사용 가능한 아이디가 아닙니다.");
		map.put("result", false);
		return map;
	}
	
}
