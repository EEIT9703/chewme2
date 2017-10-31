package com.iii.eeit9703.collection;

import java.util.List;
import java.util.Set;


import com.iii.eeit9703.member.model.MemVO;

public interface Collection_interface {

		 public void insert(CollectionVO collectionVO);	  
		 public void update (CollectionVO collectionVO);
	     public void delete(CollectionVO collectionVO);
//	     public CollectionVO findByPrimaryKey(CollectionVO collectionVO);
	     public List<CollectionVO> getAll();
	  //   查詢某部門的員工(一對多)(回傳 Set)	
      //   public Set<CollectionVO> findByActId(Integer actID);	     
	  //   public List<CollectionVO> findByMemVO(MemVO memVO);
	     public List<CollectionVO> getColIdListByMemId(Integer MemId);
	     
}
