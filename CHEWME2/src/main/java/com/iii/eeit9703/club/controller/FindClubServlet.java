package com.iii.eeit9703.club.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iii.eeit9703.club.model.ClubService;

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
/*		List<ClubVO> clubList;
		clubList = cs.getAll();
		for (ClubVO aClub : clubList) {
			System.out.print(aClub.getClubId() + ",");
			System.out.print(aClub.getClubName() + ",");
			System.out.print(aClub.getManagerId() + ",");
			System.out.print(aClub.getLocationId() + ",");
			System.out.print(aClub.getBrief() + ",");
			System.out.print(aClub.getRefURL() + ",");
			System.out.print(aClub.getVistors() + ",");
			System.out.print(aClub.getVistorsInMonth() + ",");
			System.out.println(aClub.getAddr() + ",");
		}*/
	/*	request.setAttribute("club_list", clubList);*/
		RequestDispatcher rd = request.getRequestDispatcher("/club/findClub.jsp");
		response.sendRedirect("findClub.jsp");
		/*rd.forward(request, response);*/
				
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
