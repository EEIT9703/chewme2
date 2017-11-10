package com.iii.eeit9703.bridge.model;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.iii.eeit9703.bridge.model.hibernate.clubMemRelation.ClubMemRelatoinHibernateDAO;

public class ClubMemRelationService {
	ClubMemRelationDAOI cmlDAO; 
	public ClubMemRelationService(){
		cmlDAO=new  ClubMemRelatoinHibernateDAO();
	}
	public List<ClubMemRelationVO> getAll(){
		return cmlDAO.getAll();
	}
	public ClubMemRelationVO getOneRelation(Integer clubId, Integer memId){
		return cmlDAO.getOne(clubId, memId);
	}
	public List<Integer> getRelationByMemId(Integer memId){
		List<Integer> clubIdList;
		Iterator<ClubMemRelationVO> iter = cmlDAO.getListClubByMemId(memId).iterator();
		for(clubIdList = new LinkedList();iter.hasNext();){
			clubIdList.add(iter.next().getClubId());
		}
		return clubIdList;
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
