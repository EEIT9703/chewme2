package com.iii.eeit9703.report;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.json.JSONObject;
import org.hibernate.Query;
import org.hibernate.Session;
import org.json.simple.JSONValue;

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
//		ActivityVO activityVO= new ActivityVO();
//		MemVO memVO=new MemVO();
//		
//		Integer a=2;
//		Integer b=1;
//		activityVO.setActID(a);
//		memVO.setMemId(b);
//		Timestamp date=new Timestamp(System.currentTimeMillis());
//	
//		
//		ReportVO reportVO=new ReportVO();
//		reportVO.setActivityVO(activityVO);
//		reportVO.setMemVO(memVO);		
//		reportVO.setReportTime(date);
//		reportVO.setReportContext("fuck");			
//	
//		ReportDAO_hibernate dao =new ReportDAO_hibernate();
//		dao.insert(reportVO);	
		
		ReportDAO_hibernate dao= new ReportDAO_hibernate();				
//		ArrayList<ReportVO> attrList = (ArrayList<ReportVO>) dao.getAll();
		List<ReportVO> attrList = dao.getAll();
		System.out.println(attrList);
		
		for(ReportVO vo:attrList){
			
			System.out.println(vo.getReportContext());
			System.out.println(vo.getMemVO().getMemberId());
			System.out.println(vo.getMemVO().getMemAddr());
			System.out.println(vo.getActivityVO().getAct_name());
			System.out.println("-------------");
		}
		

		String jsonString =JSONValue.toJSONString(attrList);
		System.out.println(jsonString);
	}
	

}
