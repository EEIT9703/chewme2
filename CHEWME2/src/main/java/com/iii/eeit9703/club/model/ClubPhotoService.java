package com.iii.eeit9703.club.model;

import java.util.List;

import com.iii.eeit9703.club.model.jdbc.clubphoto.ClubPhotoJDBCDAO;

public class ClubPhotoService {
	ClubPhotoDAOI clubphotoDAO; 
	public ClubPhotoService(){
		clubphotoDAO =new  ClubPhotoJDBCDAO();
	}
	
	public List<ClubPhotoVO> getPhotoByClubId(Integer clubId){	
		return clubphotoDAO.getClubPhotoByClubId(clubId);
	}	
	public void insertPhoto(ClubPhotoVO photoVO){
		clubphotoDAO.insert(photoVO);
	}
	public void updatePhoto(ClubPhotoVO photoVO){
		clubphotoDAO.updateByClubId(photoVO);
	}
}
