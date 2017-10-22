package com.iii.eeit9703.club.model.HibernateDAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class ClubHibernateDAO implements ClubHibernateDAOI{
	
	private static final String GET_ALL_STMT="from club order by clubId";
	@Override
	public List<ClubVO> getAll() {
		List<ClubVO> list=null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		return list;
	}

	@Override
	public void getOne(Integer clubId) {
		
	}

	@Override
	public void insert(ClubVO clubVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(clubVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void update(ClubVO clubVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(clubVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void delete(Integer clubId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			ClubVO clubVO = (ClubVO)session.get(ClubVO.class, clubId);
			session.delete(clubVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}	
	}

	public static void main(String[] args) {

	}

}
