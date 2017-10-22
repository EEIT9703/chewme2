package com.iii.eeit9703.club.model.HibernateDAO;

import java.util.List;

import com.iii.eeit9703.club.model.ClubVO;

public interface ClubHibernateDAOI {
	public List<ClubVO> getAll();
	public void getOne(Integer clubId);
	public void insert(ClubVO clubVO);
	public void update(ClubVO clubVO);
	public void delete(Integer clubId);
	
}
