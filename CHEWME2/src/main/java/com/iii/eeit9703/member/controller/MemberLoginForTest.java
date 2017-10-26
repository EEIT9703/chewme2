package com.iii.eeit9703.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iii.eeit9703.member.model.MemService;
import com.iii.eeit9703.member.model.MemVO;

@WebServlet("/member/memberLogin.do")
public class MemberLoginForTest extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("get request");
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Integer memId = Integer.parseInt((String)session.getAttribute("memberId"));
		MemService ms = new MemService();
		MemVO memVO = ms.getOneMem(memId);
		System.out.println("MemVO "+ memVO.getMemId() +" has logined");
		session.setAttribute("LoginOK", memVO);
		System.out.println(session.getAttribute("requestURI"));
		res.sendRedirect((String)session.getAttribute("requestURI"));
		session.removeAttribute("requestURI");
		return;
	}
}
