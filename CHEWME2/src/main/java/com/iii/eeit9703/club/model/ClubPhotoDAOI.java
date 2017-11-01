package com.iii.eeit9703.club.model;

import java.util.List;
import java.util.Set;


public interface ClubPhotoDAOI {
	 public void insert(ClubPhotoVO photoVO);
     public void update(ClubPhotoVO photoVO);
     public void delete(Integer photo_no);
     public ClubPhotoVO findByPrimaryKey(Integer photo_no);
     public List<ClubPhotoVO> getAll();
     //查詢某部門的員工(一對多)(回傳 Set)
     public Set<ClubPhotoVO> getMemberByDeptno(Integer photo_no);
}
