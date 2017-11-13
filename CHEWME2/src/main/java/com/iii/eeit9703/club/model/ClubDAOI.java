package com.iii.eeit9703.club.model;

import java.util.List;

import com.iii.eeit9703.member.model.MemVO;

public interface ClubDAOI {
	public List<ClubVO> getAll();
	public List<ClubVO> getClubListByManagerId(Integer managerId);
	public List<MemVO> getClubMembers(Integer clubId);
	public ClubVO getOne(Integer clubId);
	public Integer insert(ClubVO clubVO);
	public void update(ClubVO clubVO);
	public void delete(Integer clubId);
	
}
