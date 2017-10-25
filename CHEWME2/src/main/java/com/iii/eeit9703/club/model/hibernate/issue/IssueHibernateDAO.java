package com.iii.eeit9703.club.model.hibernate.issue;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.iii.eeit9703.club.model.IssueDAOI;
import com.iii.eeit9703.club.model.IssueVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class IssueHibernateDAO implements IssueDAOI{

	private static final String GET_ALL_STMT="from issue order by issueId";
	@Override
	public List<IssueVO> getAll() {
		List<IssueVO> list=null;
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
		return list;
	}

	@Override
	public void getOne(Integer issueId) {
		
	}

	@Override
	public void insert(IssueVO IssueVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(IssueVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void update(IssueVO IssueVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(IssueVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}	
	}

	@Override
	public void delete(Integer issueId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			IssueVO issueVO = (IssueVO)session.get(IssueVO.class, issueId);
			session.delete(issueId);
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
			
			IssueVO issueVO1 = new IssueVO();//POJO1-saveOrUpdate-�s�W�έק�
			issueVO1.setIssueId(1);
			issueVO1.setClubId(1);
			issueVO1.setIssueTitle("issueTest");
			issueVO1.setIssueContent("issueTest");
			issueVO1.setProposerId(1);
			issueVO1.setIssuepic(null);
//			issueVO1.setComments(null);	
			
			session.saveOrUpdate(issueVO1);
			
//			EmpVO empVO2 = new EmpVO();//POJO2-delete-�R��
//			empVO2.setEmpno(7014);
//			session.delete(empVO2);			
			
			Query query = session.createQuery("from IssueVO order by issueId"); //HQL - Query���� - �i�ʸˬd�߱���
			List<IssueVO> list = query.list();
			for (IssueVO var : list) {
				System.out.print(var.getIssueId() + ",");
				System.out.print(var.getClubId() + ",");
				System.out.print(var.getIssueTitle() + ",");
				System.out.print(var.getIssueContent() + ",");
				System.out.print(var.getProposerId() + ",");
				System.out.println(var.getIssuepic() + ",");
//				System.out.println(var.getComments() + ",");
				
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
