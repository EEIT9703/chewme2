package com.iii.eeit9703.club.model.hibernate.comment;

import java.util.List;

import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.CommentVO;

public interface CommentHibernateDAOI {
	public List<CommentVO> getAll();
	public void getOne(Integer commentId);
	public void insert(ClubVO CommentVO);
	public void update(ClubVO CommentVO);
	public void delete(Integer CommentVO);
	
}
