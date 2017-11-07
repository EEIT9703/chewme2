package com.iii.eeit9703.crawler.model;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class AttrService {

	private AttrDAO_interface dao;

	public AttrService() {
		dao = new AttrDAO();
	}

	public AttrVO addAttr(String name, String county, String type, String address, String tel, String intro,
			InputStream image) {

		AttrVO attrVO = new AttrVO();

		attrVO.setName(name);
		attrVO.setCounty(county);
		attrVO.setType(type);
		attrVO.setAddress(address);
		attrVO.setTel(tel);
		attrVO.setIntro(intro);
		attrVO.setImage(image);

		dao.insert(attrVO, image);
		return attrVO;
	}

	public void deleteAttr(Integer attractionID) {
		dao.delete(attractionID);
	}

	public ArrayList<AttrVO> getAll() {
		return dao.getAll();
	}

	public AttrVO getOneAttr(Integer attractionID) {
		return dao.findByPK(attractionID);
	}

	public AttrVO updateattr(Integer attractionID, String name, String county, String type, String address, String tel, String intro,
			InputStream image) {
		AttrVO attrVO = new AttrVO();
		
		attrVO.setAttractionID(attractionID);
		attrVO.setName(name);
		attrVO.setCounty(county);
		attrVO.setType(type);
		attrVO.setAddress(address);
		attrVO.setTel(tel);
		attrVO.setIntro(intro);
		attrVO.setImage(image);
		dao.update(attrVO, image);
		
		return dao.findByPK(attractionID);
		
	}
}