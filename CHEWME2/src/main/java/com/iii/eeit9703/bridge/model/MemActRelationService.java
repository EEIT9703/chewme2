package com.iii.eeit9703.bridge.model;

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
	public List<MemActRelationVO> getRelationByMemId(){
		return null;
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
