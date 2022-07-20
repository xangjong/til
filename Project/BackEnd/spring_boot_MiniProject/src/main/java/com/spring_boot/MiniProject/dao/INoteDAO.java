package com.spring_boot.MiniProject.dao;

import java.util.ArrayList;

import com.spring_boot.MiniProject.model.CategoryVO;
import com.spring_boot.MiniProject.model.NoteVO;

public interface INoteDAO {
	
	// 해시태그 조회
		ArrayList<String> selectHashtag();
			
	// 카테고리 유저 조회
	ArrayList<CategoryVO> selectUserCategory();
	
	// 카테고리 전체 조회
	ArrayList<CategoryVO> selectAllCategory();
	
	public void InsertNote(NoteVO vo);

}
