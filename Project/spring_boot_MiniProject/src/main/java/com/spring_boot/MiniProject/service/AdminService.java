package com.spring_boot.MiniProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.MiniProject.dao.IAdminDAO;
import com.spring_boot.MiniProject.model.CommentVO;
import com.spring_boot.MiniProject.model.NoteVO;
import com.spring_boot.MiniProject.model.UserVO;



@Service
public class AdminService implements IAdminService {
	
	@Autowired
	@Qualifier("IAdminDAO")
	IAdminDAO dao;
	
	// 유저 검색(관리자페이지)
	@Override
	public ArrayList<UserVO> adminSelectUser(HashMap<String, Object> map) {
		return dao.adminSelectUser(map);
	}
	
	// 사용자 세부 확인
	@Override
	public UserVO adminDetailUser(String userId) {
		return dao.adminDetailUser(userId);
	}
	
	// 사용자 저장
	@Override
	public void adminUpdateDetailUser(HashMap<String, Object> map) {
		dao.adminUpdateDetailUser(map);
	}
	
	// 게시판 조회
	@Override
	public ArrayList<UserVO> adminPostSearch(HashMap<String, Object> map) {
		return dao.adminPostSearch(map);
	}
	
	// 게시판 상세 조회
	@Override
	public NoteVO adminDetailNote(String noteId) {
		return dao.adminDetailNote(noteId);
	}
	
	// 사용자 게시판 상세 저장
	@Override
	public void adminUpdateDetailNote(HashMap<String, Object> map) {
		dao.adminUpdateDetailNote(map);
	}
	
	// 댓글 게시판 검색
	@Override
	public ArrayList<CommentVO> adminCommentSearch(HashMap<String, Object> map) {
		return dao.adminCommentSearch(map);
	}
	
	// 댓글 게시판 상세 검색
	@Override
	public CommentVO adminDetailCmtView(String commentId) {
		return dao.adminDetailCmtView(commentId);
	}
	
	// 댓글 게시판 상세 저장
	@Override
	public void adminUpdateDetailCmt(HashMap<String, Object> map) {
		dao.adminUpdateDetailCmt(map);
	}
	
}
