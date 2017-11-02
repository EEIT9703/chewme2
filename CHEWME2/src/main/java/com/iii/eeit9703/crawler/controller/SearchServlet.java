package com.iii.eeit9703.crawler.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iii.eeit9703.crawler.model.AttrVO;
import com.iii.eeit9703.crawler.model.SearchHibernateDAO;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if("getonesearch".equals(action)){
			try{
			String name = request.getParameter("searchone");			
			SearchHibernateDAO shDAO = new SearchHibernateDAO();
			AttrVO attrVO = shDAO.findByPK(name);
			
			request.setAttribute("attrVO", attrVO);
			RequestDispatcher view = request.getRequestDispatcher("searchOne.jsp");
			view.forward(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
