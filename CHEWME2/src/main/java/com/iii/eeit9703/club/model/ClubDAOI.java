package com.iii.eeit9703.club.model;

import java.util.List;

public interface ClubDAOI {
	public List<ClubVO> getAll();
	public List<ClubVO> getClubListByManagerId(Integer managerId);
	
	public ClubVO getOne(Integer clubId);
	public void insert(ClubVO clubVO);
	public void update(ClubVO clubVO);
	public void delete(Integer clubId);
	
}
