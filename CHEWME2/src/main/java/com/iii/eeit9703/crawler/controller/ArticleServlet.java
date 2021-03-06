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

		// 顯示當前景點的所有留言內容(從資料庫讀取)
		if ("getmessage".equals(action)) {
			Integer message = Integer.parseInt(request.getParameter("message"));  // 取得當前景點ID
			// out.print(message);
			// System.out.println(message);

			ArticleDAO artd = new ArticleDAO();
			ArrayList<ArticleVO> meslist = artd.findByPK(message);

			JSONArray artarry = new JSONArray(meslist);
			
			out.println(artarry.toString());
			// System.out.print(artarry.toString());

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

		// 按下送出留言傳送景點ID&留言內容進資料庫
		if ("sendmessage".equals(action)) {
			Integer attractionID = Integer.parseInt(request.getParameter("attractionID"));
			String contents = request.getParameter("contents");
			String mempho = request.getParameter("memPhoto1");
			// System.out.println(contents);
			// System.out.println(attractionID);
			//System.out.println(mempho);
			ArticleVO articleVO = new ArticleVO();
			articleVO.setAttractionID(attractionID);
			articleVO.setContents(contents);
			articleVO.setMemPhoto(mempho);
			
			ArticleHibernateDAO arthiber = new ArticleHibernateDAO();
			arthiber.insert(articleVO);
			System.out.println("success!");
		}
	}
}