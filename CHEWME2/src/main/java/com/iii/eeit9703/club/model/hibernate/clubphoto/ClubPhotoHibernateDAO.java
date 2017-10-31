package com.iii.eeit9703.club.model.hibernate.clubphoto;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.club.model.ClubPhotoDAOI;
import com.iii.eeit9703.club.model.ClubPhotoVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemDAO_hibernate;
import com.iii.eeit9703.member.model.MemVO;

public class ClubPhotoHibernateDAO implements ClubPhotoDAOI {
	private static final String GET_ALL_STMT = "from ClubPhotoVO order by photoId";
	@Override
	public void insert(ClubPhotoVO photoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(photoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ClubPhotoVO photoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(photoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer photo_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ClubPhotoVO photoVO = (ClubPhotoVO) session.get(ClubPhotoVO.class, photo_no);
			session.delete(photoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public ClubPhotoVO findByPrimaryKey(Integer photo_no) {
		ClubPhotoVO photoVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			photoVO = (ClubPhotoVO) session.get(ClubPhotoVO.class, photo_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return photoVO;
	}

	@Override
	public List<ClubPhotoVO> getAll() {
		List<ClubPhotoVO> list = null;
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

	@Override
	public Set<ClubPhotoVO> getMemberByDeptno(Integer photo_no) {
		// TODO Auto-generated method stub
		return null;
	}
	public static void main(String[] args) {
		
		
		Clu+9bPhotoHibernateDAO a=new ClubPhotoHibernateDAO();
		List<ClubPhotoVO> vo=a.getAll();
		for(ClubPhotoVO photo : vo){
			
			System.out.println(photo.getPhoto_no());
		}
		
		}

}
