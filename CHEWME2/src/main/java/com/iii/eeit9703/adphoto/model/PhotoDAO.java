package com.iii.eeit9703.adphoto.model;

import java.util.List;
import java.util.Set;


import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class PhotoDAO implements Photo_interface {

	@Override
	public void insert(PhotoVO photoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(photoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(PhotoVO photoVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer photo_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public PhotoVO findByPrimaryKey(Integer photo_no) {
		PhotoVO photoVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			photoVO = (PhotoVO) session.get(PhotoVO.class, photo_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return photoVO;
	}

	@Override
	public List<PhotoVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<PhotoVO> getMemberByDeptno(Integer photo_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
