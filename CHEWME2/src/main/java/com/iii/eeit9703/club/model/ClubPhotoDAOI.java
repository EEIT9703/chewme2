package com.iii.eeit9703.club.model;

import java.io.InputStream;
import java.util.List;
import java.util.Set;


public interface ClubPhotoDAOI {
	 public void insert(ClubPhotoVO photoVO);
     public void update(ClubPhotoVO photoVO,InputStream is);
     public void delete(Integer photoId);
     public ClubPhotoVO findByPrimaryKey(Integer photoId);
     public List<ClubPhotoVO> getClubPhotoByClubId(Integer clubId);
     
     //查詢某部門的員工(一對多)(回傳 Set)
}
