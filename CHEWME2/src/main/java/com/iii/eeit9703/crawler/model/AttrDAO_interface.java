package com.iii.eeit9703.crawler.model;
import java.util.*;

public interface AttrDAO_interface {
	public void insert(AttrVO attrvo);
	public void update(AttrVO attrvo);
	public void delete(Integer attractionID);
	public AttrVO findByPK(Integer attractionID);
	public List<AttrVO> getAll();
}
