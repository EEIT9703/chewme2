package com.iii.eeit9703.actEditor.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.iii.eeit9703.actEditor.model.ScheduleDAO;
import com.iii.eeit9703.actEditor.model.ScheduleVO;
import com.iii.eeit9703.member.model.MemVO;

/**
 * Servlet implementation class AreaServlet
 */
@WebServlet("/Calendar.do")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
		return;
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		String mutex = "calander";
		try {
			String mission = request.getParameter("mission");
			request.setCharacterEncoding("UTF-8");
			System.out.println("我進來囉");
			System.out.println("mission是:"+mission);
			

			HttpSession session = request.getSession();
			MemVO memVO = (MemVO) session.getAttribute("LoginOK");

			String countryID = null;
			Integer countyID = null;
			String actName = null;
			Integer memId = memVO.getMemId();
			System.out.println("我進來囉、拿到memberId了");

			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			System.out.println("我進來囉、產生printwriter了");

			//synchronized (session) {
				System.out.println("進入同步區了");
				
				if ("insertACT".equals(mission)) {
					System.out.println("我進來囉、儲存行行事曆");
					actName = request.getParameter("actName");
					System.out.println(actName);
					ScheduleDAO scheduledao = new ScheduleDAO();
					Integer actID = scheduledao.insertACT(actName, memId);
					// Integer actID = scheduledao.insertACT(actName,2);
					System.out.println(actID);

					out.println(actID);
					return;
				}

				if ("insertSCH".equals(mission)) {
					System.out.println("我進來囉、insert一個行程");
					String events = request.getParameter("events");
					System.out.println(events);

					JSONArray eventsArray = new JSONArray(events);
					ScheduleDAO scheduledao = new ScheduleDAO();
					ScheduleVO scheduleVO = new ScheduleVO();
					Integer scheduleID = null;
					for (int i = 0; i < eventsArray.length(); i++) {
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
					return;
				}

				if ("updateSCH".equals(mission)) {
					String events = request.getParameter("events");
					System.out.println(events);

					JSONArray eventsArray = new JSONArray(events);
					ScheduleDAO scheduledao = new ScheduleDAO();
					ScheduleVO scheduleVO = new ScheduleVO();
					for (int i = 0; i < eventsArray.length(); i++) {
						JSONObject object = eventsArray.getJSONObject(i);
						Integer attractionID = Integer.valueOf(object.getString("attractionID"));
						String period = object.getString("period");

						scheduleVO.setAttractionID(attractionID);
						scheduleVO.setPeriod(period);

						scheduledao.updateSCH(scheduleVO);
					}

					System.out.println("update success~");
					return;
				}

				if ("updateSCH2".equals(mission)) {

					String actID = new String(request.getParameter("actID").trim().replaceAll("\"", ""));
					Integer schID = Integer.parseInt(request.getParameter("schID"));
					System.out.println(actID + ";" + schID);
					ScheduleDAO scheduledao = new ScheduleDAO();
					scheduledao.updateSCH2(actID, schID);
					return;
				}

				if ("deleteSCH".equals(mission)) {

					// String eventID = new
					// String(request.getParameter("eventID").trim().replaceAll("\"",
					// ""));
					Integer attrID = Integer.parseInt(request.getParameter("eventID"));
					System.out.println("delete：" + attrID);
					ScheduleDAO scheduledao = new ScheduleDAO();
					scheduledao.deleteSCH(attrID);
					return;
				}

				if ("deleteAll".equals(mission)) {

					String eventID = new String(request.getParameter("eventID").trim().replaceAll("\"", ""));
					Integer schID = Integer.parseInt(eventID);
					System.out.println("delete：" + schID);
					ScheduleDAO scheduledao = new ScheduleDAO();
					scheduledao.deleteAll(schID);
					return;
				}

				if ("goPass".equals(mission)) {
					String url = "/actEditor/schedule.jsp";
					String actID = new String(request.getParameter("activityID").trim());
					request.setAttribute("actID", actID);
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
					return;
				}
			//}
				return;

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
		
	}

}