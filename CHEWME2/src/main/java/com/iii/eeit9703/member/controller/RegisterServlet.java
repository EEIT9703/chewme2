package com.iii.eeit9703.member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.iii.eeit9703.member.model.MemDAO;
import com.iii.eeit9703.member.model.MemVO;

public class RegisterServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getAll".equals(action)) {
			MemDAO dao = new MemDAO();
			List<MemVO> list = dao.getAll();

			HttpSession session = req.getSession();
			session.setAttribute("list", list);

			String url = "";// 連結到註冊用jsp的路徑
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			return;
		}
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String memberId = req.getParameter("memberId");
				if (memberId == null && memberId.trim().length() == 0) {
					errorMsgs.add("帳號欄位必須輸入");
				}
				
				String mname = req.getParameter("mname");
				if (mname == null && mname.trim().length() == 0) {
					errorMsgs.add("姓名欄位必須輸入");
				}
				String mnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!mname.trim().matches(mnameReg)) {
					errorMsgs.add("員工姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}
				String mnickn=req.getParameter("mnickn");
				if(mnickn==null&&mnickn.trim().length()==0){
					errorMsgs.add("暱稱欄位必須輸入");
				}
				
			} catch (Exception e){
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("");
				failureView.forward(req, res);
			}
		}
	}

}
