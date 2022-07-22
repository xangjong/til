package com.spring_boot.MiniProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot.MiniProject.model.CategoryVO;
import com.spring_boot.MiniProject.model.CommentVO;
import com.spring_boot.MiniProject.model.NoteVO;

public interface INoteDAO {

	// 해시태그 조회
	ArrayList<String> selectHashtag();

	void updateNote(NoteVO vo);
	
	void InsertNote(NoteVO vo);

	void deleteNote(int noteId);

	void updateNoteView(int noteId);

	ArrayList<NoteVO> selectQuestionNoteList(int page);
	
	ArrayList<NoteVO> selectNoteListTitle(HashMap<String, Object> map);
	
	int selectNoteListTitleCount(HashMap<String, Object> map);
	
	ArrayList<NoteVO> selectNoteListHashtag(HashMap<String, Object> map);
	
	int selectNoteListHashtagCount(HashMap<String, Object> map);

	ArrayList<NoteVO> selectUserWriteQuestionNoteList(String userId);
	
	ArrayList<NoteVO> selectNoteUserList(HashMap<String, Object> map);
	
	int selectNoteUserListCount(HashMap<String, Object> map);

	ArrayList<NoteVO> selectAllNoteList();

	NoteVO selectNote(int noteId);

	NoteVO selectNoteHashtag(int noteId);

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
	
	ArrayList<CommentVO> selectAllComment(int noteId);
	
	void updateComment(CommentVO vo);
	
	void deleteComment(CommentVO vo);
	
	void updateNoteCommentPlus(int noteId);
	
	void updateNoteCommentMinus(int noteId);
	
	int selectNoteId(int commentId);

}
