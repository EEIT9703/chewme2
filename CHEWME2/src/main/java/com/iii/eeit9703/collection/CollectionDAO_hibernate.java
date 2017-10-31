package com.iii.eeit9703.collection;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.report.ReportVO;

public class CollectionDAO_hibernate implements Collection_interface {
	private static final String GET_ALL_STMT = "from CollectionVO ";
	@Override
	public void insert(CollectionVO collectionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(collectionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(CollectionVO collectionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(collectionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(CollectionVO collectionVO) {
		// TODO Auto-generated method stub

	}

//	@Override
//	public CollectionVO findByPrimaryKey(CollectionVO collectionVO) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<CollectionVO> getAll() {
		List<CollectionVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	

//	@Override
//	public Set<CollectionVO> findByMemId(MemVO memVO) {
//		Set<CollectionVO> collectionVO = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();		
//			collectionVO = (Set<CollectionVO>) session.get(CollectionVO.class, memVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//		return collectionVO;
//	}

	public static void main(String[] args){
	
		
	
//	@Override
//	public Set<CollectionVO> getMemberByDeptno(CollectionVO collectionVO) {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public Set<CollectionVO> getMemberByDeptno(CollectionVO collectionVO) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	}
}
