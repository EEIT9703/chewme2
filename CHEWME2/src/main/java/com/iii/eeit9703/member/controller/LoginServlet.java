package com.iii.eeit9703.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import com.iii.eeit9703.member.model.MemService;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.member.model.MemberSession;
import com.iii.eeit9703.member.model.VerifyRecaptcha;

@WebServlet("/member/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter rw = res.getWriter();
		HttpSession session = req.getSession();
		Map<String, String> errorMsgMap = new HashMap<String, String>();// 準備存放錯誤訊息的Map物件

		req.setAttribute("ErrorMsgKey", errorMsgMap);// 將errorMsgMap放入requset物件內,識別字串為ErrorMsgKey
		String userId = req.getParameter("userId");
		String password = req.getParameter("pswd");
//		String gRecaptchaResponse = req.getParameter("g-recaptcha-response");
		String rm = req.getParameter("rememberMe");
		String requestURI = (String) session.getAttribute("requestURI");

		if (userId == null || userId.trim().length() == 0) {
			errorMsgMap.put("AccountisEmpty", "帳號欄位必須輸入");// 如果帳號空白就放錯誤訊息到errorMsgMap裡
		}
		if (password == null || password.trim().length() == 0) {
			errorMsgMap.put("PasswordisEmpty", "密碼欄位必須輸入");// 如果密碼空白就放錯誤訊息到errorMsgMap裡
		}
//		if (gRecaptchaResponse == null || gRecaptchaResponse.trim().length() == 0) {
//			errorMsgMap.put("RecaptchaisEmpty", "請進行驗證");
//		}
//		boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
		 //Remember ME記住密碼cookie
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		
		if (rm != null) { // rm存放瀏覽器送來之RememberMe的選項
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(30 * 60 * 60);
			cookieUser.setPath(req.getContextPath());
			// 稍微編碼(不算是加密)
			String encodePassword = DatatypeConverter.printBase64Binary(password.getBytes());
			// String encodePassword = GlobalService.encryptString(password);
			System.out.println("--->" + encodePassword + "<---");
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(30 * 60 * 60);
			cookiePassword.setPath(req.getContextPath());
			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(30 * 60 * 60);
			cookieRememberMe.setPath(req.getContextPath());
		} else {
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUser.setPath(req.getContextPath());
			String encodePassword = DatatypeConverter.printBase64Binary(password.getBytes());
			// String encodePassword = GlobalService.encryptString(password);
			System.out.println("--->" + encodePassword + "<---");
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(req.getContextPath());
			cookieRememberMe = new Cookie("rm", "false");
			cookieRememberMe.setMaxAge(30 * 60 * 60);
			cookieRememberMe.setPath(req.getContextPath());
		}
		res.addCookie(cookieUser);
		res.addCookie(cookiePassword);
		res.addCookie(cookieRememberMe);

		// ********************************************
		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給login.jsp
		if (!errorMsgMap.isEmpty()){// && !verify) {
			rw.write("<script>alert('您的帳號或密碼錯誤！'); history.go(-1);</script>");   
            return;  
		}
		// 4. 進行 Business Logic 運算
		// 將LoginServiceDB類別new為物件，存放物件參考的變數為 lsdb
		MemService memSvc;
		memSvc = new MemService();
		// 呼叫 ms物件的 checkIDPassword()，要記得傳入userid與password兩個參數
		MemVO mv = memSvc.checkIDPassword(userId, password);
		if (mv != null ) {
			MemberSession ms = new MemberSession(mv);
			// OK, 將mv物件放入Session範圍內，識別字串為"LoginOK"
			Set<Integer> record =new LinkedHashSet<Integer>();
			session.setAttribute("LoginOK", mv);
			session.setAttribute("LoginOK_MS",ms);
			session.setAttribute("record", record);
			System.out.println(mv.getMemRole());
			if (mv.getMemRole().trim().equals("系統管理員")) {
				session.setAttribute("SysManager", mv);
			}
		} else {
			// NG, userid與密碼的組合錯誤，放一個錯誤訊息到 errorMsgMap 之內
			errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
		}

		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsgMap.isEmpty()){ //&& verify) {
			// 此時不要用下面兩個敘述，因為網址列的URL不會改變
			// reqDispatcher rd = req.getreqDispatcher("...");
			// rd.forward(req, res);
			if (requestURI != null) {
				requestURI = (requestURI.length() == 0 ? req.getContextPath() : requestURI);
				res.sendRedirect(res.encodeRedirectURL(requestURI));
				return;
			} else {
				res.sendRedirect(res.encodeRedirectURL(req.getContextPath()));
				return;
			}
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
			rw.write("<script>alert('您的帳號或密碼錯誤！'); history.go(-1);</script>");   
            return; 
		}

	}

}
