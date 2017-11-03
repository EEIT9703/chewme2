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
  

  
/** 
 * 发送重设密码申请的链接 
 */  
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
        	req.getRequestDispatcher("/member/forgotPwd.jsp").forward(req, res);  
            return;  
        }  
          
        // 发送重新设置密码的链接  
        EmailUtils.sendResetPasswordEmail(mv);  
          
        req.setAttribute("sendMailMsg", "您的申请已提交成功，请查看您的"+mv.getMemMail()+"邮箱。");  
          
        req.getRequestDispatcher("/member/resetpwd.jsp").forward(req, res);  
    }  
  
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {  
        doGet(req, res);  
    }  
}  