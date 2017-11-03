package com.iii.eeit9703.crawler.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iii.eeit9703.crawler.model.AttrVO;
import com.iii.eeit9703.crawler.model.SearchHibernateDAO;

@WebServlet("/attractions/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if("search".equals(action)){
			Map<String, String> error = new HashMap<String, String>();
			request.setAttribute("error", error);
			
			try{
			String name = request.getParameter("tags");	
			if (name == null || name.trim().length() == 0) {
				error.put("nameerror", "姓名欄位不得空白");
			}
			System.out.println(name);
			
			SearchHibernateDAO shDAO = new SearchHibernateDAO();
			AttrVO attrVO = shDAO.findByPK(name);			
			request.setAttribute("attrVO", attrVO);
			
			if(!error.isEmpty()){
				RequestDispatcher failure = request.getRequestDispatcher("chosen.jsp");
				failure.forward(request, response);
				return;
			}
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
