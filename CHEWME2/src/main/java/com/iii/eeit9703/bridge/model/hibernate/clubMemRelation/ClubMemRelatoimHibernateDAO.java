package com.iii.eeit9703.bridge.model.hibernate.clubMemRelation;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.bridge.model.ClubMemRelationDAOI;
import com.iii.eeit9703.bridge.model.ClubMemRelationVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class ClubMemRelatoimHibernateDAO implements ClubMemRelationDAOI{

	private static final String GET_ALL_STMT="from ClubMemRelationVO";
	private static final String GET_CLUB_BY_MEM_STMT="from ClubMemRelationVO where memId = ? ";
	
	@Override
	public List<ClubMemRelationVO> getAll() {
		List<ClubMemRelationVO> list=null;
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
	public ClubMemRelationVO getOne(Integer clubId, Integer memId) {
		// TODO Auto-generated method stub
		ClubMemRelationVO cmlVO = new ClubMemRelationVO();
		return cmlVO;
	}

	@Override
	public List<ClubMemRelationVO> getListClubByMemId(Integer memId) {
		List<ClubMemRelationVO> list=null;
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
	public void insert(ClubMemRelationVO cmlVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(cmlVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}

	@Override
	public void update(ClubMemRelationVO cmlVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(cmlVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}

	@Override
	public void delete(ClubMemRelationVO cmlVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			ClubMemRelationVO cml2VO = (ClubMemRelationVO)session.get(ClubMemRelationVO.class, cmlVO);
			session.delete(cml2VO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		
	}
	public static void main(String[] args) {
		ClubMemRelatoimHibernateDAO cmlhd = new ClubMemRelatoimHibernateDAO();
		List<ClubMemRelationVO> list = cmlhd.getListClubByMemId(2);
//		List<ClubMemListVO> list = cmlhd.getAll();
		for (ClubMemRelationVO aClub : list) {
			System.out.print(aClub.getClubId() + ",");
			System.out.print(aClub.getMemId() + ",");
			System.out.println(aClub.getDate() + ",");
		}
		
	}


}
