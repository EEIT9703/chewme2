package com.iii.eeit9703.club.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iii.eeit9703.club.model.ClubService;
import com.iii.eeit9703.club.model.ClubVO;


@WebServlet("/club/clubClientView.do")
public class ClubClientViewServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		request.setCharacterEncoding("UTF-8");		
		String name = request.getParameter("clubId");
		System.out.println(request.getParameter("club"));
		ClubService cs = new ClubService();
		ClubVO clubVO = cs.getOneClub(Integer.parseInt(request.getParameter("club")));
		System.out.println(clubVO.getClubName());
		
		response.sendRedirect("clubClientViewFrame.jsp");
		return;
		
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
