package com.spring_boot.MiniProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.MiniProject.model.CommentVO;
import com.spring_boot.MiniProject.model.NoteVO;
import com.spring_boot.MiniProject.model.UserVO;

public interface IAdminService {
	// 유저 검색(관리자페이지)
	ArrayList<UserVO> adminSelectUser(HashMap<String, Object> map);
	
	// 사용자 세부 확인
	UserVO adminDetailUser(String userId);
	
	// 사용자 저장
	void adminUpdateDetailUser(HashMap<String, Object> map);
	
	// 사용자 게시판 검색
	ArrayList<UserVO> adminPostSearch(HashMap<String, Object> map);
	
	// 사용자 게시판 상세 검색
	NoteVO adminDetailNote(String noteId);
	
	// 사용자 게시판 상세 저장
	void adminUpdateDetailNote(HashMap<String, Object> map);
	
	// 댓글 게시판 검색
	ArrayList<CommentVO> adminCommentSearch(HashMap<String, Object> map);
	
	// 댓글 게시판 상세 검색
	CommentVO adminDetailCmtView(String commentId);
	
	// 댓글 사용자 게시판 상세 저장
	void adminUpdateDetailCmt(HashMap<String, Object> map);
}
