package com.iii.eeit9703.club.model;

import java.util.List;

import com.iii.eeit9703.club.model.hibernate.issue.IssueHibernateDAO;

public class IssueService {
	IssueDAOI isdi;
	public IssueService(){
		isdi = new IssueHibernateDAO();	
	}
	
	public List<IssueVO> getIssueList(){
		return isdi.getAll();		
	}
	public void getOne(Integer issueId){
		isdi.getOne(issueId);
	}
	public void insertIssue(IssueVO IssueVO){
		isdi.insert(IssueVO);
	}
	public void updateIssue(IssueVO IssueVO){
		isdi.update(IssueVO);
	}
	public void delete(Integer issueId){
		isdi.delete(issueId);
	}
}
