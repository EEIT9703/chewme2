package com.iii.eeit9703.collection;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class CollectionService {
	Collection_interface CollectionDAO;
	public CollectionService(){		
		CollectionDAO=new CollectionDAO_hibernate();
	}	
	public void insert(CollectionVO collectionVO){
		CollectionDAO.insert(collectionVO);
	}	
	public void delete(CollectionVO collectionVO){
		CollectionDAO.delete(collectionVO);
	}	
	public List<CollectionVO> getAll(){
		return CollectionDAO.getAll(); 		
	}	
	public List<Integer> getColIdListByMemId(Integer memId){
		List<Integer> ownColList;
		Iterator<CollectionVO> iter=CollectionDAO.getColIdListByMemId(memId).iterator();	
		for(ownColList = new LinkedList();iter.hasNext();){
			ownColList.add(iter.next().getMemVO().getMemId());
		}
		 return ownColList;
	}
}
