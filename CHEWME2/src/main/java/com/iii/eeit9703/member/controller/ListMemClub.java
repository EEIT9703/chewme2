package com.iii.eeit9703.member.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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

//import org.json.simple.JSONObject;
//import org.json.simple.JSONArray;
import org.json.simple.JSONValue;

import com.sun.swing.internal.plaf.metal.resources.metal;

import java.util.List;
import java.util.HashMap;
import java.util.LinkedList; 
import java.util.Map;
/**
 * Servlet implementation class Products
 */
@WebServlet("/ListMemClub")
public class ListMemClub extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataSource ds = null;
	static {//系統load進來時就做一次,且只做一次,除非系統關閉,否則一直存在
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

    public ListMemClub() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		String query = "SELECT cm.clubId,c.clubName FROM club_member_list cm JOIN clubs c ON cm.clubID=c.clubID  and  cm.memId=?";
		int memId = Integer.parseInt(request.getParameter("memId"));
		try{
			conn = ds.getConnection();
					
			stmt = conn.prepareStatement(query);
			 stmt.setInt(1,memId);
			 rs = stmt.executeQuery();
			
			 
			 
			 List  l1 = new LinkedList();
			 while (rs.next()) {
				 Map m1 = new HashMap();       
				 m1.put("clubId",rs.getInt(1));   
				 m1.put("clubName", rs.getString(2)); 
				 l1.add(m1);
			 }
			
			 String jsonString = JSONValue.toJSONString(l1);  
			 out.println(jsonString);
		}catch (SQLException e) {
			out.println("Error:" + e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
