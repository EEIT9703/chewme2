package com.iii.eeit9703.club.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iii.eeit9703.club.model.ClubService;
import com.iii.eeit9703.club.model.ClubVO;

@WebServlet("/club/findClub.do")
public class FindClubServlet extends HttpServlet {
	
	ClubService cs;
	
	public void inti() throws ServletException{
		cs= new ClubService();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		System.out.println(request.getParameter("example"));
		request.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession(false);
		if (session != null) {      // 使用逾時
		
		}
/*		List<ClubVO> clubList = new ArrayList();
		clubList = cs.getAll();
		request.setAttribute("club_list", clubList);
		System.out.println(clubList);*/
		RequestDispatcher rd = request.getRequestDispatcher("/club/findClub.jsp");
		rd.forward(request, response);
				
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
