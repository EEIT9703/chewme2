package com.iii.eeit9703.crawler.model;

import java.util.ArrayList;
import java.util.List;

public interface ArticleDAO_interface {
	public void insert(ArticleVO articleVO);
	public void update(ArticleVO articleVO);
	public void delete(Integer articleID);
	public ArrayList<ArticleVO> findByPK(Integer attractionID);
	public List<ArticleVO> getAll();
}
