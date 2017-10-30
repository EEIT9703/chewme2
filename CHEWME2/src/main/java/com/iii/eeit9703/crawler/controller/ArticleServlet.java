package com.iii.eeit9703.crawler.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.iii.eeit9703.crawler.model.ArticleDAO;
import com.iii.eeit9703.crawler.model.ArticleHibernateDAO;
import com.iii.eeit9703.crawler.model.ArticleVO;
import com.sun.jersey.json.impl.writer.JacksonArrayWrapperGenerator;

@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if ("getmessage".equals(action)) {
			Integer message = Integer.parseInt(request.getParameter("message"));
			// out.print(message);
			// System.out.println(message);

			ArticleDAO artd = new ArticleDAO();
			ArrayList<ArticleVO> meslist = artd.findByPK(message);

			JSONArray artarry = new JSONArray(meslist);
			out.println(artarry.toString());
			// System.out.print(artarry);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if ("sendmessage".equals(action)) {
			Integer attractionID = Integer.parseInt(request.getParameter("attractionID"));
			String contents = request.getParameter("contents");
			// System.out.println(contents);
			// System.out.println(attractionID);

			ArticleVO articleVO = new ArticleVO();
			articleVO.setAttractionID(attractionID);
			articleVO.setContents(contents);
			
			ArticleHibernateDAO arthiber = new ArticleHibernateDAO();
			arthiber.insert(articleVO);
			System.out.println("success!");
		}
	}
}