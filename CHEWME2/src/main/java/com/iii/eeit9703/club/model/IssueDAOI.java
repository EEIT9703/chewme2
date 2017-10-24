package com.iii.eeit9703.club.model.hibernate.issue;

import java.util.List;

import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.IssueVO;

public interface IssueHibernateDAOI {
	public List<IssueVO> getAll();
	public void getOne(Integer issueId);
	public void insert(IssueVO IssueVO);
	public void update(IssueVO IssueVO);
	public void delete(Integer issueId);
	
}
