package com.iii.eeit9703.bridge.model.hibernate.clubMemList;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.bridge.model.ClubMemListDAOI;
import com.iii.eeit9703.bridge.model.ClubMemListVO;
import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemVO;

public class ClubMemListHibernateDAO implements ClubMemListDAOI{

	private static final String GET_ALL_STMT="from ClubMemListVO";
	private static final String GET_CLUB_BY_MEM_STMT="from ClubMemListVO where memId = ? ";
	
	@Override
	public List<ClubMemListVO> getAll() {
		List<ClubMemListVO> list=null;
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
	public ClubMemListVO getOne(Integer memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ClubMemListVO> getListClubByMemId(Integer memId) {
		List<ClubMemListVO> list=null;
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
	public void insert(MemVO memVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(memVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}

	@Override
	public void update(MemVO memVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(memVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}

	@Override
	public void delete(Integer memId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			MemVO memVO = (MemVO)session.get(MemVO.class, memId);
			session.delete(memVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}
	public static void main(String[] args) {
		ClubMemListHibernateDAO cmlhd = new ClubMemListHibernateDAO();
		List<ClubMemListVO> list = cmlhd.getListClubByMemId(2);
//		List<ClubMemListVO> list = cmlhd.getAll();
		for (ClubMemListVO aClub : list) {
			System.out.print(aClub.getClubId() + ",");
			System.out.print(aClub.getMemId() + ",");
			System.out.println(aClub.getDate() + ",");
		}
		
	}


}
