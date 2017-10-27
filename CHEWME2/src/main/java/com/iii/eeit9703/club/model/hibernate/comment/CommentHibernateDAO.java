package com.iii.eeit9703.club.model.hibernate.comment;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.iii.eeit9703.club.model.CommentDAOI;
import com.iii.eeit9703.club.model.CommentVO;
import com.iii.eeit9703.hibernate.util.HibernateUtil;

public class CommentHibernateDAO implements CommentDAOI {

	private static final String GET_ALL_STMT = "from CommentVO order by commentId";

	@Override
	public List<CommentVO> getAll() {
		List<CommentVO> list = null;
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

	@Override
	public void getOne(Integer commentId) {

	}

	@Override
	public void insert(CommentVO commentVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(commentVO);
			session.getTransaction().commit();

		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(CommentVO commentVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(commentVO);
			session.getTransaction().commit();

		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer commentId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			CommentVO commentVO = (CommentVO) session.get(CommentVO.class, commentId);
			session.delete(commentId);
			session.getTransaction().commit();

		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	public static void main(String[] args) {
		CommentHibernateDAO chd = new CommentHibernateDAO();		
		List<CommentVO> list = chd.getAll();
		for (CommentVO var : list) {
			System.out.print(var.getCommentId() + ",");
			System.out.print(var.getIssueId() + ",");
			System.out.print(var.getContent() + ",");
			System.out.print(var.getCommenterId() + ",");
			System.out.println(var.getCommentDate() + ",");
		}

	}

}
