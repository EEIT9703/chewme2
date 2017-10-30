package com.iii.eeit9703.club.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
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
import com.iii.eeit9703.club.model.CommentService;
import com.iii.eeit9703.club.model.CommentVO;
import com.iii.eeit9703.club.model.IssueService;
import com.iii.eeit9703.club.model.IssueVO;
import com.iii.eeit9703.member.model.MemberSession;
import com.iii.eeit9703.utility.DateUtil;


@WebServlet("/club/clubClientView.do")
public class ClubClientViewServlet extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doService(request,response);
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doService(request,response);
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SecurityException, ClassNotFoundException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		System.out.println("Start the ClubClientVIEW");
		
		
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		request.setCharacterEncoding("UTF-8");		
		String action = request.getParameter("action");
		System.out.println("The action is " + action);
		HttpSession session = request.getSession(false);
		MemberSession memSession = (MemberSession)session.getAttribute("LoginOK");
		if(session == null){
			
		}
		/*if(memSession!=null){
			memSession.getMemId();			
		}*/
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
			/*準備get方法內傳回參數的基本物件(DAO及writer)*/
			PrintWriter out = response.getWriter();
			IssueService is = new IssueService();
			List<IssueVO> issueVO_list = is.getIssueList();						
			List<Map> issueList_json = new ArrayList();			
			IssueVO isvo;
			List<Map> commentList_json;
			Map issueMap;
			CommentVO cmvo;
			Set<CommentVO> cmvoSet;
			Map commentMap;
			for(Iterator<IssueVO> itero=issueVO_list.iterator();itero.hasNext();){
				issueMap = new HashMap();
				commentList_json  = new ArrayList(); 
				isvo = itero.next();
				issueMap.put("issueId", isvo.getIssueId());
				issueMap.put("clubId", isvo.getClubId());
				issueMap.put("issueTitle",   URLDecoder.decode(isvo.getIssueTitle()));
				issueMap.put("issueContent", isvo.getIssueContent());
				issueMap.put("proposerId", isvo.getProposerId());
				issueMap.put("issuepic", isvo.getIssuepic());
				System.out.println("issue map ok");
				cmvoSet=isvo.getComments();
				System.out.println("the cmvoSet's size is "+cmvoSet.size());
				for(Iterator<CommentVO> iter=cmvoSet.iterator();iter.hasNext();){
					commentMap = new HashMap();
					cmvo = iter.next();
					System.out.println(cmvo.getCommentId());
					for(Method method: Class.forName("com.iii.eeit9703.club.model.CommentVO").getDeclaredMethods()){
						System.out.println(method.getName());
						if(method.getName().matches("get(.*)")){
								if(method.getReturnType().equals(Integer.class)){									
									commentMap.put(method.getName(),method.invoke(cmvo,null));
								}else{
									commentMap.put(method.getName(),
											   URLDecoder.decode(method.invoke(cmvo,null).toString(),"utf-8"));
								}
								System.out.println(method.getName());							
						}
						
					}
					commentList_json.add(commentMap);
					
				}
				
				issueMap.put("comments",commentList_json);
				System.out.println("issue map ok");
				issueList_json.add(issueMap);
				//StringHelper.testEncode(isvo.getIssueContent());
			}
			String jsonString = JSONValue.toJSONString(issueList_json);
			System.out.println(jsonString);
			out.println(jsonString);
			return;
		}
/*	if(action.matches("insertComment")){
			System.out.println("request.content is "+request.getParameter("content"));
			CommentService cs = new CommentService();
			CommentVO cmvo = new CommentVO();
			cmvo.setCommenterId(1);			
			cmvo.setIssueId(Integer.parseInt(request.getParameter("issueId")));
			
			cmvo.setContent(request.getParameter("content"));
	        request.getParameter("content");
			cmvo.setCommentDate(DateUtil.getCurrentTimeStamp());		
			cs.insertComment(cmvo);
			return;
		}	
*/	}
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
