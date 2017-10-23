package com.iii.eeit9703.club.model.hibernate.comment;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.iii.eeit9703.club.model.CommentVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class CommentHibernateDAO implements CommentHibernateDAOI {

	private static final String GET_ALL_STMT="from comment order by commentId";
	@Override
	public List<CommentVO> getAll() {
		List<CommentVO> list=null;
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
	public void getOne(Integer commentId) {
		
	}

	@Override
	public void insert(CommentVO commentVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(commentVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void update(CommentVO commentVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(commentVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void delete(Integer commentId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			CommentVO commentVO = (CommentVO)session.get(CommentVO.class, commentId);
			session.delete(commentId);
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
		
		CommentVO commentVO1 = new CommentVO();//POJO1-saveOrUpdate-�s�W�έק�
		commentVO1.setCommentId(1);
		commentVO1.setIssueId(1);
		commentVO1.setContent("commentTest");
		commentVO1.setCommenterId(1);
		System.out.println(Calendar.getInstance().getTime().toString());
		System.out.println(new java.sql.Date(Calendar.getInstance().getTime().getTime()));
		commentVO1.setCommentDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));	
		
		session.saveOrUpdate(commentVO1);
		
//		EmpVO empVO2 = new EmpVO();//POJO2-delete-�R��
//		empVO2.setEmpno(7014);
//		session.delete(empVO2);			
		
		Query query = session.createQuery("from QuestionVO order by questionId"); //HQL - Query���� - �i�ʸˬd�߱���
		List<CommentVO> list = query.list();
		for (CommentVO var : list) {
			System.out.print(var.getCommentId() + ",");
			System.out.print(var.getIssueId() + ",");
			System.out.print(var.getContent() + ",");
			System.out.print(var.getCommenterId() + ",");
			System.out.println(var.getCommentDate() + ",");
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
