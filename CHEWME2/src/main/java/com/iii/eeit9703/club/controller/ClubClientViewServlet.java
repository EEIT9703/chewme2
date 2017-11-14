package com.iii.eeit9703.club.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;

import com.iii.eeit9703.activity.model.ActService2;
import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.bridge.model.ClubMemRelationService;
import com.iii.eeit9703.bridge.model.ClubMemRelationVO;
import com.iii.eeit9703.club.model.ClubPhotoService;
import com.iii.eeit9703.club.model.ClubPhotoVO;
import com.iii.eeit9703.club.model.ClubService;
import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.club.model.CommentService;
import com.iii.eeit9703.club.model.CommentVO;
import com.iii.eeit9703.club.model.IssueService;
import com.iii.eeit9703.club.model.IssueVO;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.member.model.MemberSession;
import com.iii.eeit9703.utility.DateUtil;

@WebServlet("/club/clubClientView.do")
public class ClubClientViewServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doService(request, response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doService(request, response);
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

	protected void doService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SecurityException, ClassNotFoundException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		System.out.println("Start the ClubClientVIEW");

		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println("The action is " + action);
		HttpSession session = request.getSession(false);
		MemberSession ms = null;
		if (session.getAttribute("LoginOK_MS") != null) {
			ms = (MemberSession) session.getAttribute("LoginOK_MS");

		}

		// 貼入在你的sevlet 然後 ctrl+shift+o 匯入必要的class
		// 可以跳過建業的member認證, 並匯入memberSession和memVO

		// if (session == null || session.getAttribute("LoginOK") == null ||
		// session.getAttribute("LoginOK_MS") == null) {
		// System.out.println("LoginOK" + session.getAttribute("LoginOK") ==
		// null);
		// System.out.println("LoginOK_MS" + session.getAttribute("LoginOK_MS")
		// == null);
		//
		// session.setAttribute("requestURI", request.getRequestURI());
		// session.setAttribute("memberId", "1");
		// session.setAttribute("action", request.getParameter("action"));
		// response.sendRedirect("/CHEWME2/member/memberLogin.do");
		// System.out.println("change to ok!");
		// return;
		// }
		// if (request.getParameter("action") == null) {
		// action = (String) session.getAttribute("action");
		// }
		/*
		 * MemberSession memSession =
		 * (MemberSession)session.getAttribute("LoginOK");
		 */
		if (session == null) {

		}
		/*
		 * if(memSession!=null){ memSession.getMemId(); }
		 */
		/* 服務從findClub導過來的service,顯示club的Service */
		if (request.getParameter("action") != null) {

			if (action.matches("joinClub")) {
				Integer clubId = Integer.parseInt(request.getParameter("clubId"));
				Integer memId = ms.getMemId();
				System.out.println("clubId is " + clubId);
				System.out.println("memId is " + memId);
				ClubMemRelationVO cmrVO = new ClubMemRelationVO();
				cmrVO.setClubId(clubId);
				cmrVO.setMemId(memId);
				cmrVO.setDate(new java.sql.Date(0));
				ClubMemRelationService cmrs = new ClubMemRelationService();
				cmrs.insertClubMemRelation(cmrVO);
				ms.appendJoinedClubList(clubId);
				return;
			}
			if (action.matches("updateClubInfo")) {
				System.out.println("In ClubClientVIEW, start the update club info");
				String col = request.getParameter("col");
				ClubService cs = new ClubService();
				ClubVO clubVO = cs.getOneClub(Integer.parseInt(request.getParameter("clubId")));
				clubVO.setClubName(request.getParameter("clubName"));
				clubVO.setRefURL(request.getParameter("refUrl"));
				clubVO.setAddr(request.getParameter("addr"));
				clubVO.setLocationId(Integer.parseInt(request.getParameter("cityId")));
				clubVO.setBrief(request.getParameter("brief"));
				cs.update(clubVO);
				return;

			}
			if (action.matches("showAct")) {
				PrintWriter out = response.getWriter();

				System.out.println("In ClubClientVIEW, start the show Activity");
				System.out.println(request.getParameter("clubId"));

			}
			if (action.matches("updatePic")) {
				System.out.println("in the update pic");
				ClubPhotoService cps = new ClubPhotoService();
				Integer clubId = Integer.parseInt(request.getParameter("clubId"));
				System.out.println(" the clubId is " + clubId);
				String photoString = request.getParameter("photo");
				InputStream stream = new ByteArrayInputStream(photoString.getBytes(StandardCharsets.UTF_8.name()));

				// ist<ClubPhotoVO> photoVOs = cps.getPhotoByClubId(clubId);
				ClubPhotoVO photoVO = new ClubPhotoVO();

				photoVO.setClubId(clubId);
				photoVO.setPhoto(stream);
				cps.updatePhoto(photoVO);
				System.out.println("update pic ok");
				return;
			}
			if (action.matches("createClubAct")) {
				String clubId = request.getParameter("clubId");
				request.setAttribute("createAct_clubId", clubId);
				System.out.println("the club id is" + clubId);
				System.out.println(request.getContextPath() + "/act/createAct.jsp");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/act/createAct.jsp");
				dispatcher.forward(request, response);
				return;
			}

			if (action.matches("chooseClub")) {
				System.out.println("In ClubClientVIEW, start the choose club");
				System.out.println(request.getParameter("clubId"));
				ClubService cs = new ClubService();
				Integer search_clubId;
				if (request.getParameter("clubId") != null) {
					search_clubId = Integer.parseInt(request.getParameter("clubId"));
				} else {
					search_clubId = (Integer) request.getAttribute("clubId");
				}

				// ActService2!!!
				// if (request.getParameter("createNewClub") != null) {
				// if (request.getParameter("createNewClub").matches("yes")) {
				// }
				// }
				System.out.println("clubID " + search_clubId);
				ClubVO clubVO = cs.getOneClub(search_clubId);
				session.setAttribute("clubVOForView", clubVO);
				ActService2 as = new ActService2();
				List<ActivityVO> activityList = as.getListByClubId(search_clubId);
				session.setAttribute("clubActList", activityList);
				session.setAttribute("MemVOList", cs.getClubMembers(search_clubId));
				String identity = "";
				if (session.getAttribute("LoginOK_MS") != null) {
					if (ms.getOwnClubList().contains(search_clubId)) {
						identity = "club_manager";
					} else if (ms.getJoinedClubList().contains(search_clubId)) {
						identity = "club_member";
					} else {
						identity = "normal_member";
					}
				} else {
					identity = "web_client";
				}
				System.out.println(identity);
				session.setAttribute("identity", identity);
				// if(clubVO.getClubName()!=null){
				// System.out.println(clubVO.getClubName());
				// }
				System.out.println("Redirect to the clubClientViewFrame.jsp");
				response.sendRedirect("clubClientViewFrame.jsp");
				return;
			}
			/* 服務從點選導過來的,顯示club的Service */
			if (action.matches("loadIssues")) {
				System.out.println("In ClubClientVIEW, get in to load issues.");
				/* 準備get方法內傳回參數的基本物件(DAO及writer) */
				Integer clubId;
				if (request.getParameter("clubId") != null) {
					if (request.getParameter("clubId").matches("")) {
						System.out.println("Redirect to the findClub.jsp");
						response.sendRedirect("findClub.jsp");
						return;
					} else {
						clubId = Integer.parseInt(request.getParameter("clubId"));
					}
				} else {
					clubId = new Integer(1);
				}
				PrintWriter out = response.getWriter();
				IssueService is = new IssueService();
				List<IssueVO> issueVO_list = is.getIssueListByClubId(clubId);
				List<Map> issueList_json = new ArrayList();
				IssueVO isvo;
				List<Map> commentList_json;
				Map issueMap;
				CommentVO cmvo;
				Set<CommentVO> cmvoSet;
				Map commentMap;
				for (Iterator<IssueVO> itero = issueVO_list.iterator(); itero.hasNext();) {
					int i = 0;
					issueMap = new HashMap();
					commentList_json = new ArrayList();
					isvo = itero.next();
					issueMap.put("issueId", isvo.getIssueId());
					issueMap.put("clubId", isvo.getClubId());
					issueMap.put("issueTitle", URLDecoder.decode(isvo.getIssueTitle()));
					issueMap.put("issueContent", isvo.getIssueContent());
					issueMap.put("proposerId", isvo.getProposerId());
					issueMap.put("issuepic", isvo.getIssuepic());
					System.out.println("issue map ok");
					cmvoSet = isvo.getComments();
					System.out.println("the cmvoSet's size is " + cmvoSet.size());
					for (Iterator<CommentVO> iter = cmvoSet.iterator(); iter.hasNext();) {
						commentMap = new HashMap();
						cmvo = iter.next();
						System.out.println(cmvo.getCommentId());
						for (Method method : Class.forName("com.iii.eeit9703.club.model.CommentVO")
								.getDeclaredMethods()) {
							// System.out.println(method.getName());
							if (method.getName().matches("get(.*)")) {
								if (method.getReturnType().equals(Integer.class)) {
									commentMap.put(method.getName(), method.invoke(cmvo, null));
								} else {
									commentMap.put(method.getName(),
											URLDecoder.decode(method.invoke(cmvo, null).toString(), "utf-8"));
								}
								// System.out.println(method.getName());
							}

						}
						commentList_json.add(commentMap);

					}

					issueMap.put("comments", commentList_json);
					// System.out.println("issue map ok" + i);
					i++;
					issueList_json.add(issueMap);
					// StringHelper.testEncode(isvo.getIssueContent());
				}
				System.out.println("issue map ok out");
				String jsonString = JSONValue.toJSONString(issueList_json);
				System.out.println(jsonString);
				out.println(jsonString);
				return;
			}

			if (action.matches("insertComment")) {
				PrintWriter out = response.getWriter();
				System.out.println("request.content is " + request.getParameter("content"));
				System.out.println("the issue id is " + request.getParameter("issueId"));
				CommentService cs = new CommentService();
				CommentVO cmvo = new CommentVO();
				MemVO memVO = (MemVO)request.getSession().getAttribute("LoginOK");
				Integer commenterId = memVO.getMemId();
				cmvo.setCommenterId(commenterId);
				cmvo.setIssueId(Integer.parseInt(request.getParameter("issueId")));
				cmvo.setContent(request.getParameter("content"));
				cmvo.setCommentDate(DateUtil.getCurrentTimeStamp());
				cs.insertComment(cmvo);
				out.println("comments回傳了喔,"+memVO.getMemId());
				return;
			}
			if (action.matches("insertIssue")) {
				PrintWriter out = response.getWriter();
				System.out.println("request.content is " + request.getParameter("content"));
				System.out.println("request.title is " + request.getParameter("title"));
				System.out.println("the issue id is " + request.getParameter("issueId"));
				IssueService is = new IssueService();
				IssueVO isvo = new IssueVO();
				MemVO memVO = (MemVO)request.getSession().getAttribute("LoginOK");
				System.out.println(memVO.getMemId());
				Integer proposerId = memVO.getMemId();
				
				isvo.setClubId(Integer.parseInt(request.getParameter("clubId")));
				isvo.setIssueContent(request.getParameter("content"));
				isvo.setIssuepic(null);
				isvo.setIssueTitle(request.getParameter("title"));
				isvo.setProposerId(proposerId);
				out.println(is.insertIssue(isvo)+","+memVO.getMemId());
				return;

			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
