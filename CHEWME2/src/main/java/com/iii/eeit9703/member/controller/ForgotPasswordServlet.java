package com.iii.eeit9703.member.controller;  
  
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iii.eeit9703.member.model.EmailUtils;
import com.iii.eeit9703.member.model.MemService;
import com.iii.eeit9703.member.model.MemVO;  
  

@WebServlet("/member/forgetPwd.do")
public class ForgotPasswordServlet extends HttpServlet {  
      
    private static final long serialVersionUID = 1L;  
  
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter rw = res.getWriter();
        String userId=req.getParameter("userId");
    	String userMail=req.getParameter("userMail");
        MemService msvc=new MemService();
        MemVO mv = msvc.findMemIdorMail(userId,userMail);  
        if (mv == null) {  
        	rw.write("<script>alert('您信箱不存在！'); location.href='login.jsp';</script>");   
            return;  
        }  
          
        //發送重設密碼連結
        EmailUtils.sendResetPasswordEmail(mv);  
		rw.write("<script>alert('您的申請已提交成功，請查看您的"+mv.getMemMail()+"信箱。'); location.href='login.jsp';</script>");  
    }  
  
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {  
        doGet(req, res);  
    }  
}  