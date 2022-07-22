package com.spring_boot.MiniProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.MiniProject.model.CategoryVO;
import com.spring_boot.MiniProject.model.CommentVO;
import com.spring_boot.MiniProject.model.NoteVO;

public interface INoteService {

	// 게시글 작성
	void InsertNote(NoteVO vo);

	void updateNote(NoteVO vo);

	void deleteNote(int noteId);

	void updateNoteView(int noteId);

	ArrayList<NoteVO> selectQuestionNoteList(int page);
	
	ArrayList<NoteVO> selectNoteListTitle(int page,int category, String title, String filter);
	
	int selectNoteListTitleCount(String title,int category);
	
	ArrayList<NoteVO> selectNoteUserList(int page,int category, String title, String filter, String userId);
	
	int selectNoteUserListCount(String title,int category, String userId);
	
	ArrayList<NoteVO> selectNoteListHashtag(int page,int category, String title, String tag, String filter);
	
	int selectNoteListHashtagCount(String title, int category, String tag);

	ArrayList<NoteVO> selectUserWriteQuestionNoteList(String userId);

	ArrayList<NoteVO> selectAllNoteList();

	NoteVO selectNoteHashtag(int noteId);

	NoteVO selectNote(int noteId);

	// 해시태그 조회
	ArrayList<String> selectHashtag();

	// 카테고리 유저 조회
	ArrayList<CategoryVO> selectUserCategory();

	// 카테고리 전체 조회
	ArrayList<CategoryVO> selectAllCategory();

	int selectNoteLike(HashMap<String, Object> map);
	
	void insertNoteLike(HashMap<String, Object> map);
	
	void deleteNoteLike(HashMap<String, Object> map);
	
	void updateNoteLikePlus(int noteId);
	
	void updateNoteLikeMinus(int noteId);
	
	void insertComment(CommentVO vo);
	
	void updateComment(CommentVO vo);
	
	void deleteComment(CommentVO vo);
	
	ArrayList<CommentVO> selectAllComment(int noteId);
	
	void updateNoteCommentPlus(int noteId);
	
	void updateNoteCommentMinus(int noteId);
	
	int selectNoteId(int commentId);

}
