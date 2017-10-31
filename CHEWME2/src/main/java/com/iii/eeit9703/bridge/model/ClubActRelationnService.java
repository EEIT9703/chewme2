package com.iii.eeit9703.bridge.model;

import java.util.List;

import com.iii.eeit9703.bridge.model.hibernate.clubActRelation.ClubActRelationHibernateDAO;

public class ClubActRelationnService {
	ClubActRelationDAOI calDAO; 
	public ClubActRelationnService(){
		calDAO=new  ClubActRelationHibernateDAO();
	}
	
	
}
