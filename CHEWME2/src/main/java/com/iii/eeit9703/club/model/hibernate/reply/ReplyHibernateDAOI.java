package com.iii.eeit9703.club.model.hibernate.reply;

import java.util.List;

import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.ReplyVO;

public interface ReplyHibernateDAOI {
	public List<ReplyVO> getAll();
	public void getOne(Integer reqlyId);
	public void insert(ClubVO ReplyVO);
	public void update(ClubVO ReplyVO);
	public void delete(Integer reqlyId);
	
}
