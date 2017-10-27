package com.iii.eeit9703.actEditor;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

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
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		
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
				ScheduleDAO scheduledao = new ScheduleDAO();
				ArrayList<ActivityVO> newACT = scheduledao.insertACT(actName);
				System.out.println(newACT);
				
				ScheduleVO scheduleVO = new ScheduleVO();
				scheduledao.insertSCH(scheduleVO);
				System.out.println("insert success~");				
				
			}
			
			if("insertSCH".equals(mission)){
				String events = request.getParameter("events");
				System.out.println(events);

				JSONArray eventsArray = new JSONArray(events);
				ScheduleDAO scheduledao = new ScheduleDAO();
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
				ScheduleDAO scheduledao = new ScheduleDAO();
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

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}