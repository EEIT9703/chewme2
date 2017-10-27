package com.iii.eeit9703.club.model;

import java.util.List;

public interface IssueDAOI {
	public List<IssueVO> getAll();
	public IssueVO getOne(Integer issueId);
	public void insert(IssueVO IssueVO);
	public void update(IssueVO IssueVO);
	public void delete(Integer issueId);
	
}
