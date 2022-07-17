package com.spring_boot.MiniProject.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot.MiniProject.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	// 로그인 처리
	@ResponseBody
	@RequestMapping("/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param,
							 HttpSession session) {
		String memId = memService.loginCheck(param);
		String result = "fail";

		if(memId != null) {
			session.setAttribute("sid", memId);
			result = "success";
		}
		return result;
	}
	
	// 로그아웃 처리
	@RequestMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}

