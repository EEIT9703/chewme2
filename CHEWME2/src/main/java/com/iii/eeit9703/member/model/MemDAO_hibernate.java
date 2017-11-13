package com.iii.eeit9703.member.model;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.collection.CollectionVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.order.OrderVO;

public class MemDAO_hibernate implements MemDAO_interface {
	private static final String GET_ALL_STMT = "from MemVO";
	@Override
	public void insert(MemVO memVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memVO.setMemStatus("正常");
			memVO.setMemRole("一般會員");
			session.saveOrUpdate(memVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	
//	@Override
//	public Set<ReportVO> getRepByMemNo(Integer memId) {
//		Set<ReportVO> set = findByPrimaryKey(memId).getReports();
//		return set;
//	}
//
//
	@Override
	public Set<CollectionVO> getCollByMemNo(Integer memId) {
		Set<CollectionVO> set = findByPrimaryKey(memId).getCollects();
		return set;
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
	public MemVO findByMemberId(String MemberId) {
		MemVO memVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memVO = (MemVO) session.get(MemVO.class, MemberId);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memVO;
	}
	
	@Override
	public MemVO findByGID(String googleId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx=null;
		MemVO memVO=new MemVO();
		try{
			tx=session.beginTransaction();
			
			Query query=session.createQuery("from MemVO where googleId=?");
			query.setParameter(0, googleId);
			List<MemVO> list=query.list();
			for(MemVO mv:list){
				memVO.setMemberId(mv.getMemberId());
				memVO.setMemName(mv.getMemName());
				memVO.setMemNickN(mv.getMemNickN());
				memVO.setMemBirthday(mv.getMemBirthday());
				memVO.setMemMail(mv.getMemMail());
				memVO.setMemAddr(mv.getMemAddr());
				memVO.setMemPhone(mv.getMemPhone());
				memVO.setMemIntr(mv.getMemIntr());
				memVO.setMemPhoto(mv.getMemPhoto());
				memVO.setMemStatus(mv.getMemStatus());
				memVO.setMemRole(mv.getMemRole());
				memVO.setGoogleId(mv.getGoogleId());				

			}
			tx.commit();
		}catch(RuntimeException re){
			session.getTransaction().rollback();
			throw re;
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
	
	
	
	@Override
	public Set<OrderVO> findOrdersByMemId(Integer memId) {
			
		Set<OrderVO> list = findByPrimaryKey(memId).getOrders();
		return list;
	}


	@Override
	public Set<ActivityVO> findActivitysByMemId(Integer memId) {
		Set<ActivityVO> list = findByPrimaryKey(memId).getActivitys();
		return list;
	}


	public static void main(String[] args) {
//	MemDAO_hibernate dao =new MemDAO_hibernate();
//	Set<ReportVO> set=dao.getRepByMemNo(1);
//	   	for(ReportVO reportVO :set){
//	   		System.out.println(reportVO.getReportContext());		
//	   	}
	
//		MemDAO_hibernate dao =new MemDAO_hibernate();
//		Set<CollectionVO> set=dao.getCollByMemNo(1);
//		
//		   	for(CollectionVO collectionVO :set){
//		   		System.out.println(collectionVO.getMemVO().getMemMail());
//		   		
//   		
//		   	}

//	System.out.println(list2);
//	String jsonString =JSONValue.toJSONString(list2);
//	System.out.println(jsonString);
//	List<MemVO> list2 = dao.getAll();
//	for (MemVO memVO : list2) {
//		System.out.print(memVO.getMemberId() + ",");
//		System.out.print(memVO.getMemMail() + ",");
//		System.out.print(memVO.getMemPhone());
//		System.out.print(memVO.getMemRole());
//		System.out.print(memVO.getMemStatus());
//	
//		System.out.println("\n-----------------");
//		Set<ActivityVO> Activitys =memVO.getActivitys();
//		
//		for (ActivityVO activityVO : Activitys) {
//			System.out.print(activityVO.getAct_name() + ",");
//			System.out.print(activityVO.getAct_groups() + ",");
//			System.out.print(activityVO.getAct_current());
//		
//		
//			System.out.println();
//		}
//		System.out.println();
//	}	
		MemDAO_hibernate dao=new MemDAO_hibernate();
//		List<MemVO> list1 = dao.getAll();
//		for (MemVO memVO : list1) {
//			System.out.print(memVO.getMemberId() + ",");
//			System.out.print(memVO.getMemMail() + ",");
//			System.out.print(memVO.getMemPhone());
//			System.out.print(memVO.getMemRole());
//			System.out.print(memVO.getMemStatus());
//		
//			System.out.println("\n-----------------");
//	
//	}
					
		
		Set<OrderVO> list =dao.findOrdersByMemId(1);
		for(OrderVO orderVO :list){
			
			System.out.print(orderVO.getOrderName());
			
		}

	}


	@Override
	public void updatePwd(String memberId, String memPwd) {
		// TODO Auto-generated method stub
		
	}
	

}
