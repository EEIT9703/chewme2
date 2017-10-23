package com.iii.eeit9703.member.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iii.eeit9703.member.model.MemService;
import com.iii.eeit9703.member.model.MemVO;


@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action=req.getParameter("action");
		
		if("insert".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String memberId = req.getParameter("memberId");
				if (memberId == null && memberId.trim().length() == 0) {
					errorMsgs.add("帳號欄位必須輸入");
				}
				
				String mName = req.getParameter("mName");
				if (mName == null && mName.trim().length() == 0) {
					errorMsgs.add("姓名欄位必須輸入");
				}
				String mNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!mName.trim().matches(mNameReg)) {
					errorMsgs.add("姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}
				String mNickN=req.getParameter("mNickN");
				if(mNickN==null&&mNickN.trim().length()==0){
					errorMsgs.add("暱稱欄位必須輸入");
				}
				String mPwd=req.getParameter("mPwd");
				if(mPwd==null&&mPwd.trim().length()==0){
					errorMsgs.add("密碼欄位必須輸入");
				}
				java.sql.Date mBirthday=null;
				try{
					mBirthday=java.sql.Date.valueOf(req.getParameter("mBirthday"));
				}catch (IllegalArgumentException e) {
					mBirthday=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("生日欄位必須選擇");
				}
				String mMail=req.getParameter("mMail");
				if (mMail == null && mMail.trim().length() == 0) {
					errorMsgs.add("信箱欄位必須輸入");
				}
				String emailReg = "^([\\w]+)(([-\\.][\\w]+)?)*@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
				if (!mMail.trim().matches(emailReg)) {
					errorMsgs.add("信箱格式錯誤");
				}
				String mAddr=req.getParameter("mAddr");
				if (mAddr == null && mAddr.trim().length() == 0) {
					errorMsgs.add("地址欄位必須輸入");
				}
				String mPhone=req.getParameter("mPhone");
				if (mPhone == null && mPhone.trim().length() == 0) {
					errorMsgs.add("電話欄位必須輸入");
				}
				String mIntr=req.getParameter("mIntr");
				if (mIntr == null && mIntr.trim().length() == 0) {
					errorMsgs.add("自我介紹必須輸入");
				}
				MemVO memVO=new MemVO();
				memVO.setmemberId(memberId);
				memVO.setmName(mName);
				memVO.setmNickN(mNickN);
				memVO.setmPwd(mPwd);
				memVO.setmBirthday(mBirthday);
				memVO.setmMail(mMail);
				memVO.setmAddr(mAddr);
				memVO.setmPhone(mPhone);
				memVO.setmIntr(mIntr);
				 
				if(!errorMsgs.isEmpty()){
					req.setAttribute("memVO", memVO);
					RequestDispatcher failureView=req.getRequestDispatcher("/member/register.jsp");
					failureView.forward(req, res);
					return;
				}
				 MemService memSvc=new MemService();
				 memVO=memSvc.addMem(memberId,mName,mNickN,mPwd,mBirthday,mMail,mAddr,mPhone,mIntr);
				 
				 String url="";//成功後轉交的連結
				 RequestDispatcher successView=req.getRequestDispatcher(url);
				 successView.forward(req, res);
			}catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/member/register.jsp");
				failureView.forward(req, res);
			}
			
		}
	}

}
