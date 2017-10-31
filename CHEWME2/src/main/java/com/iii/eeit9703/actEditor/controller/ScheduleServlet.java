package com.iii.eeit9703.actEditor.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.iii.eeit9703.actEditor.model.ActivityDAO;
import com.iii.eeit9703.actEditor.model.AttrVO;
import com.iii.eeit9703.actEditor.model.ScheduleDAO;
import com.iii.eeit9703.actEditor.model.ScheduleVO;



/**
 * Servlet implementation class AreaServlet
 */
@WebServlet("/Schedule.do")
public class ScheduleServlet extends HttpServlet {
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
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
		try {
			String mission = request.getParameter("mission");
			request.setCharacterEncoding("UTF-8");
			String countryID = null;
			Integer countyID = null;
			String actIDs = null;
					
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
					
			if("getActName".equals(mission)){
				actIDs = new String(request.getParameter("actID").trim().replaceAll("\"", ""));
				Integer actID = Integer.parseInt(actIDs);
				System.out.println("getActName："+actID);
				ActivityDAO activitydao = new ActivityDAO();
//				ScheduleVO scheduleVO = new ScheduleVO();
//				AttrVO attrVO = new AttrVO();
				
				String actName = activitydao.getActName(actID);
				System.out.println(actName);
				out.println(actName);
				
			}
			
			if("getTrip".equals(mission)){
				actIDs = new String(request.getParameter("actID").trim().replaceAll("\"", ""));
				Integer actID = Integer.parseInt(actIDs);
				System.out.println("getTrip："+actID);
				
				ActivityDAO activitydao = new ActivityDAO();
				ScheduleVO scheduleVO = new ScheduleVO();
				AttrVO attrVO = new AttrVO();
				
				ArrayList<AttrVO>tripList = activitydao.getTrip(actID);
				JSONArray JSONtripList = new JSONArray(tripList);
				System.out.println(JSONtripList);
				out.print(JSONtripList.toString());

				
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