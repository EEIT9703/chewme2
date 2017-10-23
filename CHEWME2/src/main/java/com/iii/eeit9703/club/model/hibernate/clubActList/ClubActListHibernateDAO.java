package com.iii.eeit9703.club.model.hibernate.clubActList;

import java.util.List;

import com.iii.eeit9703.club.model.ClubActListVO;
import com.iii.eeit9703.club.model.ClubVO;

public interface ClubActListHibernateDAO {
	public List<ClubActListVO> getAll();
	public void getOne(Integer clubId);
	public void insert(ClubVO clubVO);
	public void update(ClubVO clubVO);
	public void delete(Integer clubId);

}
