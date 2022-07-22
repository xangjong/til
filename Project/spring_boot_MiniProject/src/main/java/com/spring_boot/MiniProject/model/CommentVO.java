package com.spring_boot.MiniProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommentVO {

	private int commentId;
	private String userId;
	private int noteId;
	private int pageViewState;
	private String comment;
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date commentCreatedDate;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date commentUpdatedDate;
	
	private int commentLike;
	
	private String userName;
	private String userNickname;
	private String userImg;
	private String noteTitle;
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}
	public int getPageViewState() {
		return pageViewState;
	}
	public void setPageViewState(int pageViewState) {
		this.pageViewState = pageViewState;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCommentCreatedDate() {
		return commentCreatedDate;
	}
	public void setCommentCreatedDate(Date commentCreatedDate) {
		this.commentCreatedDate = commentCreatedDate;
	}
	public Date getCommentUpdatedDate() {
		return commentUpdatedDate;
	}
	public void setCommentUpdatedDate(Date commentUpdatedDate) {
		this.commentUpdatedDate = commentUpdatedDate;
	}
	public int getCommentLike() {
		return commentLike;
	}
	public void setCommentLike(int commentLike) {
		this.commentLike = commentLike;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
}
