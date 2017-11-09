package com.iii.eeit9703.member.model;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.simple.JSONValue;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.bridge.model.ClubMemRelationVO;
import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.collection.CollectionVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.order.OrderVO;
import com.iii.eeit9703.report.ReportVO;

public class MemDAO implements MemDAO_interface {
	private static final String GET_ALL_STMT = "from MemVO order by memId";

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

	// @Override
	// public Set<ReportVO> getRepByMemNo(Integer memId) {
	// Set<ReportVO> set = findByPrimaryKey(memId).getReports();
	// return set;
	// }
	//
	//
	// @Override
	// public Set<CollectionVO> getCollByMemNo(Integer memId) {
	// Set<CollectionVO> set = findByPrimaryKey(memId).getCollects();
	// return set;
	// }

	@Override
	public void update(MemVO memVO) {
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

	public void updatePwd(String memberId, String memPwd) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("update MemVO set memPwd=? where memberId=?");
			query.setParameter(0, memPwd);
			query.setParameter(1, memberId);
			int updateCount = query.executeUpdate();
			System.out.println("更新的筆數="+updateCount);
			tx.commit();
		} catch (RuntimeException re) {
			session.getTransaction().rollback();
			throw re;
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

		Transaction tx = null;
		MemVO memVO = new MemVO();
		try {
			tx = session.beginTransaction();

			Query query = session.createQuery("from MemVO where googleId=?");
			query.setParameter(0, googleId);
			List<MemVO> list = query.list();
			for (MemVO mv : list) {
				memVO.setMemId(mv.getMemId());
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
		} catch (RuntimeException re) {
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
	public Set<ActivityVO> findActivitysByMemId(Integer memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<OrderVO> findOrdersByMemId(Integer memId) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<ClubMemRelationVO> fomc(int memId){
		List<ClubMemRelationVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
		Query query=session.createQuery("from ClubMemRelationVO cmr JOIN ClubVO  where MemId=?");
		//SELECT t FROM Teacher t join t.students s join s.books b where b.name = 'a' 
		query.setParameter(0, memId);
		list=query.list();
		session.getTransaction().commit();
		}catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	
	return list;
	}

	public static void main(String[] args) {
		MemDAO md = new MemDAO();
//		md.findByPrimaryKey(1);
//
//		md.updatePwd("eeit970301", "eeit970301");
		System.out.println(md.fomc(1));
		List<ClubMemRelationVO> list=md.fomc(1);
		for(ClubMemRelationVO cmr:list){
			System.out.print(cmr.getClubId() + ",");
	
			
		}
		

	}

}
