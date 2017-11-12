package com.iii.eeit9703.chatroom;

import java.io.IOException;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer chatRoomId = Integer.parseInt(request.getParameter("ChatRoom"));
		HttpSession session = request.getSession();
		HashSet chatRooms;
		if(session.getAttribute("ChatRooms")!=null){
			chatRooms = (HashSet)session.getAttribute("ChatRooms");
		}else{
			chatRooms = new HashSet();
		}
		chatRooms.add(chatRoomId);
		session.setAttribute("ChatRooms", chatRooms);			
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
