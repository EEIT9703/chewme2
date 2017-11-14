package com.iii.eeit9703.crawler.model;

import com.iii.eeit9703.hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.*;

public class SearchHibernateDAO2 {

	
	public AttrVO2 findByPKInt(Integer attractionID) {
		AttrVO2 attrVO2 = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			attrVO2 = (AttrVO2) session.get(AttrVO2.class, attractionID);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return attrVO2;
	}
	

	
	

	public static void main(String[] args) {
//
		SearchHibernateDAO2 dao = new SearchHibernateDAO2();
//		AttrVO attrs =dao.findByPK("101");
//		System.out.println(attrs.getName());
		int a=8;
		AttrVO2 attr = dao.findByPKInt(a);
		System.out.println(attr.getName());		
		
	}
}
