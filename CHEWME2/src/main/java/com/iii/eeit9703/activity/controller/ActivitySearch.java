package com.iii.eeit9703.activity.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;


import com.iii.eeit9703.activity.model.ActService;
import com.iii.eeit9703.activity.model.ActivityVO;


@WebServlet("/act/ActivitySearch")

@MultipartConfig(
location="",
maxRequestSize=1024*1024*1024,
fileSizeThreshold=1024*1024*1024,
maxFileSize=1024*1024*1024
)
public class ActivitySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doPost(req, resp);
	}


	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setHeader("content-type", "text/html;charset=UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		
		String action = req.getParameter("action");
		PrintWriter out = resp.getWriter();
		
		
		if("Search".equals(action)){
			String act_name = req.getParameter("search");
			
			System.out.println(act_name);
			
			ActService actSvc = new ActService();
			ArrayList<ActivityVO> activityVO = actSvc.Search(act_name);
			
			JSONArray actJSON = new JSONArray(activityVO);
			out.print(actJSON.toString());
			System.out.println(actJSON);
		
			
			}
	}
	
	
	

}
