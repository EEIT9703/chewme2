package com.iii.eeit9703.member.model;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class MemDAO_hibernate implements MemDAO_interface {
	private static final String GET_ALL_STMT = "from MemVO order by memberId";
	@Override
	public void insert(MemVO memVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(MemVO memVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer memId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			MemVO memVO = new MemVO();
			memVO.setMemId(memId);
			session.delete(memVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public MemVO findByPrimaryKey(Integer memId) {
		MemVO memVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memVO = (MemVO) session.get(MemVO.class, memId);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memVO;
	}

	@Override
	public List<MemVO> getAll() {
		List<MemVO> list = null;
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
	
	
	public static void main(String[] args) {
	MemDAO_hibernate dao =new MemDAO_hibernate();
		
	List<MemVO> list2 = dao.getAll();
	for (MemVO memVO : list2) {
		System.out.print(memVO.getMemberId() + ",");
		System.out.print(memVO.getMemMail() + ",");
		System.out.print(memVO.getMemPhone());
		System.out.println("\n-----------------");
		Set<ActivityVO> Activitys =memVO.getActivitys();
		
		for (ActivityVO activityVO : Activitys) {
			System.out.print(activityVO.getAct_name() + ",");
			System.out.print(activityVO.getAct_groups() + ",");
			System.out.print(activityVO.getAct_current());
		
		
			System.out.println();
		}
		System.out.println();
	}	
	
	
	}
	
	

}
