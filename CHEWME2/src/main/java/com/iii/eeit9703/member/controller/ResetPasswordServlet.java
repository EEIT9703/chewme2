package com.iii.eeit9703.member.controller;
 

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iii.eeit9703.member.model.GenerateLinkUtils;
import com.iii.eeit9703.member.model.MemService;
import com.iii.eeit9703.member.model.MemVO;  
  
  
/** 
 * 重新设置密码 
 */  
@WebServlet("/member/resetPassword.do")
public class ResetPasswordServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
         
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	String userName = request.getParameter("userName");  
        String newPassword = request.getParameter("newPassword");  
        String newPassword2 = request.getParameter("newPassword2");  
        Map<String,String> errors = new HashMap<String, String>();
        if (newPassword == null || "".equals(newPassword)) {  
            errors.put("newPassword", "新密碼不能為空");  
        }  
          
        if (newPassword2 == null || "".equals(newPassword2)) {  
            errors.put("newPassword2", "請確認新密碼");  
        }  
          
        if (!newPassword.equals(newPassword2)) {  
            errors.put("passwordError", "密碼不一致");  
        }  
          
        if (!errors.isEmpty()) {  
            request.setAttribute("errors", errors);  
            request.getRequestDispatcher("/member/resetpwd.jsp?userName=" + userName).forward(request, response);  
            return;  
        }  
           
        MemService msvc=new MemService();
        msvc.updatePwd(userName,newPassword);
        
          
        request.getRequestDispatcher("/member/login.jsp").forward(request, response);  
          
    }  
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        doGet(request, response);  
    }  
}  