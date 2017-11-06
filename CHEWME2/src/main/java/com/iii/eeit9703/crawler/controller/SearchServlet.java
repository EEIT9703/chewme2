package com.iii.eeit9703.crawler.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.iii.eeit9703.crawler.model.AttrDAO;
import com.iii.eeit9703.crawler.model.AttrVO;
import com.iii.eeit9703.crawler.model.SearchHibernateDAO;

@WebServlet("/attractions/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if ("search".equals(action)) {
			Map<String, String> error = new HashMap<String, String>();
			request.setAttribute("error", error);

			try {
				String name = request.getParameter("tags");
				if (name == null || name.trim().length() == 0) {
					RequestDispatcher failure1 = request.getRequestDispatcher("listAll.jsp");
					failure1.forward(request, response);
					return;					
//					error.put("nameerror", "請輸入關鍵字");
				}
				// System.out.println(name);

				SearchHibernateDAO shDAO = new SearchHibernateDAO();
				AttrVO attrVO = shDAO.findByPK(name);
				if (attrVO == null) {
					error.put("searcherror", "查無資料，請重新輸入!");
				} else {
					request.setAttribute("attrVO", attrVO);
					RequestDispatcher view = request.getRequestDispatcher("show_one.jsp");
					view.forward(request, response);
					String testname = attrVO.getName();
					System.out.println(testname);
				}

				if (!error.isEmpty()) {
					RequestDispatcher failure = request.getRequestDispatcher("listAll.jsp");
					failure.forward(request, response);
					return;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if("search1".equals(action)){
			String name = request.getParameter("searchbar");
			System.out.println(name);
			
			AttrDAO attrDAO = new AttrDAO();
			ArrayList<AttrVO> sear = attrDAO.search(name);
			JSONArray src = new JSONArray(sear);
			out.print(src.toString());
			System.out.println(src.toString());
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
