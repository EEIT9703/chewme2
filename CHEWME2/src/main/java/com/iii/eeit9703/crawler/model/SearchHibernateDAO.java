package com.iii.eeit9703.crawler.model;

import com.iii.eeit9703.hibernate.util.HibernateUtil;
import org.hibernate.*;

public class SearchHibernateDAO {

	private static final String GET_ALL_STMT = "from AttrVO order by attractionID";

	public AttrVO findByPK(String name) {
		AttrVO attrVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			attrVO = (AttrVO) session.get(AttrVO.class, name);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return attrVO;
	}

//	public static void main(String[] args) {
//
//		SearchHibernateDAO dao = new SearchHibernateDAO();
//		AttrVO attr = dao.findByPK("台北101");
//		System.out.print(attr.getAttractionID() + ",");
//		System.out.print(attr.getName() + ",");
//		System.out.print(attr.getCounty() + ",");
//		System.out.print(attr.getType() + ",");
//		System.out.print(attr.getAddress() + ",");
//		System.out.print(attr.getTel() + ",");
//		System.out.print(attr.getIntro() + ",");
//	}
}
