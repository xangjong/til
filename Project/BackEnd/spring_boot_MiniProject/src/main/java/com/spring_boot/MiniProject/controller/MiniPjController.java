package com.spring_boot.MiniProject.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MiniPjController {
	
	@RequestMapping("/")
	public String viewIndex() {
		return "index";
	}
	
	//********************** 게시판 *********************
	
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
	
	// 게시글 작성페이지 보기
	@RequestMapping("/writePage")
	public String viewWritePage() {
		return "subPage/writePage";
	}
	
	// 뷰페이지 보기
	@RequestMapping("/viewPage")
	public String viewViewPage() {
		return "subPage/viewPage";
	}
	
	//********************** 로그인 *********************
	
	// 로그인페이지 보기
	@RequestMapping("/loginForm")
	public String viewlogin() {
		return "subPage/loginForm";
	}
	
	// 아이디찾기 보기
	@RequestMapping("/idSearchForm")
	public String viewidSearchForm() {
		return "subPage/idSearchForm";
	}
	
	// 비밀번호찾기 보기
	@RequestMapping("/pwSearchForm")
	public String viewpwSearchForm() {
		return "subPage/pwSearchForm";
	}
	
	//********************** 회원가입 *********************
	
	// 회원가입페이지 보기
	@RequestMapping("/join")
	public String viewjoin() {
		return "subPage/join";
	}
	
	// 회원가입 완료페이지 보기
	@RequestMapping("/joinComplete")
	public String viewjoinComplete() {
		return "subPage/joinComplete";
	}
	
	
	//********************** 마이페이지 *********************
	
	// 마이페이지 보기
	@RequestMapping("/myPage")
	public String viewMyPage() {
		return "subPage/myPage";
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
	
	//********************** 관리자페이지 *********************
	
	// 마이페이지 댓글 보기
	@RequestMapping("/myPageComment")
	public String viewMyPageComment() {
		return "subPage/myPageComment";
	}
	
	// 마이페이지 수정 보기
	@RequestMapping("/myPageEdit")
	public String viewMyPageEditPage() {
		return "subPage/myPageEdit";
	}
	
	// 관리자 유저페이지 보기
	@RequestMapping("/adminUser")
	public String viewAdminUserPage() {
		return "subPage/adminUser";
	}
	
	// 관리자 게시글페이지 보기
	@RequestMapping("/adminPost")
	public String viewAdminPostPage() {
		return "subPage/adminPost";
	}
	
	// 관리자 댓글페이지 보기
	@RequestMapping("/adminComment")
	public String viewAdminCommentPage() {
		return "subPage/adminComment";
	}
	
	// 관리자 해시태그페이지 보기
	@RequestMapping("/adminHashTag")
	public String viewAdminHashTagPage() {
		return "subPage/adminHashTag";
	}
	
	// 관리자 해시태그페이지 보기
	@RequestMapping("/idSearch")
	public String idSearch() {
		return "subPage/idSearch";
	}
	
	// 관리자 해시태그페이지 보기
	@RequestMapping("/pwSearch")
	public String pwSearch() {
		return "subPage/pwSearch";
	}
	
	// 관리자 해시태그페이지 보기
	@RequestMapping("/newPw")
	public String newPw() {
		return "subPage/newPw";
	}
}
