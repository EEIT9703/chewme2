package com.iii.eeit9703.club.model.hibernate.club;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.iii.eeit9703.club.model.ClubDAOI;
import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class ClubHibernateDAO implements ClubDAOI{
	
	private static final String GET_ALL_STMT="from ClubVO order by clubId";
	private static final String GET_ALL_STMT_SQL="from ClubVO where clubId = ?";
	@Override
	public List<ClubVO> getAll() {
		List<ClubVO> list=null;
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
	public ClubVO getOne(Integer clubId) {
		ClubVO clubVO=null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT_SQL);
			query.setParameter(0, clubId);
			clubVO = (ClubVO)query.uniqueResult();
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
		return clubVO;
	}

	@Override
	public void insert(ClubVO clubVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(clubVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void update(ClubVO clubVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(clubVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}
	}

	@Override
	public void delete(Integer clubId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			ClubVO clubVO = (ClubVO)session.get(ClubVO.class, clubId);
			session.delete(clubVO);
			session.getTransaction().commit();
				
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;			
		}	
	}

	public static void main(String[] args) {
		ClubHibernateDAO chd = new ClubHibernateDAO();
		List<ClubVO> list = chd.getAll();
		for (ClubVO aClub : list) {
			System.out.print(aClub.getClubId() + ",");
			System.out.print(aClub.getClubName() + ",");
			System.out.print(aClub.getManagerId() + ",");
			System.out.print(aClub.getLocationId() + ",");
			System.out.print(aClub.getBrief() + ",");
			System.out.print(aClub.getRefURL() + ",");
			System.out.print(aClub.getVistors() + ",");
			System.out.print(aClub.getVistorsInMonth() + ",");
			System.out.println(aClub.getAddr() + ",");
		}
		
		ClubVO aClub = chd.getOne(1);
		System.out.print(aClub.getClubId() + ",");
		System.out.print(aClub.getClubName() + ",");
		System.out.print(aClub.getManagerId() + ",");
		System.out.print(aClub.getLocationId() + ",");
		System.out.print(aClub.getBrief() + ",");
		System.out.print(aClub.getRefURL() + ",");
		System.out.print(aClub.getVistors() + ",");
		System.out.print(aClub.getVistorsInMonth() + ",");
		System.out.println(aClub.getAddr() + ",");
	
		/*// ���U�A��
		Configuration cfg = new Configuration().configure();
		ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
		// �Ы�SessionFactory
		SessionFactory sessionFactory = cfg.buildSessionFactory(registry);
		
		Session session = sessionFactory.openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			
			ClubVO clubVO1 = new ClubVO();//POJO1-saveOrUpdate-�s�W�έק�
			clubVO1.setClubName("MANAGER");
			clubVO1.setManagerId(1);
			clubVO1.setLocationId(1);
			clubVO1.setBrief("Test hibernate");
			clubVO1.setRefURL("http://www.example");
			clubVO1.setVistors(1);
			clubVO1.setVistorsInMonth(1);
			clubVO1.setAddr("In Taipei");		
			
			session.saveOrUpdate(clubVO1);
			
//			EmpVO empVO2 = new EmpVO();//POJO2-delete-�R��
//			empVO2.setEmpno(7014);
//			session.delete(empVO2);			
			
			Query query = session.createQuery("from ClubVO order by clubId"); //HQL - Query���� - �i�ʸˬd�߱���
			List<ClubVO> list = query.list();
			for (ClubVO aClub : list) {
				System.out.print(aClub.getClubId() + ",");
				System.out.print(aClub.getClubName() + ",");
				System.out.print(aClub.getManagerId() + ",");
				System.out.print(aClub.getLocationId() + ",");
				System.out.print(aClub.getBrief() + ",");
				System.out.print(aClub.getRefURL() + ",");
				System.out.print(aClub.getVistors() + ",");
				System.out.print(aClub.getVistorsInMonth() + ",");
				System.out.println(aClub.getAddr() + ",");
			}

			tx.commit();
		} catch (RuntimeException ex) {
			if (tx != null)
				tx.rollback();
			throw ex; //System.out.println(ex.getMessage());
		} finally {
			session.close();
			sessionFactory.close();
		}*/
	}
	

}
