package com.spring_boot.MiniProject.model;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoteVO {
	private int noteId;
	private String userId;
	private int pageViewState;
	private int categoryId;
	private String noteTitle;
	private String note;
	private String noteView;
	private String noteLike;
	private String noteCommentNum;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date noteCreatedDate;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date noteUpdatedDate;
	private String hashName1;
	private String hashName2;
	private String hashName3;
	private String hashName4;
	private String hashName5;
	private String hashName6;
	private String hashName7;
	private String hashName8;
	private String hashName9;
	private String hashName10;
	
	private ArrayList<String> hashname;
	private String userNickname;
	
	
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPageViewState() {
		return pageViewState;
	}
	public void setPageViewState(int pageViewState) {
		this.pageViewState = pageViewState;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getNoteView() {
		return noteView;
	}
	public void setNoteView(String noteView) {
		this.noteView = noteView;
	}
	public String getNoteLike() {
		return noteLike;
	}
	public void setNoteLike(String noteLike) {
		this.noteLike = noteLike;
	}
	public String getNoteCommentNum() {
		return noteCommentNum;
	}
	public void setNoteCommentNum(String noteCommentNum) {
		this.noteCommentNum = noteCommentNum;
	}
	public Date getNoteCreatedDate() {
		return noteCreatedDate;
	}
	public void setNoteCreatedDate(Date noteCreatedDate) {
		this.noteCreatedDate = noteCreatedDate;
	}
	public Date getNoteUpdatedDate() {
		return noteUpdatedDate;
	}
	public void setNoteUpdatedDate(Date noteUpdatedDate) {
		this.noteUpdatedDate = noteUpdatedDate;
	}
	public String getHashName1() {
		return hashName1;
	}
	public void setHashName1(String hashName1) {
		this.hashName1 = hashName1;
	}
	public String getHashName2() {
		return hashName2;
	}
	public void setHashName2(String hashName2) {
		this.hashName2 = hashName2;
	}
	public String getHashName3() {
		return hashName3;
	}
	public void setHashName3(String hashName3) {
		this.hashName3 = hashName3;
	}
	public String getHashName4() {
		return hashName4;
	}
	public void setHashName4(String hashName4) {
		this.hashName4 = hashName4;
	}
	public String getHashName5() {
		return hashName5;
	}
	public void setHashName5(String hashName5) {
		this.hashName5 = hashName5;
	}
	public String getHashName6() {
		return hashName6;
	}
	public void setHashName6(String hashName6) {
		this.hashName6 = hashName6;
	}
	public String getHashName7() {
		return hashName7;
	}
	public void setHashName7(String hashName7) {
		this.hashName7 = hashName7;
	}
	public String getHashName8() {
		return hashName8;
	}
	public void setHashName8(String hashName8) {
		this.hashName8 = hashName8;
	}
	public String getHashName9() {
		return hashName9;
	}
	public void setHashName9(String hashName9) {
		this.hashName9 = hashName9;
	}
	public String getHashName10() {
		return hashName10;
	}
	public void setHashName10(String hashName10) {
		this.hashName10 = hashName10;
	}
	public ArrayList<String> getHashname() {
		return hashname;
	}
	public void setHashname(ArrayList<String> hashname) {
		this.hashname = hashname;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	
	
	
}
