package com.spring_boot.MiniProject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot.MiniProject.model.CategoryVO;
import com.spring_boot.MiniProject.model.NoteVO;
import com.spring_boot.MiniProject.service.NoteService;

@Controller
public class NoteController {
	
	@Autowired
	NoteService noteService;

	@RequestMapping("/test")
	public String viewIndex() {
		return "test/index";
	}

	// 공지사항페이지 보기
	@RequestMapping("/test/noticePage")
	public String viewNoticePage() {
		return "test/noticePage";
	}

	// 질문페이지 보기
	@RequestMapping("/test/questionPage")
	public String viewQuestionPage(Model model) {
		
		ArrayList<String> hashtagList = noteService.selectHashtag();
		
		model.addAttribute("hashtagList", hashtagList);
		
		return "test/questionPage";
	}

	// 자유페이지 보기
	@RequestMapping("/test/talkPage")
	public String viewtalkPage() {
		return "test/talkPage";
	}

	// 뉴스페이지 보기
	@RequestMapping("/test/ITNewsPage")
	public String viewITNewsPage() {
		return "test/ITNewsPage";
	}
	
	@ResponseBody
	@RequestMapping("/test/getTags")
	public ArrayList<String> getTags(){
		return noteService.selectHashtag();
	}


	// 게시글 작성페이지 보기
	@RequestMapping("/test/writePage")
	public String viewWritePage(Model model, HttpSession session) {
		
		ArrayList<CategoryVO> categoryList;
		
		System.out.println(session.getAttribute("sid"));
		
		if(session.getAttribute("sid")==null) {
			return "redirect:/test";
		}else if(Integer.parseInt(session.getAttribute("roll").toString()) == 0) {
			categoryList = noteService.selectUserCategory();
		}else {
			categoryList = noteService.selectAllCategory();
		}
		
		model.addAttribute("categoryList", categoryList);
		
		return "test/writePage";
	}

	// 게시글 작성 처리
	@ResponseBody
	@RequestMapping("/test/write")
	public String write(@RequestParam("categoryId") int categoryId,
			@RequestParam("noteTitle") String noteTitle,
			@RequestParam("hashtag[]") ArrayList<String> hashtag,
			@RequestParam("note") String note,
			HttpSession session) {
		
		NoteVO vo = new NoteVO();
		
		vo.setUserId(session.getAttribute("sid").toString());
		vo.setCategoryId(categoryId);
		vo.setNoteTitle(noteTitle);
		vo.setNote(note);
		
		if(!hashtag.get(0).equals("null")) {
			if(hashtag.size() > 0) vo.setHashName1(hashtag.get(0));
			if(hashtag.size() > 1) vo.setHashName2(hashtag.get(1));
			if(hashtag.size() > 2) vo.setHashName3(hashtag.get(2));
			if(hashtag.size() > 3) vo.setHashName4(hashtag.get(3));
			if(hashtag.size() > 4) vo.setHashName5(hashtag.get(4));
			if(hashtag.size() > 5) vo.setHashName6(hashtag.get(5));
			if(hashtag.size() > 6) vo.setHashName7(hashtag.get(6));
			if(hashtag.size() > 7) vo.setHashName8(hashtag.get(7));
			if(hashtag.size() > 8) vo.setHashName9(hashtag.get(8));
			if(hashtag.size() > 9) vo.setHashName10(hashtag.get(9));
		}
		
		noteService.InsertNote(vo);
		
		return "SUCCESS";
	}
	

}
