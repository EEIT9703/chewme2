package com.iii.eeit9703.member.model;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.iii.eeit9703.collection.CollectionVO;
import com.iii.eeit9703.order.OrderVO;
import com.iii.eeit9703.report.ReportVO;

public interface MemDAO_interface {
	public void insert(MemVO memVO);
	public void update(MemVO memVO);
    public void delete(Integer memId);
    public MemVO findByPrimaryKey(Integer memId);
    MemVO findByGID(String googleId);
    MemVO findByMemberId(String MemberId);
    public List<MemVO> getAll();
//	public void insertGoogle(MemVO memVO);

    //public Set<CollectionVO> getCollByMemNo(Integer memId);
    //public Set<ReportVO> getRepByMemNo(Integer memId);
    public Set<OrderVO> findOrdersByMemId(Integer memId);
}
