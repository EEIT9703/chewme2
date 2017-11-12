package com.iii.eeit9703.actEditor.model;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.hibernate.util.HibernateUtil;
import com.iii.eeit9703.member.model.MemDAO_hibernate;
import com.iii.eeit9703.member.model.MemVO;

import net.minidev.json.JSONValue;

public class ScheduleDAO_Hibernate  {

	private static final String GET_ALL_STMT = "from ScheduleVO";

	public List<ScheduleVO> getAll() {
		List<ScheduleVO> list = null;
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
		ScheduleDAO_Hibernate dao = new ScheduleDAO_Hibernate();
		List<ScheduleVO> list = dao.getAll();
		// String jsonString =JSONValue.toJSONString(list);
		System.out.println(list.size());
	}



}
