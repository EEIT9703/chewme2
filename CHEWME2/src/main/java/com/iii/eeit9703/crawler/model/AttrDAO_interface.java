package com.iii.eeit9703.crawler.model;
import java.io.InputStream;
import java.util.*;

public interface AttrDAO_interface {
	public void insert(AttrVO attrVO, InputStream is);
	public void update(AttrVO attrvo, InputStream fis);
	public void delete(Integer attractionID);
	public AttrVO findByPK(Integer attractionID);
	public ArrayList<AttrVO> getAll();
}
