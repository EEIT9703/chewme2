package com.iii.eeit9703.club.model;

import java.util.List;

import com.iii.eeit9703.club.model.hibernate.clubphoto.ClubPhotoHibernateDAO;

public class ClubPhotoService {
	ClubPhotoDAOI clubphotoDAO; 
	public ClubPhotoService(){
		clubphotoDAO =new  ClubPhotoHibernateDAO();
	}
	
	public List<ClubPhotoVO> getAllPhoto(){
		
		return clubphotoDAO.getAll();
	}
}
