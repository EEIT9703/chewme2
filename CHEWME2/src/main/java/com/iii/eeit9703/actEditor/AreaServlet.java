package com.iii.eeit9703.actEditor;

import java.io.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import org.json.JSONArray;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.adphoto.model.*;



/**
 * Servlet implementation class AreaServlet
 */
@WebServlet("/AreaServlet.do")
public class AreaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String mission = request.getParameter("mission");
			request.setCharacterEncoding("UTF-8");
			String countryID = null;
			Integer countyID = null;
			String actName = null;
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			
			if("getCountry".equals(mission)){
				countryID = request.getParameter("country");
				CountyDAO countydao = new CountyDAO();
				ArrayList<CountyVO> countyList = countydao.getCounty(countryID);
				
				JSONArray countyArrayList = new JSONArray(countyList);
//				System.out.print(countyArrayList);
				out.print(countyArrayList.toString());
				
				}
			
			if("getCountryAttr".equals(mission)){
				countryID = request.getParameter("country");
				
				System.out.println(countryID);
				AttrDAO attrdao = new AttrDAO();
				ArrayList<AttrVO> attrList = attrdao.getAttrByCountry(countryID);
				
				JSONArray attrArrayList = new JSONArray(attrList);
//				System.out.println(attrArrayList);
				out.print(attrArrayList.toString());
				
				}
			
			if("getCounty".equals(mission)){
				countyID =  Integer.parseInt(request.getParameter("county"));
				System.out.println(countyID);
				AttrDAO attrdao = new AttrDAO();
				ArrayList<AttrVO> attrList = attrdao.getAttrByCounty(countyID);
				
				JSONArray attrArrayList = new JSONArray(attrList);
				System.out.println(attrArrayList);
				out.print(attrArrayList.toString());
				
				}
			
			if("insertACT".equals(mission)){
				actName = request.getParameter("actName");
				System.out.println(actName);
				ScheduleDAO scheduledao = new ScheduleDAO();
				ArrayList<ActivityVO> newACT = scheduledao.insertACT(actName);
				System.out.println(newACT);
				
				
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}