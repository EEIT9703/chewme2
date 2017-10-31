package com.iii.eeit9703.bridge.model;

import java.util.List;

public interface MemJoinActDAOI {
	public List<MemJoinActVO> getAll();
	public void getOne(Integer pk);
	public List<MemJoinActVO> geActByMemId(Integer memId);
	public void insert(MemJoinActVO mjaVO);
	public void update(MemJoinActVO mjaVO);
	public void delete(Integer pk);
}
