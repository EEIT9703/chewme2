package com.iii.eeit9703.club.model.hibernate.reply;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.CommentVO;
import com.iii.eeit9703.club.model.ReplyVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class ReplyHibernateDAO implements ReplyHibernateDAOI{

	private static final String GET_ALL_STMT="from reply order by replyId";
	@Override
	public List<ReplyVO> getAll() {
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
	public void getOne(Integer reqlyId) {
		
	}

	@Override
	public void insert(ReplyVO replyVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(replyVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void update(ReplyVO replyVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(replyVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void delete(Integer reqlyId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			ReplyVO replyVO = (ReplyVO)session.get(ReplyVO.class, reqlyId);
			session.delete(reqlyId);
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
			
			ReplyVO replyO1 = new ReplyVO();//POJO1-saveOrUpdate-�s�W�έק�
			replyO1.setReqlyId(1);
			replyO1.setqId(1);
			replyO1.setReplyContent("replyTest");
			replyO1.setReplyerId(1);
			replyO1.setReplyDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));	
			replyO1.setReaded(true);	
			
			session.saveOrUpdate(replyO1);
			
//			EmpVO empVO2 = new EmpVO();//POJO2-delete-�R��
//			empVO2.setEmpno(7014);
//			session.delete(empVO2);			
			
			Query query = session.createQuery("from QuestionVO order by questionId"); //HQL - Query���� - �i�ʸˬd�߱���
			List<ReplyVO> list = query.list();
			for (ReplyVO var : list) {
				System.out.print(var.getReqlyId() + ",");
				System.out.print(var.getqId() + ",");
				System.out.print(var.getReplyContent() + ",");
				System.out.print(var.getReplyerId() + ",");
				System.out.println(var.getReplyDate() + ",");
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
