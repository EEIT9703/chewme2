package com.iii.eeit9703.chatroom;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.iii.eeit9703.member.model.MemberSession;

@ServerEndpoint(value = "/chatroom",configurator=GetHttpSessionConfigurator.class)
public class ChatRoomManager {
	static HashSet<ChatRoom> chatRooms;
    static ArrayList<Session> sessions;
	@OnMessage
	public void onMessage(String message, Session session) throws IOException, InterruptedException, EncodeException {
		System.out.println("User input: " + message);
		// session.getBasicRemote().sendText("Hello world Mr. " + message);
		// for (Session s : session.getOpenSessions()) {
		
		for (Session s : sessions) { // 對每個連接的Client傳送訊息
			if (s.isOpen()) {
				s.getBasicRemote().sendText(message);
			}
		}
	}

	@OnOpen
	public void onOpen(Session session,EndpointConfig config) {
		HttpSession httpSession = (HttpSession)config.getUserProperties().get(HttpSession.class.getName()); 
		httpSession.getAttribute("");
		
		List<Integer> myfriends = new ArrayList();
		for(Iterator itr = myfriends.iterator();itr.hasNext();){
			ChatRoom cr = new ChatRoom();
			cr.add(ms.getMemId());
			cr.add((Integer)itr.next());
		}
		session.getQueryString(); 
		
		System.out.println("Client connected");
		if (sessions == null) {
			sessions = new ArrayList<Session>();
		}
		sessions.add(session);
		System.out.println("Current sessions size: " + sessions.size());
	}

	@OnClose
	public void onClose(Session session) {
		// 將連接從sessions中移除
		System.out.println("Connection closed");
		if (sessions == null) {
			sessions = new ArrayList<Session>();
		}
		sessions.remove(session);
		System.out.println("Current sessions size: " + sessions.size());
	}
}
