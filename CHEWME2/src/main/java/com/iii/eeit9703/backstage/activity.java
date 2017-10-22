package com.iii.eeit9703.backstage;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.iii.eeit9703.activity.model.ActivityDAO;
import com.iii.eeit9703.activity.model.ActivityVO;



/**
 * Servlet implementation class AreaServlet
 */
@WebServlet("accttt")
public class activity extends HttpServlet {
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
			String action = request.getParameter("action");
			request.setCharacterEncoding("UTF-8");
			String countryID = null;
			Integer countyID = null;
			System.out.println("Aaa");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			
			if("getall".equals(action)){
			//	countryID = request.getParameter("country");
				ActivityDAO dao = new ActivityDAO();
				
				List<ActivityVO> list = dao.getAll();
				//ArrayList<ActivityVO> ActivityList = (ArrayList<ActivityVO>) dao.getAll();			
			
				JSONArray List = new JSONArray(list);
//				System.out.print(countyArrayList);
				out.print(List.toString());
				}
			
			
/*			HttpSession session = request.getSession();
			session.setAttribute("countyList", countyList);
			
			String url = "Success.jsp";
			RequestDispatcher success = request.getRequestDispatcher(url);
			success.forward(request, response);
			return;
*/			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}