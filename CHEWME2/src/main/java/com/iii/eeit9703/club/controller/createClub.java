package com.iii.eeit9703.club.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iii.eeit9703.club.model.ClubService;
import com.iii.eeit9703.club.model.ClubVO;

@WebServlet("/club/createClub.do")
public class createClub extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doService(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doService(request, response);
	}

	protected void doService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession(false);
		if (session != null) { // 使用逾時
			session = request.getSession();
		}
		if (session.getAttribute("LoginOK") == null) {
			// AutoLogin.memberLogin(request, response, session, 1);
			// return;
		}
		System.out.println("getin");
		if (action.matches("create_club")) {
			ClubVO clubVO = new ClubVO();
			/*clubVO.setClubId(Integer.parseInt((String)request.getAttribute("clubId")));
			clubVO.setClubName((String)request.getAttribute("clubName"));
			clubVO.setManagerId(1);
			clubVO.setLocationId(Integer.parseInt((String)request.getAttribute("clubName")));
			clubVO.setBrief((String)request.getAttribute("brief"));
			clubVO.setRefURL((String)request.getAttribute("refURL"));
			clubVO.setAddr((String)request.getAttribute("addr"));
			clubVO.setClubPic((String)request.getAttribute("clubPic"));
			*/
			
			System.out.println(request.getAttribute("uploadImage"));
			clubVO.setClubId(8);
			clubVO.setClubName("");
			clubVO.setManagerId(1);
			clubVO.setLocationId(1);
			clubVO.setBrief("");
			clubVO.setRefURL("");
			clubVO.setAddr("");
			clubVO.setClubPic("12321413414");
			ClubService cs =  new ClubService();
			cs.insertClub(clubVO);
			session.setAttribute("club", clubVO);
			System.out.println("deal");
			response.sendRedirect("/CHEWME2/club/ClubClientViewFrame.jsp");

		}

	}

}
