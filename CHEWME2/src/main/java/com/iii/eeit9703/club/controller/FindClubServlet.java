package com.iii.eeit9703.club.controller;

import java.io.IOException;
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
import com.iii.eeit9703.club.model.hibernate.club.ClubHibernateDAO;

@WebServlet("/club/findClub.do")
public class FindClubServlet extends HttpServlet {
	
/*	ClubService cs;
	
	public void inti() throws ServletException{
		cs= new ClubService();
	}*/

	
	public void inti() throws ServletException{

	}
		
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		
		System.out.println("In to the findClub.do");
		request.setCharacterEncoding("UTF-8");

		
		HttpSession session = request.getSession(false);
		if (session != null) {      // 使用逾時
			session = request.getSession();
		}
//		if(request.getParameter("club") != null){
//			System.out.println(request.getParameter("club"));
//			response.sendRedirect("findClub.jsp");
//			return;
//		}
		
		
		/*開始執行hibernate DAO存取資料*/
		ClubService cs =  new ClubService();
		List<ClubVO> clubList;
		clubList = cs.getAll();		
		session.setAttribute("club_list", clubList);		
		response.sendRedirect("findClub.jsp");
		
/*		RequestDispatcher rd = request.getRequestDispatcher("findClub.jsp");
		rd.forward(request, response);
*/		return;
				
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
