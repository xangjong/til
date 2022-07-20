package com.spring_boot.MiniProject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.MiniProject.dao.INoteDAO;
import com.spring_boot.MiniProject.model.CategoryVO;
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

}
