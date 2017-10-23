package com.iii.eeit9703.club.model.hibernate.question;

import java.util.List;

import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.QuestionVO;

public interface QuestionHibernateDAOI {
	public List<QuestionVO> getAll();
	public void getOne(Integer questionId);
	public void insert(ClubVO QuestionVO);
	public void update(ClubVO QuestionVO);
	public void delete(Integer questionIds);
	
}
