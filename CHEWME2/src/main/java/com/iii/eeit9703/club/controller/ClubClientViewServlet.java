package com.iii.eeit9703.club.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;

import com.iii.eeit9703.club.model.ClubService;
import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.CommentVO;
import com.iii.eeit9703.club.model.IssueService;
import com.iii.eeit9703.club.model.IssueVO;


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
			Map issueMap = new HashMap();
			Map commentMap = new HashMap();
			List<Map> issueList_json;
			Set<Map> commentList_json; 
			IssueVO isvo;
			Set<CommentVO> cmvoList;
			for(int i =0;i<issueVO_list.size();i++){
				isvo = issueVO_list.get(i);
				issueMap.put("issueId", isvo.getIssueId());
				issueMap.put("clubId", isvo.getClubId());
				issueMap.put("issueTitle",isvo.getIssueTitle());
				issueMap.put("issueContent", isvo.getIssueContent());
				issueMap.put("proposerId", isvo.getProposerId());
				issueMap.put("issuepic", isvo.getIssuepic());
				cmvoList=isvo.getComments();
				for(int i =0;;){
					commentMap.put("", value)
					commentList_json=add()
				}
				issueList_json.add(issueMap);
				//StringHelper.testEncode(isvo.getIssueTitle());
				//StringHelper.testEncode(isvo.getIssueContent());
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
