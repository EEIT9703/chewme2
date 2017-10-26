package com.iii.eeit9703.collection;

import java.util.List;
import java.util.Set;

public interface Collection_interface {

		 public void insert(CollectionVO collectionVO);
	     public void update(CollectionVO collectionVO);
	     public void delete(CollectionVO collectionVO);
//	     public CollectionVO findByPrimaryKey(CollectionVO collectionVO);
	     public List<CollectionVO> getAll();
	  //   查詢某部門的員工(一對多)(回傳 Set)
//	     public Set<CollectionVO> findByMemId(Integer memId);
//	     public Set<CollectionVO> findByActId(Integer actID);
	
}
