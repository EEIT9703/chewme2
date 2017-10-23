package com.iii.eeit9703.activity.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.iii.eeit9703.activity.model.ActService;
import com.iii.eeit9703.activity.model.ActivityDAO;
import com.iii.eeit9703.activity.model.ActivityVO;


@WebServlet("/activityServlet.do")
public class ActivityServlet extends HttpServlet {
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
		String action = req.getParameter("action");
		PrintWriter out = resp.getWriter();
		
		
		
		
		try {
			
			if("getActID".equals(action)){
				String actID = req.getParameter("actID");
				ActivityDAO activitydao = new ActivityDAO();
				
				ArrayList<ActivityVO> actList = activitydao.getActId(actID);
				out.print(actList.toString());						
			}
			
			if("update".equals(action)){
				
				Integer actID = new Integer(req.getParameter("actID"));
				String act_name = req.getParameter("act_name");
				Integer act_groups = new Integer(req.getParameter("act_groups"));
				Integer act_current = new Integer(req.getParameter("act_current"));
				java.sql.Date BDate = null;
				BDate = java.sql.Date.valueOf(req.getParameter("BDate"));
				java.sql.Date EDate = null;
				EDate = java.sql.Date.valueOf(req.getParameter("EDate"));
				Integer activity_state = new Integer(req.getParameter("activity_state"));
				Integer collectID = new Integer(req.getParameter("collectID"));
				
				ActService actSvc = new ActService();
				ActivityVO activityVO = actSvc.updateAct(actID, act_name, act_groups, act_current, BDate, EDate, activity_state, collectID);
				
				req.setAttribute("activityVO", activityVO);
				String url = "/act/createAct.jsp";
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

			
			
			
		}
			
			
			
	}


