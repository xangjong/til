package com.spring_boot.MiniProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.MiniProject.dao.INoteDAO;
import com.spring_boot.MiniProject.model.CategoryVO;
import com.spring_boot.MiniProject.model.CommentVO;
import com.spring_boot.MiniProject.model.NoteVO;

@Service
public class NoteService implements INoteService {
	
	@Autowired
	@Qualifier("INoteDAO")
	INoteDAO dao;

	@Override
	public void InsertNote(NoteVO vo) {
		dao.InsertNote(vo);		
	}
	
	@Override
	public ArrayList<String> selectHashtag() {
		// TODO Auto-generated method stub
		return dao.selectHashtag();
	}

	@Override
	public ArrayList<CategoryVO> selectUserCategory() {
		// TODO Auto-generated method stub
		return dao.selectUserCategory();
	}

	@Override
	public ArrayList<CategoryVO> selectAllCategory() {
		// TODO Auto-generated method stub
		return dao.selectAllCategory();
	}

	@Override
	public ArrayList<NoteVO> selectQuestionNoteList(int page) {
		// TODO Auto-generated method stub
		return dao.selectQuestionNoteList(page);
	}

	@Override
	public ArrayList<NoteVO> selectAllNoteList() {
		// TODO Auto-generated method stub
		return dao.selectAllNoteList();
	}

	@Override
	public NoteVO selectNote(int noteId) {
		// TODO Auto-generated method stub
		return dao.selectNote(noteId);
	}

	@Override
	public NoteVO selectNoteHashtag(int noteId) {
		// TODO Auto-generated method stub
		return dao.selectNoteHashtag(noteId);
	}

	@Override
	public void updateNote(NoteVO vo) {
		dao.updateNote(vo);
		
	}

	@Override
	public void deleteNote(int noteId) {
		dao.deleteNote(noteId);
		
	}

	@Override
	public ArrayList<NoteVO> selectUserWriteQuestionNoteList(String userId) {
		// TODO Auto-generated method stub
		return dao.selectUserWriteQuestionNoteList(userId);
	}

	@Override
	public void updateNoteView(int noteId) {
		dao.updateNoteView(noteId);
		
	}

	@Override
	public int selectNoteLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectNoteLike(map);
	}

	@Override
	public void insertNoteLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.insertNoteLike(map);
	}

	@Override
	public void deleteNoteLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.deleteNoteLike(map);
	}
	
	@Override
	public void updateNoteLikePlus(int noteId) {
		// TODO Auto-generated method stub
		dao.updateNoteLikePlus(noteId);
	}
	
	@Override
	public void updateNoteLikeMinus(int noteId) {
		// TODO Auto-generated method stub
		dao.updateNoteLikeMinus(noteId);
	}

	@Override
	public void insertComment(CommentVO vo) {
		dao.insertComment(vo);
		
	}

	@Override
	public ArrayList<CommentVO> selectAllComment(int noteId) {
		// TODO Auto-generated method stub
		return dao.selectAllComment(noteId);
	}

	@Override
	public void updateComment(CommentVO vo) {
		dao.updateComment(vo);
		
	}

	@Override
	public void deleteComment(CommentVO vo) {
		// TODO Auto-generated method stub
		dao.deleteComment(vo);
	}

	@Override
	public ArrayList<NoteVO> selectNoteListTitle(int page, int category, String title, String filter) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("title", title);
		map.put("filter", filter);
		map.put("category", category);
		return dao.selectNoteListTitle(map);
	}

	@Override
	public ArrayList<NoteVO> selectNoteListHashtag(int page, int category, String title, String tag, String filter) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("title", title);
		map.put("tag", tag);
		map.put("filter", filter);
		map.put("category", category);
		return dao.selectNoteListHashtag(map);
	}

	@Override
	public int selectNoteListTitleCount(String title,int category) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("category", category);
		return dao.selectNoteListTitleCount(map);
	}

	@Override
	public int selectNoteListHashtagCount(String title,int category, String tag) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("tag", tag);
		map.put("category", category);
		return dao.selectNoteListHashtagCount(map);
	}

	@Override
	public void updateNoteCommentPlus(int noteId) {
		// TODO Auto-generated method stub
		dao.updateNoteCommentPlus(noteId);
	}

	@Override
	public void updateNoteCommentMinus(int noteId) {
		// TODO Auto-generated method stub
		dao.updateNoteCommentMinus(noteId);
	}

	@Override
	public int selectNoteId(int commentId) {
		// TODO Auto-generated method stub
		return dao.selectNoteId(commentId);
	}

	@Override
	public ArrayList<NoteVO> selectNoteUserList(int page, int category, String title, String filter, String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("title", title);
		map.put("filter", filter);
		map.put("userId", userId);
		map.put("category", category);
		return dao.selectNoteUserList(map);
	}

	@Override
	public int selectNoteUserListCount(String title, int category, String userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("userId", userId);
		map.put("category", category);
		return dao.selectNoteUserListCount(map);
	}

	
	
	
	
	
	

}
