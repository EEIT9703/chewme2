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

import com.iii.eeit9703.actEditor.model.ScheduleDAO_JDBC;
import com.iii.eeit9703.actEditor.model.ScheduleVO;
import com.iii.eeit9703.activity.model.ActivityVO;



/**
 * Servlet implementation class AreaServlet
 */
@WebServlet("/Calendar.do")
public class CalendarServlet extends HttpServlet {
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
			String actName = null;
					
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
					
			if("insertACT".equals(mission)){
				actName = request.getParameter("actName");
				System.out.println(actName);
				ScheduleDAO_JDBC scheduledao = new ScheduleDAO_JDBC();
				Integer actID = scheduledao.insertACT(actName);
				System.out.println(actID);
				
				out.println(actID);
				
			}
			
			if("insertSCH".equals(mission)){
				String events = request.getParameter("events");
				System.out.println(events);

				JSONArray eventsArray = new JSONArray(events);
				ScheduleDAO_JDBC scheduledao = new ScheduleDAO_JDBC();
				ScheduleVO scheduleVO = new ScheduleVO();
				Integer scheduleID = null;
				for(int i=0;i<eventsArray.length();i++){
					JSONObject object = eventsArray.getJSONObject(i);
					Integer attractionID = Integer.valueOf(object.getString("attractionID"));
					Integer dayNo = Integer.valueOf(object.getString("dayNo"));
					String period = object.getString("period");
					
					scheduleVO.setAttractionID(attractionID);
					scheduleVO.setDayNo(dayNo);
					scheduleVO.setPeriod(period);
					
					scheduledao.insertSCH(scheduleVO);
				}				
				
				scheduleID = scheduledao.selectSCH(scheduleVO.getAttractionID());
				out.print(scheduleID);				
				
			}
			
			if("updateSCH".equals(mission)){
				String events = request.getParameter("events");
				System.out.println(events);
				
				JSONArray eventsArray = new JSONArray(events);
				ScheduleDAO_JDBC scheduledao = new ScheduleDAO_JDBC();
				ScheduleVO scheduleVO = new ScheduleVO();
				for(int i=0;i<eventsArray.length();i++){
					JSONObject object = eventsArray.getJSONObject(i);
					Integer attractionID = Integer.valueOf(object.getString("attractionID"));
					String period = object.getString("period");
					
					scheduleVO.setAttractionID(attractionID);
					scheduleVO.setPeriod(period);
					
					scheduledao.updateSCH(scheduleVO);
				}
				
				System.out.println("update success~");				
				
			}
			
			if ("updateSCH2".equals(mission)) {

				String actID = new String(request.getParameter("actID").trim().replaceAll("\"", ""));
				Integer schID = Integer.parseInt(request.getParameter("schID"));
				System.out.println(actID + ";" + schID);
				ScheduleDAO_JDBC scheduledao = new ScheduleDAO_JDBC();
				scheduledao.updateSCH2(actID, schID);

			}
			
			if ("deleteSCH".equals(mission)) {

				//String eventID = new String(request.getParameter("eventID").trim().replaceAll("\"", ""));
				Integer attrID = Integer.parseInt(request.getParameter("eventID"));
				System.out.println("delete："+ attrID);
				ScheduleDAO_JDBC scheduledao = new ScheduleDAO_JDBC();
				scheduledao.deleteSCH(attrID);

			}
			
			if ("deleteAll".equals(mission)) {

				String eventID = new String(request.getParameter("eventID").trim().replaceAll("\"", ""));
				Integer schID = Integer.parseInt(eventID);
				System.out.println("delete："+ schID);
				ScheduleDAO_JDBC scheduledao = new ScheduleDAO_JDBC();
				scheduledao.deleteAll(schID);

			}
			
			if ("goPass".equals(mission)) {
				String url = "/actEditor/schedule.jsp";
				String actID = new String(request.getParameter("activityID").trim());
				request.setAttribute("actID", actID);
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);

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