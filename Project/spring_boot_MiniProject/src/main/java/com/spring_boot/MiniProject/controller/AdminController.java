package com.spring_boot.MiniProject.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot.MiniProject.model.CommentVO;
import com.spring_boot.MiniProject.model.NoteVO;
import com.spring_boot.MiniProject.model.UserVO;
import com.spring_boot.MiniProject.service.AdminService;
import com.spring_boot.MiniProject.service.UserService;


@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	PasswordEncoder pwEncoder; 
	
	//관리자 메뉴로 가기
	@RequestMapping("/subPage/adminUser")
		public String viewAdmin() {
		return "/subPage/adminUser";
	}
	
	//관리자 메뉴 해시태그 관리로 가기
	@RequestMapping("/subPage/adminHashTag")
		public String viewAdminHashTag() {
		return "/subPage/adminHashTag";
	}
	
	// 사용자 관리 검색
	@RequestMapping("/subPage/adminUserSearch")
	public String viewAdminUserSearch(@RequestParam HashMap<String, Object> param, Model model) {
		
		// 검색 조건이 없을 때 모두 검색
		if(param.get("userId").equals("")) param.put("userId", "%");
		if(param.get("userName").equals("")) param.put("userName", "%");
		if(param.get("roll").equals("")) param.put("roll", "%");
		if(param.get("userState").equals("")) param.put("userState", "%");
		
		ArrayList<UserVO> users = adminService.adminSelectUser(param);
		
		model.addAttribute("users", users);
				
		return "/subPage/adminUser";
	
	}
	
	// 사용자 세부 관리 수정
	@RequestMapping("/subPage/adminDetailUserView/{userId}")
	public String viewAdminDetailUserView(@PathVariable String userId, Model model) {
		UserVO vo = adminService.adminDetailUser(userId);
		
		model.addAttribute("user", vo);
		
		return "/subPage/adminDetailUserView";
	}
	
	// 사용자 세부 관리 수정
	@ResponseBody
	@RequestMapping("/subPage/adminUpdateUser")
	public String viewAdminDetailUpdateUser(@RequestParam HashMap<String, Object> param) {
		
		String userId = (String)param.get("userId");
		String userPw = (String)param.get("userPw");
		String userEmail = (String)param.get("userEmail1") + "@" +  (String)param.get("userEmail2");
		
		param.put("userEmail", userEmail);
		
		if(!userPw.equals("")) {
			// 비밀번호 암호화 처리한 후 서비스에게 전달
			String encodedPwd = pwEncoder.encode(userPw);
			param.put("userPw", encodedPwd);
		} else {
			UserVO voPw = userService.selectUser(userId);
			param.put("userPw", voPw.getUserPw());
		}

		adminService.adminUpdateDetailUser(param);
		
		return "SUCCESS";
	}
	
	//관리자 메뉴 게시글 관리로 가기
	@RequestMapping("/subPage/adminPost")
	public String viewAdminPost() {
		return "/subPage/adminPost";
	}
	
	// 게시판 조회
	@RequestMapping("/subPage/adminPostSearch")
	public String viewAdminPostSearch(@RequestParam HashMap<String, Object> param, Model model) {
		
		
		// 검색 조건이 없을 때 모두 검색
		if(param.get("userId").equals("")) param.put("userId", "%");
		if(param.get("userName").equals("")) param.put("userName", "%");
		if(param.get("noteTitle").equals("")) param.put("noteTitle", "%");
		if(param.get("categoryId").equals("")) param.put("categoryId", "%");
		if(param.get("noteCreatedDate").equals("")) param.put("noteCreatedDate", "%");
		if(param.get("noteUpdatedDate").equals("")) param.put("noteUpdatedDate", "%");
		
		ArrayList<UserVO> notes = adminService.adminPostSearch(param);
		
		model.addAttribute("notes", notes);
		
		return "/subPage/adminPost";
	}
	
	// 게시판 상세 조회
	@RequestMapping("/subPage/adminDetailNoteView/{noteId}")
	public String viewAdminDetailNoteView(@PathVariable String noteId, Model model) {
		NoteVO vo = adminService.adminDetailNote(noteId);
		
		model.addAttribute("note", vo);
		
		return "/subPage/adminDetailNoteView";
	}
	
	// 게시판 세부 수정
	@ResponseBody
	@RequestMapping("/subPage/adminUpdateNote")
	public String viewAdminDetailUpdateNote(@RequestParam HashMap<String, Object> param) {
		adminService.adminUpdateDetailNote(param);
		
		return "SUCCESS";
	}
	
	//관리자 메뉴 댓글 관리로 가기
	@RequestMapping("/subPage/adminComment")
	public String viewAdminComment() {
		return "/subPage/adminComment";
	}
	
	// 댓글 게시판 조회
	@RequestMapping("/subPage/adminCommentSearch")
	public String viewAdminCommentSearch(@RequestParam HashMap<String, Object> param, Model model) {
		
		
		// 검색 조건이 없을 때 모두 검색
		if(param.get("userId").equals("")) param.put("userId", "%");
		if(param.get("userName").equals("")) param.put("userName", "%");
		if(param.get("commentCreatedDate").equals("")) param.put("commentCreatedDate", "%");
		if(param.get("commentUpdatedDate").equals("")) param.put("commentUpdatedDate", "%");
		
		ArrayList<CommentVO> comments = adminService.adminCommentSearch(param);
		
		model.addAttribute("comments", comments);
		
		return "/subPage/adminComment";
	}
	
	// 댓글 게시판 상세 조회
	@RequestMapping("/subPage/adminDetailCmtView/{commentId}")
	public String viewAdminDetailCmtView(@PathVariable String commentId, Model model) {
		CommentVO vo = adminService.adminDetailCmtView(commentId);
		
		model.addAttribute("cmt", vo);
		
		return "/subPage/adminDetailCmtView";
	}
	
	// 게시판 세부 수정
	@ResponseBody
	@RequestMapping("/subPage/adminUpdateCmt")
	public String viewAdminDetailUpdateCmt(@RequestParam HashMap<String, Object> param) {
		
		System.out.println(param);

		adminService.adminUpdateDetailCmt(param);
		
		return "SUCCESS";
	}
	
}
