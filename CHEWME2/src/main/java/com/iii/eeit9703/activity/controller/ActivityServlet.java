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

import org.json.*;
import org.json.simple.JSONValue;

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
		resp.setCharacterEncoding("UTF-8");
		resp.setHeader("content-type", "text/html;charset=UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		
		String action = req.getParameter("action");
		PrintWriter out = resp.getWriter();

		System.out.println(action);
		
		//新增活動
/*		if("insert".equals(action)){  //來自XXX.jsp的請求
				
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
				
				req.setAttribute("activityVO", activityVO);
				ActService act =new ActService();
				activityVO = act.addAct(act_name, act_groups, act_current, BDate, EDate, activity_state);
				
				RequestDispatcher view = req.getRequestDispatcher("XXX.jsp");
				view.forward(req, resp);
			} catch (NumberFormatException e) {
				RequestDispatcher failure = req.getRequestDispatcher("xxx.jsp");
				e.printStackTrace();
			}
		}*/
		
		//選擇行程
		if("getOne_For_Update".equals(action)){
			List<String>errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				//1.接收請求	
				Integer actID = new Integer(req.getParameter("actID")); 

				//2.開始查詢資料
				ActService actSvc = new ActService();
				ActivityVO activityVO = actSvc.getOneAct(actID);
	
				JSONObject actJSON = new JSONObject(activityVO);
//				JSONArray actJSON = new JSONArray(activityVO);
				out.print(actJSON.toString());
				
				System.out.println(actJSON);			
				//處理錯誤
			} catch (NumberFormatException e) {
				errorMsgs.add("無法取得要修改的資料"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/act/createAct.jsp");
				failureView.forward(req, resp);
				e.printStackTrace();
			}
		}
		
		
		
		//活動上架
		if("Updata".equals(action)){  //來自/createActivity.jsp 請求
			
			System.out.println("XX");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收請求
				Integer actID = new Integer(req.getParameter("a"));
				System.out.println(actID);
				String act_name = req.getParameter("b");
				Integer act_groups = new Integer(req.getParameter("c"));
				Date BDate = java.sql.Date.valueOf(req.getParameter("d"));
				Date EDate = java.sql.Date.valueOf(req.getParameter("e"));
				Integer activity_state = new Integer(req.getParameter("f"));
				
				System.out.println("HELLO");
				
//			Integer actID =new Integer(req.getParameter("actID").trim());
				
//				ActivityVO activityVO = new ActivityVO();
//				
//				activityVO.setActID(actID);
//				activityVO.setAct_name(act_name);
//				activityVO.setAct_groups(act_groups);
//			
//				activityVO.setBDate(BDate);
//				activityVO.setEDate(EDate);
//				activityVO.setActivity_state(activity_state);
//				
//				if(!errorMsgs.isEmpty()){
//					req.setAttribute("activityVO", activityVO); //含有輸入錯誤的activityVO 也存入req
//					RequestDispatcher failureView =req.getRequestDispatcher("/act/createAct.jsp");
//					failureView.forward(req, resp);
//					return;
//				}
//				
//				//2.開始修改資料
//				ActService actSvc = new ActService();
//				actSvc.updateAct(act_name, act_groups, BDate, EDate, activity_state);
//				
//				//修改完成  準備轉交
//				req.setAttribute("activityVO", activityVO);  //資料庫update成功後 正確的activityVO 存入req
//				String url = "/act/createAct.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, resp);
				
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗"+e.getMessage());
				RequestDispatcher failureView =req.getRequestDispatcher("/act/createAct.jsp");
				failureView.forward(req, resp);
				e.printStackTrace();
			}
			
			
			
		}
			
			
			
	}

}