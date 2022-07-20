package com.spring_boot.MiniProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.MiniProject.model.UserVO;	

public interface IUserService {
	ArrayList<UserVO> selectAllUser();
	
	// 유저 조회 기능
	UserVO selectUser(String userId);
	
	// 회원가입
	void insertUser(UserVO vo);
	
	// 닉네임 체크
	String chkNickname(String name);
	
	// ID 체크
	String chkId(String id);
		
	// Email 체크
	String chkEmail(String email);
	
	// 마이페이지 수정
	void updateUser(UserVO vo);
	
	// 마이페이지 탈퇴
	void quitUser(String id);
}
