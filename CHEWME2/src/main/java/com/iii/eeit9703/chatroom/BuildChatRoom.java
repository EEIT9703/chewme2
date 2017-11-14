package com.iii.eeit9703.chatroom;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.iii.eeit9703.member.model.MemVO;

/**
 * Servlet implementation class buildChatRoom
 */
@WebServlet("/BuildChatRoom")
public class BuildChatRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuildChatRoom() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer memId = Integer.parseInt(request.getParameter("memId"));
		MemVO memVO = (MemVO) request.getAttribute("LoginOK");
		//HttpSession session = request.getSession();
		ServletContext sc = request.getServletContext();
		Map<Integer,Session> msm = (Map<Integer,Session>) sc.getAttribute("memIdSessionMap");
		Map<Set<Integer>,ChatRoom> chatRooms;
		Set<Integer> chatRoomId = new HashSet<Integer>();
		chatRoomId.add(memId);
		chatRoomId.add(memVO.getMemId());
		if (sc.getAttribute("ChatRooms") == null) {
			chatRooms = new HashMap<Set<Integer>,ChatRoom>();
			sc.setAttribute("ChatRooms", chatRooms);
		}
		Session session1 = (Session)msm.get(memId);
		Session session2 = (Session)msm.get(memVO.getMemId());
		
		chatRooms = (Map) sc.getAttribute("ChatRooms");
		if (chatRooms.containsKey(chatRoomId)) {
			ChatRoom cr = (ChatRoom) chatRooms.get(chatRoomId);
		} else {
			ChatRoom cr = new ChatRoom();
			cr.add(session2);
			cr.add(session1);
			chatRooms.put(chatRoomId, cr);
		}		
		sc.setAttribute("ChatRooms", chatRooms);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
