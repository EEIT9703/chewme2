package com.iii.eeit9703.member.model;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.iii.eeit9703.collection.CollectionVO;
import com.iii.eeit9703.report.ReportVO;

public interface MemDAO_interface {
	public void insert(MemVO memVO);
	public void update(MemVO memVO);
    public void delete(Integer memId);
    public MemVO findByPrimaryKey(Integer memId);
    public List<MemVO> getAll();
    public Set<CollectionVO> getCollByMemNo(Integer memId);
    public Set<ReportVO> getRepByMemNo(Integer memId);
	public void insertGoogle(MemVO memVO);
}
