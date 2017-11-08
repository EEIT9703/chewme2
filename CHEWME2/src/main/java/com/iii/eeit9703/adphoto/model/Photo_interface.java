package com.iii.eeit9703.adphoto.model;

import java.util.List;
import java.util.Set;


public interface Photo_interface {
	 public void insert(PhotoVO photoVO);
     public void update(PhotoVO photoVO);
     public void delete(Integer photo_no);
     public PhotoVO findByPrimaryKey(Integer photo_no);
     public List<PhotoVO> getAllByState();
     public List<PhotoVO> getAll();
     //查詢某部門的員工(一對多)(回傳 Set)
     public Set<PhotoVO> getMemberByDeptno(Integer photo_no);
}
