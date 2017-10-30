package com.iii.eeit9703.club.model;

import java.util.List;

public interface CommentDAOI {
	public List<CommentVO> getAll();
	public CommentVO getOne(Integer commentId);
	public void insert(CommentVO commentVO);
	public void update(CommentVO commentVO);
	public void delete(Integer commentId);
	
}
