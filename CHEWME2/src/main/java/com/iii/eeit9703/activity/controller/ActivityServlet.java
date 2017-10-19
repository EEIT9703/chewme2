package com.iii.eeit9703.activity.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iii.eeit9703.activity.model.ActService;
import com.iii.eeit9703.activity.model.ActivityVO;


@WebServlet("/activityServlet")
public class ActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@SuppressWarnings("unused")
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		//新增活動
		if("insert".equals(action)){  //來自XXX.jsp的請求
				
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			//尚未寫判斷
			try {
				String act_name = req.getParameter("act_name");
				
				Integer act_groups = new Integer(req.getParameter("act_groups"));
				
				Integer act_current = new Integer(req.getParameter("act_current"));
				
				java.sql.Date BDate = null;
				BDate = java.sql.Date.valueOf(req.getParameter("BDate"));
				
				java.sql.Date EDate = null;
				EDate = java.sql.Date.valueOf(req.getParameter("EDate"));
				
				Integer activity_state = new Integer(req.getParameter("activity_state"));
				
				ActivityVO activityVO = new ActivityVO();
				activityVO.setAct_name(act_name);
				activityVO.setAct_groups(act_groups);
				activityVO.setAct_current(act_current);
				activityVO.setActivity_state(activity_state);
				
				req.setAttribute("activityVO", activityVO);
				ActService act =new ActService();
				activityVO = act.addAct(act_name, act_groups, act_current, BDate, EDate, activity_state);
				
				RequestDispatcher view = req.getRequestDispatcher("XXX.jsp");
				view.forward(req, resp);
			} catch (NumberFormatException e) {
				RequestDispatcher failure = req.getRequestDispatcher("xxx.jsp");
				e.printStackTrace();
			}
		}
		
		//活動上架
		if("update".equals(action)){  //來自update_act_input.jsp 請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			Integer actID = new Integer(req.getParameter("actID").trim());
		}
		
	}

}
