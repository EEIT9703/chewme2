package com.iii.eeit9703.club.model;

import java.util.List;

public interface ReplyDAOI {
	public List<ReplyVO> getAll();
	public void getOne(Integer reqlyId);
	public void insert(ReplyVO replyVO);
	public void update(ReplyVO replyVO);
	public void delete(Integer reqlyId);
	
}
