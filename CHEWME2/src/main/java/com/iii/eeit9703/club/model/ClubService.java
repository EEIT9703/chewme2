package com.iii.eeit9703.club.model;

import java.util.List;

import com.iii.eeit9703.club.model.hibernate.club.ClubHibernateDAO;

public class ClubService {
	ClubDAOI clubDAO; 
	public ClubService(){
		clubDAO =new  ClubHibernateDAO();
	}
		
	public List<ClubVO> getAll(){
		return clubDAO.getAll();
	}
	public void getOne(Integer clubId){
		clubDAO.getOne(clubId);
	}
	public void insert(ClubVO clubVO){
		clubDAO.insert(clubVO);
	}
	public void update(ClubVO clubVO){
		clubDAO.update(clubVO);
	}
	public void delete(Integer clubId){
		clubDAO.delete(clubId);
	}
}
