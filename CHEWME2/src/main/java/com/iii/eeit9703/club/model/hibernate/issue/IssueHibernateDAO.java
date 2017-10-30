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

	private static final String GET_ALL_STMT="from IssueVO order by issueId";
	private static final String GET_ONE_STMT_SQL="from IssueVO order where issueId=(?)";
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
	public IssueVO getOne(Integer issueId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		IssueVO issueVO;
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ONE_STMT_SQL);
			query.setParameter(0, issueId);
			issueVO = (IssueVO)query.uniqueResult();
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}		
		
		return issueVO;
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
		IssueHibernateDAO ihd = new IssueHibernateDAO();
		List<IssueVO> list = ihd.getAll();
			for (IssueVO var : list) {
				System.out.print(var.getIssueId() + ",");
				System.out.print(var.getClubId() + ",");
				System.out.print(var.getIssueTitle() + ",");
				System.out.print(var.getIssueContent() + ",");
				System.out.print(var.getProposerId() + ",");
				System.out.println(var.getIssuepic() + ",");
				System.out.println(var.getComments() + ",");
			}				

	}

	
}
