package com.iii.eeit9703.club.model.hibernate.clubphoto;

import java.io.InputStream;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import com.iii.eeit9703.club.model.ClubPhotoDAOI;
import com.iii.eeit9703.club.model.ClubPhotoVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class ClubPhotoHibernateDAO implements ClubPhotoDAOI {
	@Override
	public void updateByClubId(ClubPhotoVO photoVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ClubPhotoVO photoVO, InputStream is) {
		// TODO Auto-generated method stub
		
	}

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
	public void update(ClubPhotoVO photoVO, InputStream is) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<ClubPhotoVO> getClubPhotoByClubId(Integer clubId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void delete(Integer photoId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ClubPhotoVO photoVO = (ClubPhotoVO) session.get(ClubPhotoVO.class, photoId);
			session.delete(photoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public ClubPhotoVO findByPrimaryKey(Integer photoId) {
		ClubPhotoVO photoVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			photoVO = (ClubPhotoVO) session.get(ClubPhotoVO.class, photoId);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return photoVO;
	}


	public List<ClubPhotoVO> getAll() {
/*		List<ClubPhotoVO> list = null;
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
		return list;*/
		return null;
	}


	public Set<ClubPhotoVO> getMemberByDeptno(Integer photo_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {

		ClubPhotoHibernateDAO a = new ClubPhotoHibernateDAO();
		List<ClubPhotoVO> vo = a.getAll();
		for (ClubPhotoVO photo : vo) {

			System.out.println(photo.getPhotoId());
		}

	}

}
