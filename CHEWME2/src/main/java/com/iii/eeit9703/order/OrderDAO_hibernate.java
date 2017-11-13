package com.iii.eeit9703.order;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;


import com.iii.eeit9703.hibernate.util.HibernateUtil;


public class OrderDAO_hibernate implements Order_interface {
	private static final String GET_ALL_STMT = "from OrderVO ";
	
	@Override
	public void insert(OrderVO orderVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(orderVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}
	
	public OrderVO findByPrimaryKey(Integer orderId) {
		OrderVO orderVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			orderVO = (OrderVO) session.get(OrderVO.class, orderId);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return orderVO;
	}
	


	@Override
	public List<OrderVO> getAll() {
		List<OrderVO> list = null;
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

	public static void main(String[] args) {
		OrderDAO_hibernate DAO=new OrderDAO_hibernate();
		OrderVO orderVO=DAO.findByPrimaryKey(42);
	
		System.out.println(orderVO.getOrderName());
	}

}
