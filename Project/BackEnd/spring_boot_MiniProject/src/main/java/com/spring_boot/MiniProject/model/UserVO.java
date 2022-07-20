package com.spring_boot.MiniProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userImg;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date userActivateDate;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date userCreatedDate;
	private String userNickname;
	private String userCompany;
	private int roll;	// 0:일반유저/1:관리자
	private int userState;	//0:정상/1:차단/2:삭제
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public Date getUserActivateDate() {
		return userActivateDate;
	}
	public void setUserActivateDate(Date userActivateDate) {
		this.userActivateDate = userActivateDate;
	}
	public Date getUserCreatedDate() {
		return userCreatedDate;
	}
	public void setUserCreatedDate(Date userCreatedDate) {
		this.userCreatedDate = userCreatedDate;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserCompany() {
		return userCompany;
	}
	public void setUserCompany(String userCompany) {
		this.userCompany = userCompany;
	}
	public int getRoll() {
		return roll;
	}
	public void setRoll(int roll) {
		this.roll = roll;
	}
	public int getUserState() {
		return userState;
	}
	public void setUserState(int userState) {
		this.userState = userState;
	}
	
	
	
}
