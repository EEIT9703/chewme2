package com.iii.eeit9703.club.model;

import java.util.List;

public interface QuestionDAOI {
	public List<QuestionVO> getAll();
	public void getOne(Integer questionId);
	public void insert(QuestionVO QuestionVO);
	public void update(QuestionVO QuestionVO);
	public void delete(Integer questionIds);
	
}
