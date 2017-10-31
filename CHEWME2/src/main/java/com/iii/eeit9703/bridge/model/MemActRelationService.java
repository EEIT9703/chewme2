package com.iii.eeit9703.bridge.model;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.iii.eeit9703.bridge.model.hibernate.memActRelation.MemActRelationHibernateDAO;

public class MemActRelationService {
	MemActRelationDAOI mjaDAO; 
	public MemActRelationService(){
		mjaDAO = new  MemActRelationHibernateDAO();
	}
	public List<MemActRelationVO> getAllRelation(){
		return null;
	}
	public MemActRelationVO getOneRelation(){
		return null;
	}
	public List<Integer> getRelationByMemId(Integer memId){
		List<Integer> actIdList;
		Iterator<MemActRelationVO> iter = mjaDAO.geActByMemId(memId).iterator();
		for(actIdList = new LinkedList();iter.hasNext();){
			actIdList.add(iter.next().getActId());
		}		
		return actIdList;
	}
	public List<MemActRelationVO> insertRelation(){
		return null;
	}
	public List<MemActRelationVO> updateRelation(){
		return null;
	}
	public List<MemActRelationVO> deleteRelation(){
		return null;
	}
}
