package com.iii.eeit9703.club.model.hibernate.comment;

import java.util.List;

import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.CommentVO;

public interface CommentHibernateDAOI {
	public List<CommentVO> getAll();
	public void getOne(Integer commentId);
	public void insert(CommentVO commentVO);
	public void update(CommentVO commentVO);
	public void delete(Integer commentId);
	
}
