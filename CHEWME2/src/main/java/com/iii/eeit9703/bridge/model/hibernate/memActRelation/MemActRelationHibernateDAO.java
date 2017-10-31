package com.iii.eeit9703.bridge.model.hibernate.memActRelation;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.bridge.model.ClubMemRelationVO;
import com.iii.eeit9703.bridge.model.MemActRelationDAOI;
import com.iii.eeit9703.bridge.model.MemActRelationVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemVO;

public class MemActRelationHibernateDAO implements MemActRelationDAOI{

	private static final String GET_ALL_STMT="from MemActRelationVO";
	private static final String GET_CLUB_BY_MEM_STMT="from MemActRelationVO where memId = ? ";

	@Override
	public List<MemActRelationVO> getAll() {
		List<MemActRelationVO> list=null;
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
	public List<MemActRelationVO> geActByMemId(Integer memId) {
		List<MemActRelationVO> list=null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_CLUB_BY_MEM_STMT);
			query.setParameter(0, memId);
			list = query.list();
			//query.executeUpdate();
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		return list;
	}

	@Override
	public void getOne(Integer pk) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void insert(MemActRelationVO mjaVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(mjaVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
		
	}


	@Override
	public void update(MemActRelationVO mjaVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(mjaVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}


	@Override
	public void delete(Integer pk) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			MemActRelationVO mjaVO = (MemActRelationVO)session.get(MemActRelationVO.class, pk);
			session.delete(mjaVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}

	
	
	public static void main(String[] args) {
		MemActRelationHibernateDAO mjahd = new MemActRelationHibernateDAO();
		List<MemActRelationVO> list = mjahd.geActByMemId(1);
//		List<ClubMemListVO> list = cmlhd.getAll();
		for (MemActRelationVO aClub : list) {
			System.out.print(aClub.getActId() + ",");
			System.out.print(aClub.getMemId() + ",");
			System.out.println(aClub.getDate() + ",");
		}
		
	}


}
