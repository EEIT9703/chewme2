package com.iii.eeit9703.bridge.model;

import java.util.List;

public interface MemActRelationDAOI {
	public List<MemActRelationVO> getAll();
	public void getOne(Integer pk);
	public List<MemActRelationVO> geActByMemId(Integer memId);
	public void insert(MemActRelationVO mjaVO);
	public void update(MemActRelationVO mjaVO);
	public void delete(Integer pk);
}
