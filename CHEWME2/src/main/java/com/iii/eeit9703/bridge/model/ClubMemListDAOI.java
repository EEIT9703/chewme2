package com.iii.eeit9703.bridge.model;

import java.util.List;

import com.iii.eeit9703.member.model.MemVO;

public interface ClubMemListDAOI {
	public List<ClubMemListVO> getAll();
	public ClubMemListVO getOne(Integer memId);
	public List<ClubMemListVO> getListClubByMemId(Integer memId);
	public void insert(MemVO memVO);
	public void update(MemVO memVO);
	public void delete(Integer memId);

}
