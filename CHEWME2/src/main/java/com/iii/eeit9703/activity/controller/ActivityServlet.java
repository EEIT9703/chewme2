package com.iii.eeit9703.activity.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.*;
import org.json.simple.JSONValue;

import com.iii.eeit9703.activity.model.ActService;
import com.iii.eeit9703.activity.model.ActivityDAO;
import com.iii.eeit9703.activity.model.ActivityVO;

@MultipartConfig(
location="",
maxRequestSize=1024*1024*1024,
fileSizeThreshold=1024*1024*1024,
maxFileSize=1024*1024*1024
)

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
		
		HttpSession session = req.getSession();
		
		//選擇行程
		if("getOne_For_Update".equals(action)){
			
			List<String>errorMsgs = new LinkedList<String>();
			req.setAttribute("error", errorMsgs);

			try {
				//1.接收請求	
				Integer actID = new Integer(req.getParameter("actID")); 
				System.out.println(actID);
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
			
			
			System.out.println(req.getParameter("actID"));
			
			Map<String, String> error = new HashMap<String, String>();			
			req.setAttribute("error", error);			
			
			try {
				//1.接收請求 createAct.jsp							
				
				Integer actID = new Integer(req.getParameter("actID"));
				
				String act_name = req.getParameter("act_name");
				System.out.println(act_name);
				if(act_name == null||act_name.trim().length() == 0){
					error.put("errorName","旅遊名稱必須輸入");
							
				}				
				
				String act_groups = req.getParameter("act_groups");
				if(act_groups == null ||act_groups.trim().length() == 0){
					error.put("errorGroups","旅遊人數必須輸入");
				}
				String act_groupsReg ="^[(0-9_)]$";
				if(!act_groups.trim().matches(act_groupsReg)){
					error.put("errorGroups2","旅遊人數只能為數字");
				}
				
				java.sql.Date BDate = null;
				try {
					BDate = java.sql.Date.valueOf(req.getParameter("BDate").trim());
				} catch (Exception e) {
					error.put("errorBDate","請選擇出發日期");
					e.printStackTrace();
				}
				
				java.sql.Date EDate = null;				
				try {
					EDate = java.sql.Date.valueOf(req.getParameter("EDate"));
				} catch (Exception e) {
					error.put("errorMsgEDate","請選擇結束日期");
					e.printStackTrace();
				}
				
				Integer activity_state = new Integer(req.getParameter("activity_state"));
				
				InputStream inputStream = null;
				ByteArrayOutputStream bos = null;

				//取得圖片
				Part act_photo = req.getPart("upload");
				if(act_photo != null){										
					error.put("errorPhoto","請選擇一張圖片");
				}
				
				System.out.println(act_photo.getContentType());
				System.out.println(act_photo.getSize());
				System.out.println(act_photo.getName());
				
				//二進制轉64
				inputStream = act_photo.getInputStream();
				int len;
				int size = 1024;
				byte[] buf;
				
				bos = new ByteArrayOutputStream();
				buf = new byte[size];
				
				while ((len = inputStream.read(buf, 0, size)) != -1)
					bos.write(buf, 0, len);
				
				buf = bos.toByteArray();
				String base64 = Base64.getEncoder().encodeToString(buf);
				
				System.out.println(base64);
				System.out.println("HELLO");
				
//			    Integer actID =new Integer(req.getParameter("actID").trim());
				
				ActivityVO activityVO = new ActivityVO();
					
				activityVO.setAct_name(act_name);
				activityVO.setAct_groups(act_groups);
				activityVO.setBDate(BDate);
				activityVO.setEDate(EDate);
				activityVO.setActivity_state(activity_state);
				activityVO.setActID(actID);
				activityVO.setAct_photo(base64);

				if(!error.isEmpty()){
					req.setAttribute("activityVO", activityVO); //含有輸入錯誤的activityVO 也存入req
					RequestDispatcher failureView =req.getRequestDispatcher("/act/createAct2.jsp");
					failureView.forward(req, resp);
					System.out.println("test");
					return;
				}
				
				//2.開始修改資料 呼叫工頭 ActService.java
				ActService actSvc = new ActService();
				actSvc.updateAct(activityVO);
				
				//修改完成  準備轉交
				req.setAttribute("activityVO", activityVO);  //資料庫update成功後 正確的activityVO 存入req
				String url = "/act/createAct2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, 
						resp);
				
			} catch (Exception e) {

				error.put("修改資料失敗",e.getMessage());
				RequestDispatcher failureView =req.getRequestDispatcher("/act/createAct2.jsp");
				failureView.forward(req, resp);
				e.printStackTrace();
		}
			
			
			
		}
			
			
			
	}

}