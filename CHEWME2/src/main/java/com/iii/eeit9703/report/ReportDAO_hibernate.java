package com.iii.eeit9703.report;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemDAO_hibernate;
import com.iii.eeit9703.member.model.MemVO;

public class ReportDAO_hibernate implements Report_interface {
	private static final String GET_ALL_STMT = "from ReportVO ";
	@Override
	public void insert(ReportVO reportVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(reportVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(ReportVO reportVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(reportVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(ReportVO reportVO) {
		// TODO Auto-generated method stub

	}

//	@Override
//	public ReportVO findByPrimaryKey(ReportVO reportVO) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<ReportVO> getAll() {
		List<ReportVO> list = null;
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
//	public List<ReportVO> getMemByActId(ReportVO reportVO) {
//		List<ReportVO> list = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(GET_ALL_STMT);
//			list = query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//		return list;
	
	public static void main(String[] args) {
		ActivityVO activityVO= new ActivityVO();
		MemVO memVO=new MemVO();
		
		Integer a=2;
		Integer b=2;
		activityVO.setActID(a);
		memVO.setMemId(b);
	
		 	 
//		 SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		 Calendar tmpCal = Calendar.getInstance();
//		 String strDate = sdFormat.format(tmpCal.getTime());
//		 System.out.println(strDate);
		
	//	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//Date date=sdFormat.format(System.currentTimeMillis());
		Date date=new Date(System.currentTimeMillis());
		//Date date = new Date(Long.MAX_VALUE);

		
		System.out.println(date);
		
		ReportVO reportVO=new ReportVO();
		//???	reportVO.setActivityVO(activityVO);
		reportVO.setActivityVO(activityVO);
		reportVO.setMemVO(memVO);
		reportVO.setReportTime();
		reportVO.setReportContext("3");			
	
		ReportDAO_hibernate dao =new ReportDAO_hibernate();
		dao.insert(reportVO);	
	
	
	}
	

}
