package com.spring_boot.MiniProject.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MiniPjController {
	
	@RequestMapping("/")
	public String viewIndex() {
		return "index";
	}
	
	// 공지사항페이지 보기
	@RequestMapping("/noticePage")
	public String viewNoticePage() {
		return "subPage/noticePage";
	}
	
	// 질문페이지 보기
	@RequestMapping("/questionPage")
	public String viewQuestionPage() {
		return "subPage/questionPage";
	}
	
	// 자유페이지 보기
	@RequestMapping("/talkPage")
	public String viewtalkPage() {
		return "subPage/talkPage";
	}
	
	// 뉴스페이지 보기
	@RequestMapping("/ITNewsPage")
	public String viewITNewsPage() {
		return "subPage/ITNewsPage";
	}
	
	// 로그인페이지 보기
	@RequestMapping("/loginForm")
	public String viewlogin() {
		return "subPage/loginForm";
	}
	
	// 회원가입페이지 보기
	@RequestMapping("/join")
	public String viewjoin() {
		return "subPage/join";
	}
	
	// 회원가입 완료 페이지 보기
	@RequestMapping("/joinComplete")
	public String viewjoinComplete() {
		return "subPage/joinComplete";
	}
	
	// 게시글 작성페이지 보기
	@RequestMapping("/writePage")
	public String viewWritePage() {
		return "subPage/writePage";
	}
	
	// 마이페이지 보기
	@RequestMapping("/myPage")
	public String viewMyPage() {
		return "subPage/myPage";
	}
	
	// 마이 페이지 편집 보기
	@RequestMapping("/myPageEdit")
	public String viewMyPageEdit() {
		return "subPage/myPageEdit";
	}
	
	// 마이페이지 질문 보기
	@RequestMapping("/myPageQuestion")
		public String viewMyPageQuestion() {
			return "subPage/myPageQuestion";
		}
		
	// 마이페이지 답변 보기
	@RequestMapping("/myPageAnswer")
	public String viewMyPageAnswer() {
		return "subPage/myPageAnswer";
	}
	
	// 마이페이지 댓글 보기
	@RequestMapping("/myPageComment")
	public String viewMyPageComment() {
		return "subPage/myPageComment";
	}
	
	// 관리자 유저 관리 페이지 보기
	@RequestMapping("/adminUser")
	public String adiminUserView() {
		return "subPage/adminUser";
	}
	
	// 관리자 게시판 관리 페이지 보기
	@RequestMapping("/adminPost")
	public String adiminPostView() {
		return "subPage/adminPost";
	}
	
	// 관리자 댓글 관리 페이지 보기
	@RequestMapping("/adminComment")
	public String adiminUserComment() {
		return "subPage/adminComment";
	}
	
	// 관리자 유저 페이지 보기
	@RequestMapping("/adminHashTag")
	public String adiminHashTagView() {
		return "subPage/adminHashTag";
	}
	
}
