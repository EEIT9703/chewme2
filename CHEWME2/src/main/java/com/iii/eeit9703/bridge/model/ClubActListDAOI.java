package com.iii.eeit9703.bridge.model;

import java.util.List;

import com.iii.eeit9703.club.model.ClubVO;

public interface ClubActListDAOI {
	public List<ClubActListVO> getAll();
	public void getOne(Integer clubId);
	public void insert(ClubVO clubVO);
	public void update(ClubVO clubVO);
	public void delete(Integer clubId);

}
