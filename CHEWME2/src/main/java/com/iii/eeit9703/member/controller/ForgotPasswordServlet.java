package com.iii.eeit9703.member.controller;  
  
import java.io.IOException;

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
        String userId=req.getParameter("userId");
    	String userMail=req.getParameter("userMail");
        MemService msvc=new MemService();
        MemVO mv = msvc.findMemIdorMail(userId,userMail);  
        if (mv == null) {  
        	req.setAttribute("errorMsg","您信箱不存在！");  
        	req.getRequestDispatcher("/member/login.jsp").forward(req, res);  
            return;  
        }  
          
        //發送重設密碼連結
        EmailUtils.sendResetPasswordEmail(mv);  
          
        req.setAttribute("sendMailMsg", "您的申請已提交成功，請查看您的"+mv.getMemMail()+"信箱。");  
          
        req.getRequestDispatcher("/member/login.jsp").forward(req, res);  
    }  
  
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {  
        doGet(req, res);  
    }  
}  