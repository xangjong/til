package com.spring_boot.MiniProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot.MiniProject.dao.IUserDAO;
import com.spring_boot.MiniProject.model.UserVO;

@Service
public class UserService implements IUserService {
	
	@Autowired
	@Qualifier("IUserDAO")
	IUserDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;

	@Override
	public ArrayList<UserVO> selectAllUser() {
		return dao.selectAllUser();
	}

	// 유저 조회 기능
	@Override
	public UserVO selectUser(String userId) {
		return dao.selectUser(userId);
	}

	// 회원가입
	@Override
	public void insertUser(UserVO vo) {
		// 비밀번호 암호화 처리한 후 mapper에게 전달
		String encodedPwd = pwdEncoder.encode(vo.getUserPw());
		vo.setUserPw(encodedPwd);
		
		dao.insertUser(vo);
	}
	
	// 유저 닉네임 조회
	@Override
	public String selectUserNickname(String userId) {
		// TODO Auto-generated method stub
		return dao.selectUserNickname(userId);
	}
	
	// 유저 이미지 조회
	@Override
	public String selectUserImg(String userId) {
		// TODO Auto-generated method stub
		return dao.selectUserImg(userId);
	}

	// 유저 권한 조회
	@Override
	public int selectRoll(String userId) {
		// TODO Auto-generated method stub
		return dao.selectRoll(userId);
	}
	
	// 유저 상태 조회
	@Override
	public int selectUserState(String userId) {
		// TODO Auto-generated method stub
		return dao.selectUserState(userId);
	}
	
	// 닉네임 체크
	@Override
	public String chkNickname(String name) {
		return dao.chkNickname(name);
	}
	
	// ID 체크
	@Override
	public String chkId(String id) {
		return dao.chkId(id);
	}
	
	// Email 체크
	@Override
	public String chkEmail(String email) {
		return dao.chkEmail(email);
	}
	
	// 마이페이지 수정
	@Override
	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
	}
	
	// 마이페이지 회원 탈퇴
	@Override
	public void quitUser(String id) {
		dao.quitUser(id);
	}
	
	// 아이디 찾기
	@Override
	public String searchId(HashMap<String, Object> map) {
		return dao.searchId(map);
	}

	// 비밀번호 찾기
	@Override
	public String searchPw(HashMap<String, Object> map) {
		return dao.searchPw(map);
	}
	
	// 임시 비밀번호 저장
	@Override
	public void updateTmpPw(HashMap<String, Object> map) {
		dao.updateTmpPw(map);
	}
}
