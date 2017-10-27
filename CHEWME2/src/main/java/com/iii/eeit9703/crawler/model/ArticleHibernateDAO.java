package com.iii.eeit9703.crawler.model;

import org.hibernate.*;
import java.util.*;

import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class ArticleHibernateDAO implements ArticleDAO_interface {
	private static final String GET_ALL_STMT = "from ArticleVO order by articleID";

	@Override
	public void insert(ArticleVO articleVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(articleVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void update(ArticleVO articleVO) {

	}

	@Override
	public void delete(Integer articleID) {

	}

	@Override
	public ArticleVO findByPK(Integer articleID) {

		ArticleVO articleVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			articleVO = (ArticleVO) session.get(ArticleVO.class, articleID);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return articleVO;
	}

	@Override
	public List<ArticleVO> getAll() {
		List<ArticleVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}

		return list;
	}

	public static void main(String[] args) {

		ArticleHibernateDAO dao = new ArticleHibernateDAO();
		
		// 查全部
		List<ArticleVO> list = dao.getAll();
//		for (ArticleVO atc : list) {
//			System.out.print(atc.getArticleID() + ",");
//			System.out.print(atc.getMemId() + ",");
//			System.out.print(atc.getAttractionID() + ",");
//			System.out.print(atc.getContents() + ",");
//			System.out.println();
//		}
		
		// 查單筆
		ArticleVO attrPK = dao.findByPK(3);
		System.out.print(attrPK.getArticleID() + ",");
		System.out.print(attrPK.getMemId() + ",");
		System.out.print(attrPK.getAttractionID() + ",");
		System.out.print(attrPK.getContents() + ",");
		
		// 新增
//		ArticleVO articleVO = new ArticleVO();
//		articleVO.setmId(25);
//		articleVO.setName("Jack");
//		articleVO.setContents("好棒棒");
//		dao.insert(articleVO);
	}

}
