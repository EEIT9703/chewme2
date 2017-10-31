package com.iii.eeit9703.bridge.model;

import java.util.List;

import com.iii.eeit9703.member.model.MemVO;

public interface ClubMemRelationDAOI {
	public List<ClubMemRelationVO> getAll();
	public ClubMemRelationVO getOne(Integer clubId,Integer memId);
	public List<ClubMemRelationVO> getListClubByMemId(Integer memId);
	public void insert(ClubMemRelationVO cmlVO);
	public void update(ClubMemRelationVO cmlVO);
	public void delete(ClubMemRelationVO cmlVO);
	
}
