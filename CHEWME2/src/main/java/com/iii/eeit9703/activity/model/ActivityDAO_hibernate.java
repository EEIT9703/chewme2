package com.iii.eeit9703.activity.model;

import java.io.InputStream;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemDAO_hibernate;
import com.iii.eeit9703.member.model.MemVO;

import net.minidev.json.JSONValue;

public class ActivityDAO_hibernate implements ActivityDAO_interface {

	private static final String GET_ALL_STMT = "from ActivityVO order by actID";
	
	

	@Override
	public void finalAct(ActivityVO activityVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ActivityVO activityVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(activityVO	);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer actID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ActivityVO activityVO = new ActivityVO();
			activityVO.setActID(actID);
			session.delete(activityVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public ActivityVO findByPrimaryKey(Integer actID) {
		ActivityVO activityVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			activityVO = (ActivityVO) session.get(ActivityVO.class, actID);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return activityVO;
	}

	@Override
	public List<ActivityVO> getAll() {
		List<ActivityVO> list = null;
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
		 ActivityDAO_hibernate dao =new ActivityDAO_hibernate();
		 List<ActivityVO> list=dao.getAll();
		// String jsonString =JSONValue.toJSONString(list);
		 System.out.println(list.size());
	}

}
