package com.iii.eeit9703.club.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.iii.eeit9703.club.model.ClubPhotoService;
import com.iii.eeit9703.club.model.ClubPhotoVO;
import com.iii.eeit9703.club.model.ClubService;
import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.member.model.MemberSession;

@WebServlet("/club/createClub.do")
@MultipartConfig(maxFileSize=1024*1024*500)
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
		if (action == null) {
			action = "";
		}
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
			ClubPhotoVO clubPhotoVO = new ClubPhotoVO();
//			// Retrieves <input  type="text" name="clubName">
//			String description = request.getParameter("clubName"); 
//			// Retrieves <input type="file" name="uploadImage">
			Part filePart = request.getPart("uploadImage"); 
//			// MSIE
//			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); 
//			InputStream fileContent = filePart.getInputStream();
//			int len = 10;
//			byte[] buffer = new byte[len];
//			int readNum = 0;
//			while (readNum >= 0) {
//				try {
//					readNum = fileContent.read(buffer, 0, len);
//					// fos2.write(buffer, 0, len);
//
//					System.out.print(readNum + " : ");
//					System.out.println(new String(buffer, "UTf-8"));
//
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
			
			System.out.println(request.getParameter("clubName"));
			System.out.println(1);
			System.out.println(Integer.parseInt("0"));
			System.out.println(request.getParameter("brief"));
			System.out.println(request.getParameter("url"));
			System.out.println(request.getParameter("address"));
			System.out.println(request.getParameter("uploadImage"));
			clubVO.setClubName(request.getParameter("clubName"));
			MemVO memVO = (MemVO)session.getAttribute("LoginOK");
			Integer managerId = memVO.getMemId();
			MemberSession ms = (MemberSession)session.getAttribute("LoginOK_MS");
			clubVO.setManagerId(managerId);
			clubVO.setLocationId(Integer.parseInt("0"));
			clubVO.setBrief(request.getParameter("brief"));
			clubVO.setRefURL(request.getParameter("url"));
			clubVO.setVistors(1);
			clubVO.setVistorsInMonth(1);
			clubVO.setAddr(request.getParameter("address"));
			//clubVO.setClubPic("");
			ClubService cs = new ClubService();
			Integer clubId = cs.insertClub(clubVO);
			ms.addOwnClubList(clubId);
			
			
			ClubPhotoService cps = new ClubPhotoService();
			clubPhotoVO.setClubId(clubId);
			clubPhotoVO.setName(request.getParameter("clubName"));
			clubPhotoVO.setPhoto(request.getPart("uploadImage").getInputStream());
			
			cps.insertPhoto(clubPhotoVO);
			
			session.setAttribute("club", clubVO);			
			System.out.println("deal");
			
			request.setAttribute("clubId",clubId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("clubClientView.do?action=chooseClub");
			dispatcher.forward(request, response);
			return;
		}
		if (action == "") {
			response.sendRedirect("/CHEWME2/club/createClub.jsp");
		}
	}

}
