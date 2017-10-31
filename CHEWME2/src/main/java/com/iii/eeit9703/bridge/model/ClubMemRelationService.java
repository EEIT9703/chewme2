package com.iii.eeit9703.bridge.model;

import java.util.List;

import com.iii.eeit9703.bridge.model.hibernate.clubMemRelation.ClubMemRelatoimHibernateDAO;
import com.iii.eeit9703.club.model.ClubDAOI;
import com.iii.eeit9703.club.model.ClubVO;

public class ClubMemRelationService {
	ClubMemRelationDAOI cmlDAO; 
	public ClubMemRelationService(){
		cmlDAO=new  ClubMemRelatoimHibernateDAO();
	}
	public List<ClubMemRelationVO> getAll(){
		return cmlDAO.getAll();
	}
	public ClubMemRelationVO getOneRelation(Integer clubId, Integer memId){
		return cmlDAO.getOne(clubId, memId);
	}
	public void insertClubMemRelation(ClubMemRelationVO cmlVO){
		cmlDAO.insert(cmlVO);
	}
	public void updateClubMemRelation(ClubMemRelationVO cmlVO){
		cmlDAO.update(cmlVO);
	}
	public void deleteClubMemRelation(ClubMemRelationVO cmlVO){
		cmlDAO.delete(cmlVO);
	}
	
}
