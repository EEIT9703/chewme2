package com.iii.eeit9703.chatroom;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.iii.eeit9703.GetHttpSessionConfigurator;
import com.iii.eeit9703.member.model.MemVO;

@ServerEndpoint(value = "/chatroom1",configurator=GetHttpSessionConfigurator.class)
public class ChatRoomManager {
	static ServletContext sc ;
	static Map<Set,ChatRoom> chatRooms;
	static ArrayList<Session> sessions;
	static Map<Integer,Session> memIdSessionMapping;
	//static ArrayList<Session> sessions;
    //static ChatRoom chatRoom;
    
	@OnMessage
	public void onMessage(String message, Session session) throws IOException, InterruptedException, EncodeException {
		System.out.println("User input: " + message);
		String[] msgs= message.split(",");
		String sendMessage = msgs[msgs.length-1];
		//ArrayList<Session> sessions = new ArrayList<Session>();
		Map<Integer,Session> memIdSessionMap=(Map)sc.getAttribute("memIdSessionMap");
		for(int i =0;i<msgs.length-1;i++){
			//sessions.add((Session)memIdSessionMap.get(Integer.parseInt(msgs[i].trim())));
		}
		//chatRooms = (Map)this.sc.getAttribute("ChatRooms");
		//HashSet<Integer> crId =  ;
		//ChatRoom cr = chatRooms.get(crId);
		// session.getBasicRemote().sendText("Hello world Mr. " + message);
		// for (Session s : session.getOpenSessions()) {
		
		for (Session s : sessions) { // 對每個連接的Client傳送訊息
			if (s.isOpen()) {
				s.getBasicRemote().sendText(message);
			}
		}
	}

	
	
	//工作時機在於使用者登入整個頁面時,記下Session
	@OnOpen
	public void onOpen(Session session,EndpointConfig config) {
		Map<Integer,Session> memIdSessionMap;
		session.getQueryString(); 
		
		System.out.println("Client connected");
		HttpSession httpSession = (HttpSession)config.getUserProperties().get(HttpSession.class.getName()); 
		if (sessions == null) {
			sessions = new ArrayList<Session>();
			memIdSessionMapping = new HashMap<Integer,Session>();
			this.sc = httpSession.getServletContext();			
		}
		if( sc.getAttribute("httpSessionMap")==null){			
			memIdSessionMap = new HashMap();

		}else {
			memIdSessionMap = (Map)sc.getAttribute("httpSessionMap");
		}
		if(httpSession.getAttribute("LoginOK")!=null){			
			MemVO memVO = (MemVO)httpSession.getAttribute("LoginOK");
			memIdSessionMap.put(memVO.getMemId() , session);
			sc.setAttribute("memIdSessionMap", memIdSessionMap);
			memIdSessionMapping.put(memVO.getMemId() , session);			
		}
		//sessions.add(session);
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
