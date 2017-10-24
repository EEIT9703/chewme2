package com.iii.eeit9703.member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.bind.DatatypeConverter;

import com.iii.eeit9703.member.model.LoginService;
import com.iii.eeit9703.member.model.MemVO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		Map<String, String> errorMsgMap = new HashMap<String, String>();// 準備存放錯誤訊息的Map物件

		req.setAttribute("ErrorMsgKey", errorMsgMap);// 將errorMsgMap放入requset物件內,識別字串為ErrorMsgKey

		String userId = req.getParameter("userId");
		String password = req.getParameter("pswd");
		String rm = req.getParameter("rememberMe");
		String requestURI = (String) session.getAttribute("requestURI");

		if (userId == null || userId.trim().length() == 0) {
			errorMsgMap.put("AccountisEmpty", "帳號欄位必須輸入");// 如果帳號空白就放錯誤訊息到errorMsgMap裡
		}
		if (password == null || password.trim().length() == 0) {
			errorMsgMap.put("PasswordisEmpty", "密碼欄位必須輸入");// 如果密碼空白就放錯誤訊息到errorMsgMap裡
		}
		// Remember ME記住密碼cookie
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;

		if (rm != null) {
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(30 * 60 * 60);// 設置cookie最大生存期的秒數,若設置為負值,則為瀏覽器進成cookie(內存中保存),瀏覽器關閉就失效。設置為0,cookie會被刪除
			cookieUser.setPath(req.getContextPath());

			String encodePassword = DatatypeConverter.printBase64Binary(password.getBytes());// 稍為編碼(非加密)
			// String
			// encodePassword=GlobalService.encryptString(password);//透過GlobalService進行MD5的加密
			System.out.println("--->" + encodePassword + "<---");
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(req.getContextPath());
			cookieRememberMe = new Cookie("rm", "false");
			cookieRememberMe.setMaxAge(30 * 60 * 60);
			cookieRememberMe.setPath(req.getContextPath());
		}
		if (!errorMsgMap.isEmpty()) {// 如果errorMsgMap不是空的,表示有錯誤,就交給login.jsp
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, res);
			return;
		}
		// 將LoginService類別new為物件,存放物件參考的變數為ls
		LoginService ls;
		try {
			ls = new LoginService();

			MemVO mv = ls.checkIDPassword(userId, password);
			if (mv != null) {
				session.setAttribute("LoginSuccess", mv);
			} else {
				errorMsgMap.put("LoginFalse", "該帳號不存在或密碼錯誤");
			}
		} catch (NamingException e) {
			errorMsgMap.put("LoginError", "LoginServlet->NamingException:" + e.getMessage());
		} catch (SQLException e) {
			errorMsgMap.put("LoginError", "LoginServlet->SQLException:" + e.getMessage());
			e.printStackTrace();
		}
		if(errorMsgMap.isEmpty()){
			if(requestURI!=null){
				requestURI=(requestURI.length()==0?req.getContextPath():requestURI);//如果requestURI的長度為0,就執行req.getContextPath(),如果不是,則執行requestURI
				res.sendRedirect(res.encodeRedirectURL(requestURI));
				return;
			}else{
				res.sendRedirect(res.encodeRedirectURL(req.getContextPath()));
				return;
			}
		}else{
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, res);
			return;
		}

	}
}
