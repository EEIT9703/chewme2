package com.iii.eeit9703.club.model.hibernate.question;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.iii.eeit9703.club.model.QuestionVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class QuestionHibernateDAO implements QuestionHibernateDAOI{
	
	private static final String GET_ALL_STMT="from question order by questionId";
	@Override
	public List<QuestionVO> getAll() {
		List<QuestionVO> list=null;
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
		return null;
	}


	@Override
	public void getOne(Integer questionId) {
		
	}

	@Override
	public void insert(QuestionVO questionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(questionVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void update(QuestionVO questionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(questionVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void delete(Integer questionId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			QuestionVO questionVO = (QuestionVO)session.get(QuestionVO.class, questionId);
			session.delete(questionId);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}
	public static void main(String[] args){
		// ���U�A��
		Configuration cfg = new Configuration().configure();
		ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
		// �Ы�SessionFactory
		SessionFactory sessionFactory = cfg.buildSessionFactory(registry);
		
		Session session = sessionFactory.openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			
			QuestionVO questionVO1 = new QuestionVO();//POJO1-saveOrUpdate-�s�W�έק�
			questionVO1.setQuestionId(1);
			questionVO1.setClubId(1);
			questionVO1.setQTitle("QTitle Test");
			questionVO1.setQcontent("QContent Test");
			questionVO1.setAskerId(1);
			questionVO1.setReaded(false);
			
			session.saveOrUpdate(questionVO1);
			
//			EmpVO empVO2 = new EmpVO();//POJO2-delete-�R��
//			empVO2.setEmpno(7014);
//			session.delete(empVO2);			
			
			Query query = session.createQuery("from QuestionVO order by questionId"); //HQL - Query���� - �i�ʸˬd�߱���
			List<QuestionVO> list = query.list();
			for (QuestionVO var : list) {
				System.out.print(var.getQuestionId() + ",");
				System.out.print(var.getClubId() + ",");
				System.out.print(var.getQTitle() + ",");
				System.out.print(var.getQcontent() + ",");
				System.out.print(var.getAskerId() + ",");
				System.out.println(var.getReaded() + ",");
			}

			tx.commit();
		} catch (RuntimeException ex) {
			if (tx != null)
				tx.rollback();
			throw ex; //System.out.println(ex.getMessage());
		} finally {
			session.close();
			sessionFactory.close();
		}
	}
	
	
}
