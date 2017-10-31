package com.iii.eeit9703.bridge.model;

import java.util.List;

public interface ClubActRelationDAOI {
	public List<ClubActRelationVO> getAll();
	public ClubActRelationVO getOne(ClubActRelationVO cmlVO);
	public void insert(ClubActRelationVO cmlVO);
	public void update(ClubActRelationVO cmlVO);
	public void delete(ClubActRelationVO cmlVO);

}
