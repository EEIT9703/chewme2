package com.iii.eeit9703.activity.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;




@WebServlet("/act/schServlet")
public class ActImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String type = req.getParameter("type");
		System.out.println("Start to get the image where  type is "+type+" id is "+id+"! " );
		Connection conn = null;		
		
		try {
			
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/TestDB");
			conn = ds.getConnection();
			PreparedStatement pstmt = null ;
			
			if(type.equalsIgnoreCase("sch_photo")){
				pstmt = conn.prepareStatement("SELECT sch_photo FROM activity where actID = ?");
				
							
			}
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
