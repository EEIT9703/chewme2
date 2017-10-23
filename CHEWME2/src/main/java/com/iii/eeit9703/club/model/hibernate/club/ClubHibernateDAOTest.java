package com.iii.eeit9703.club.model.hibernate.club;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.iii.eeit9703.club.model.ClubVO;


public class ClubHibernateDAOTest {
	
	public static void main(String[] args) throws NamingException, SQLException {

		// ���U�A��
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
