package com.iii.eeit9703.crawler.model;

import java.util.List;

public class AttrService {
	
	private AttrDAO_interface dao;
	
	public AttrService(){
		dao = new AttrDAO();
	}

	public AttrVO addAttr(String name, String county, String type, String address, String tel, 
			String intro){
				
		AttrVO attrVO = new AttrVO();
		
		attrVO.setName(name);
		attrVO.setCounty(county);
		attrVO.setType(type);
		attrVO.setAddress(address);
		attrVO.setTel(tel);
		attrVO.setIntro(intro);
		
		
		dao.insert(attrVO);
		return attrVO;		
	}
	public void deleteAttr(Integer attractionID){
		dao.delete(attractionID);;
		
	}
	public List<AttrVO> getAll(){
		return dao.getAll();
	}	
	public AttrVO getOneAttr(Integer attractionID){
		return dao.findByPK(attractionID);
	}
}