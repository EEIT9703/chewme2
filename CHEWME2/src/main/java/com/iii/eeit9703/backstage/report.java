package com.iii.eeit9703.backstage;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.report.ReportDAO_hibernate;
import com.iii.eeit9703.report.ReportVO;

/**
 * Servlet implementation class activity
 */
@WebServlet("/report")
public class report extends HttpServlet {
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
			String text = request.getParameter("text");
			String id = request.getParameter("id");
			
			request.setCharacterEncoding("UTF-8");		
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			ActivityVO activityVO= new ActivityVO();
			MemVO memVO=new MemVO();
			
			Integer a=3;
			Integer b=3;
			activityVO.setActID(a);
			memVO.setMemId(b);
			
			System.out.println(text);
			System.out.println(id);

			 	 
//			 SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			 Calendar tmpCal = Calendar.getInstance();
//			 String strDate = sdFormat.format(tmpCal.getTime());
//			 System.out.println(strDate);
			
		//	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date=new Date(System.currentTimeMillis());
		
			//java.util.Date date = new java.util.Date(Long.MAX_VALUE);

			
			//Timestamp date=new Timestamp(System.currentTimeMillis());
			System.out.println(date);
			
			ReportVO reportVO=new ReportVO();
			//???	reportVO.setActivityVO(activityVO);
			reportVO.setActivityVO(activityVO);
			reportVO.setMemVO(memVO);
			reportVO.setReportTime(date);
			reportVO.setReportContext(text);			
		
			ReportDAO_hibernate dao =new ReportDAO_hibernate();
			dao.insert(reportVO);
		
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

}
}
