package com.iii.eeit9703.utility;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

// 從資料庫取圖放入JSP
@WebServlet("/getImageInChewme2.do")
public class GetImageServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("UTF-8");
		res.setHeader("content-type", "image/*;charset=UTF-8");
		res.setContentType("text/plain;charset=ISO-8859-1");
		
		String id = req.getParameter("id");
		String type = req.getParameter("type");
		System.out.println("Start to get the image where  type is "+type+" id is "+id+"! " );
		Connection conn = null;
		OutputStream os = null;
		InputStream is = null;
		ResultSet rs = null;
		String stringResult;
		PreparedStatement pstmt = null;
		try {

			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/TestDB");
			conn = ds.getConnection();
<<<<<<< HEAD
			PreparedStatement pstmt = null;
			System.out.println("select the pic");
			
=======
			pstmt = null;
>>>>>>> branch 'master' of https://github.com/EEIT9703/chewme2.git

			if (type.equalsIgnoreCase("uploadimg")) {
				pstmt = conn.prepareStatement("select image from attractions where name = ?");
			} else if (type.equalsIgnoreCase("upimg")) {
				pstmt = conn.prepareStatement("select image from attractions where attractionID = ?");
			} else if (type.equalsIgnoreCase("memPic")){
				pstmt = conn.prepareStatement("select memPhoto from  where memId = ?");				
			} else if (type.equalsIgnoreCase("clubPic")){
				pstmt = conn.prepareStatement("select photo from club_photo where clubId = ?");								
<<<<<<< HEAD
			} else if(type.equalsIgnoreCase("sch_photo")){
				pstmt = conn.prepareStatement("SELECT sch_photo FROM activity where actID = ?");
=======
			} else if(type.equalsIgnoreCase("actPic")){
				pstmt = conn.prepareStatement("select photo from club_photo where clubId = ?");
>>>>>>> branch 'master' of https://github.com/EEIT9703/chewme2.git
			}
		
			pstmt.setString(1, id);
			

			rs = pstmt.executeQuery();
			
			if (rs.next()) {

				is = rs.getBinaryStream(1);
				os = res.getOutputStream();
				if (is == null) {
					is = getServletContext().getResourceAsStream(req.getContextPath()+"/image/NoImage.png");
				}
				int count = 0;
				byte[] bytes = new byte[8192];
				
				while ((count = is.read(bytes)) != -1) {
					System.out.println(bytes);
					os.write(bytes, 0, count);
					
				}
			}
		} catch (Exception e) {
			try {
				stringResult = rs.getString(1);
				PrintWriter out = res.getWriter();
				out.write(stringResult);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (os != null) {
				os.close();
			}
		}
	}
}