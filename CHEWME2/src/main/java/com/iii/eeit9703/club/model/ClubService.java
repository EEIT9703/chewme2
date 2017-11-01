package com.iii.eeit9703.club.model;

import java.util.Iterator;
import java.util.LinkedList;
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
	public ClubVO getOneClub(Integer clubId){
		return clubDAO.getOne(clubId);
	}
	public List<Integer> getClubIdListByManagerId(Integer memId){
		List<Integer> clubListByManager;
		Iterator<ClubVO> iter = clubDAO.getClubListByManagerId(memId).iterator();
		for(clubListByManager = new LinkedList();iter.hasNext();){
			clubListByManager.add(iter.next().getClubId());
		}	
		return clubListByManager;
	}
	
	public void insertClub(ClubVO clubVO){
		clubDAO.insert(clubVO);
	}
	public void update(ClubVO clubVO){
		clubDAO.update(clubVO);
	}
	public void delete(Integer clubId){
		clubDAO.delete(clubId);
	}
}
