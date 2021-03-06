package com.iii.eeit9703.crawler.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.simple.JSONValue;

import com.google.gson.JsonArray;
import com.iii.eeit9703.crawler.model.ArticleVO;
import com.iii.eeit9703.crawler.model.AttrDAO;
import com.iii.eeit9703.crawler.model.AttrService;
import com.iii.eeit9703.crawler.model.AttrVO;

//  查全部資料，回傳給chosen.jsp，搜尋欄輸入關鍵字會顯示資料庫資料
@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		

		AttrDAO attrDAO = new AttrDAO();
		
		
		ArrayList<AttrVO> list = attrDAO.getAll();
		
		JSONArray artarry = new JSONArray(list);
		 
		out.print(artarry.toString());
		System.out.println(artarry.toString());
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
