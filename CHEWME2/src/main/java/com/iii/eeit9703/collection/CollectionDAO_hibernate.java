package com.iii.eeit9703.collection;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.report.ReportVO;

public class CollectionDAO_hibernate implements Collection_interface {
	private static final String GET_ALL_STMT = "from CollectionVO ";
	private static final String GET_BYid_STMT = "from CollectionVO where memId=?";
	
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
	public void delete(CollectionVO collectionVO) {//刪除一筆要用什麼刪  問???ans collect
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			//ClubVO collectionVO = (CollectionVO)session.get(collectionVO.class, collectionVO);
			session.delete(collectionVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}	

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

	@Override
	public List<CollectionVO> getColIdListByMemId(Integer memId) {//等於find by primaryKey
		List<CollectionVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BYid_STMT);
			query.setParameter(0, memId);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	public static void main(String[] args){
		CollectionService ser=new CollectionService();
		MemVO memVO=new MemVO();
		Integer a=1;
		memVO.setMemId(a);
//		List<Integer> li=ser.getColIdListByMemId(memVO.getMemId());//直接給Id 不用包VO
//	    System.out.println(li.size());
//	    
//	    List<CollectionVO> all= ser.getAll();
//	    System.out.println(all.size());
	    
	  /*給CollectionVO刪除  
	    CollectionService ser=new CollectionService();
		MemVO memVO=new MemVO();
		ActivityVO activityVO =new ActivityVO();		
		Integer m=1;
		Integer a=1;
		memVO.setMemId(m);
		activityVO.setActID(a);
		CollectionVO collectionVO=new CollectionVO();
		collectionVO.setMemVO(memVO);
		collectionVO.setActivityVO(activityVO);
		ser.delete(collectionVO);
		*/
		
		
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
