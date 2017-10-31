package com.iii.eeit9703.bridge.model.hibernate.memJoinAct;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.bridge.model.ClubMemListVO;
import com.iii.eeit9703.bridge.model.MemJoinActDAOI;
import com.iii.eeit9703.bridge.model.MemJoinActVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemVO;

public class MemJoinActHibernateDAO implements MemJoinActDAOI{

	private static final String GET_ALL_STMT="from MemJoinActVO";
	private static final String GET_CLUB_BY_MEM_STMT="from MemJoinActVO where memId = ? ";

	@Override
	public List<MemJoinActVO> getAll() {
		List<MemJoinActVO> list=null;
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
	public List<MemJoinActVO> geActByMemId(Integer memId) {
		List<MemJoinActVO> list=null;
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
	public void insert(MemJoinActVO mjaVO) {
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
	public void update(MemJoinActVO mjaVO) {
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
			MemJoinActVO mjaVO = (MemJoinActVO)session.get(MemJoinActVO.class, pk);
			session.delete(mjaVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}

	
	
	public static void main(String[] args) {
		MemJoinActHibernateDAO mjahd = new MemJoinActHibernateDAO();
		List<MemJoinActVO> list = mjahd.geActByMemId(1);
//		List<ClubMemListVO> list = cmlhd.getAll();
		for (MemJoinActVO aClub : list) {
			System.out.print(aClub.getActId() + ",");
			System.out.print(aClub.getMemId() + ",");
			System.out.println(aClub.getDate() + ",");
		}
		
	}


}
