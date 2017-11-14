package com.iii.eeit9703.activity.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;


import com.iii.eeit9703.activity.model.ActService;
import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.crawler.model.AttrService;
import com.iii.eeit9703.crawler.model.AttrVO;


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
		//HttpSession session = req.getSession(false);
		HttpSession session = req.getSession();
		if("Search".equals(action)){
			String act_name = req.getParameter("search");
			
			//System.out.println(act_name);
			
			ActService actSvc = new ActService();
			ArrayList<ActivityVO> activityVO = actSvc.Search(act_name);
			
			JSONArray actJSON = new JSONArray(activityVO);
			out.print(actJSON.toString());
			//System.out.println(actJSON);
		
			
			}

	

		
		if("searchone".equals(action)){
			try {
				Integer actID = new Integer(req.getParameter("name"));
			
				//session.removeAttribute("activityVO");				
				
				System.out.println(actID);
				ActService actSvc = new ActService();
				ActivityVO activityVO = actSvc.getOneAct(actID);
				System.out.println(activityVO.getAct_name());
				if(session.getAttribute("record")!=null){
				Set<Integer> record =(Set<Integer>) session.getAttribute("record");				
				record.add(actID);			
				System.out.println(record.size()+"qeqeqeeqeqeqeqe");
				session.setAttribute("record", record);
				}
                req.setAttribute("activityVO", activityVO);
				RequestDispatcher view = req.getRequestDispatcher("/act/show.jsp");
				view.forward(req,resp);
			
				
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if("searchattr".equals(action)){
			try {
//				session.removeAttribute("attrVO");
				Integer attrID = new Integer(req.getParameter("name"));
				System.out.println(attrID);
				
				AttrService attrupd = new AttrService();
				AttrVO attrVO = attrupd.getOneAttr(attrID);
				
				System.out.println(attrVO.getName());
				req.setAttribute("attrVO", attrVO);
				
				RequestDispatcher view = req.getRequestDispatcher("/attractions/show_one.jsp");
				view.forward(req,resp);
			
				
			} catch (NumberFormatException e) {
				
				e.printStackTrace();
			}
		}
		

	}
	
	
	

}
