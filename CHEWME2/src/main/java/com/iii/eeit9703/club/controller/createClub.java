package com.iii.eeit9703.club.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.Enumeration;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import com.iii.eeit9703.club.model.ClubVO;

@WebServlet("/club/createClub.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 500)
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

		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String action = request.getParameter("action");
		// Part part = request.getPart("image");
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
			/*
			 * clubVO.setClubId(Integer.parseInt((String)request.getAttribute(
			 * "clubId")));
			 * clubVO.setClubName((String)request.getAttribute("clubName"));
			 * clubVO.setManagerId(1);
			 * clubVO.setLocationId(Integer.parseInt((String)request.
			 * getAttribute("clubName")));
			 * clubVO.setBrief((String)request.getAttribute("brief"));
			 * clubVO.setRefURL((String)request.getAttribute("refURL"));
			 * clubVO.setAddr((String)request.getAttribute("addr"));
			 * clubVO.setClubPic((String)request.getAttribute("clubPic"));
			 */
			Iterator<Part> iter = request.getParts().iterator();
			for (int i = 0; iter.hasNext();) {
				System.out.println(iter.next().getName());

			}

			Enumeration<String> iter2 = request.getParameterNames();
			for (String i; iter2.hasMoreElements();) {
				System.out.println(iter2.nextElement());
			}
			String description = request.getParameter("clubName"); // Retrieves
																		// <input
																		// type="text"
																		// name="description">
			Part filePart = request.getPart("uploadImage"); // Retrieves <input
														// type="file"
														// name="file">
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE
			InputStream fileContent = filePart.getInputStream();
			int len = 10;
			byte[] buffer = new byte[len];
			int readNum = 0;
			while (readNum >= 0) {
				try {
					readNum = fileContent.read(buffer, 0, len);
					//fos2.write(buffer, 0, len);
					
					System.out.print(readNum + " : ");
					System.out.println(new String(buffer,"UTf-8"));
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
			
			
			
			
			//List<Part> fileParts = request.getParts().stream().filter()
//			List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList());
			// Retrieves <input type="file" name="file" multiple="true">

//		    for (Part filePart : fileParts) {
//		        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//		        InputStream fileContent = filePart.getInputStream();
//		        // ... (do your job here)
//		    }
			
			
			
			System.out.println(request.getPart("clubName"));
			System.out.println(request.getParameter("clubName"));
			System.out.println(request.getPart("uploadImage").toString());
			clubVO.setManagerId(2);
			clubVO.setBrief(request.getParameter("brief"));
			clubVO.setRefURL(request.getParameter("url"));
			clubVO.setAddr(request.getParameter("address"));
			// clubVO.setClubPic(request.getPart("uploadImage"));
			// ClubService cs = new ClubService();
			// cs.insertClub(clubVO);
			// session.setAttribute("club", clubVO);
			System.out.println("deal");
			// response.sendRedirect("/CHEWME2/club/ClubClientViewFrame.jsp");
		}

	}

}
