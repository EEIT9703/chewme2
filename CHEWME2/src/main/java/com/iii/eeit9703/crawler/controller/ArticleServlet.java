package com.iii.eeit9703.crawler.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.iii.eeit9703.crawler.model.ArticleDAO;
import com.iii.eeit9703.crawler.model.ArticleVO;

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
			//System.out.println(message);

			ArticleDAO artd = new ArticleDAO();
			ArticleVO articleVO = artd.findByPK(message);
			JSONObject artjson = new JSONObject(articleVO);
			out.print(artjson.getString("contents"));
			
			System.out.println(artjson.getString("contents"));
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}