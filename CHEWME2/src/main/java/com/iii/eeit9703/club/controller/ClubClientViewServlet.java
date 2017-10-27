package com.iii.eeit9703.club.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;

import com.iii.eeit9703.club.model.ClubService;
import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.IssueService;
import com.iii.eeit9703.club.model.IssueVO;
import com.iii.eeit9703.utility.StringHelper;


@WebServlet("/club/clubClientView.do")
public class ClubClientViewServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("Start the ClubClientVIEW");
		request.setCharacterEncoding("UTF-8");		
		String action = request.getParameter("action");
		System.out.println("The action is " + action);
		HttpSession session = request.getSession(false);
		if(session == null){
			
		}
		
		/*服務從findClub導過來的service,顯示club的Service*/
		if(action.matches("chooseClub")){
			System.out.println("In ClubClientVIEW, start the choose club");
			System.out.println(request.getParameter("club"));
			ClubService cs = new ClubService();
			ClubVO clubVO = cs.getOneClub(Integer.parseInt(request.getParameter("club")));
			System.out.println(clubVO.getClubName());
			System.out.println("Redirect to the clubClientViewFrame.jsp");
			response.sendRedirect("clubClientViewFrame.jsp");
			return;	
		}				
		/*服務從點選導過來的,顯示club的Service*/
		if(action.matches("loadIssues")){		
			System.out.println("In ClubClientVIEW, get in to load issues.");
			PrintWriter out = response.getWriter();
			IssueService is = new IssueService();
			List<IssueVO> issueVO_list = is.getIssueList();
			Map m1 = new HashMap();
			List<Map> issueList_json = new LinkedList();
			IssueVO isvo;
			for(int i =0;i<issueVO_list.size();i++){
				isvo = issueVO_list.get(i);
				m1.put("issueId", isvo.getIssueId());
				m1.put("clubId", isvo.getClubId());
				m1.put("issueTitle", StringHelper.convertToUTF8(isvo.getIssueTitle()));
				m1.put("issueContent", StringHelper.convertToUTF8(isvo.getIssueContent()));
				m1.put("proposerId", isvo.getProposerId());
				m1.put("issuepic", isvo.getIssuepic());
				issueList_json.add(m1);
			　　　System.out.println("中文");
		        System.out.println("中文".getBytes());
		        System.out.println("中文".getBytes("GB2312"));
		        System.out.println("中文".getBytes("ISO8859_1"));
		        System.out.println(new String("中文".getBytes()));
		        System.out.println(new String("中文".getBytes(), "GB2312"));
		        System.out.println(new String("中文".getBytes(), "ISO8859_1"));
		        System.out.println(new String("中文".getBytes("GB2312")));
		        System.out.println(new String("中文".getBytes("GB2312"), "GB2312"));
		        System.out.println(new String("中文".getBytes("GB2312"), "ISO8859_1"));
		        System.out.println(new String("中文".getBytes("ISO8859_1")));
		        System.out.println(new String("中文".getBytes("ISO8859_1"), "GB2312"));
		        System.out.println(new String("中文".getBytes("ISO8859_1"), "ISO8859_1"));
			}
			
			
			
			String jsonString = JSONValue.toJSONString(issueList_json);
			System.out.println(jsonString);
			out.println(jsonString);
		}
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
