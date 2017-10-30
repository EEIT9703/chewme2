package com.iii.eeit9703.club.model;

import java.util.List;

import com.iii.eeit9703.club.model.hibernate.comment.CommentHibernateDAO;
import com.iii.eeit9703.club.model.hibernate.issue.IssueHibernateDAO;

public class CommentService {
	CommentDAOI cmdi;
	public CommentService(){
		cmdi = new CommentHibernateDAO();	
	}
	
	public List<CommentVO> getIssueList(){
		return cmdi.getAll();		
	}
	public void getOne(Integer commentId){
		cmdi.getOne(commentId);
	}
	public void insertComment(CommentVO commentVO){
		cmdi.insert(commentVO);
	}
	public void updateComment(CommentVO commentVO){
		cmdi.update(commentVO);
	}
	public void delete(Integer commentId){
		cmdi.delete(commentId);
	}
}
