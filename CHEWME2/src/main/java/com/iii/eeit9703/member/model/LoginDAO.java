package com.iii.eeit9703.member.model;

import java.sql.SQLException;
import java.util.List;

public interface LoginDAO {
	public void populateMemberList() throws SQLException ;
	public MemVO checkIDPassword(String userId,String password);
	public List<MemVO> getMemberList();
	public void addMem(MemVO mv);
}
