package com.iii.eeit9703.chatroom;



import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
@ServerEndpoint("/chatroom2")
public class ChatWebSocket {
    //用來存放WebSocket已連接的Socket
    static ArrayList<Session> sessions;
    static Map memSessionMap;
    @OnMessage
    public void onMessage(String message, Session session) throws IOException,
            InterruptedException, EncodeException {
        System.out.println("User input: " + message);
        //session.getBasicRemote().sendText("Hello world Mr. " + message);
        //for (Session s : session.getOpenSessions()) {
        for (Session s : sessions) {    //對每個連接的Client傳送訊息
            if (s.isOpen()) {
                s.getBasicRemote().sendText(message);
            }
        }
    }
 
    @OnOpen
    public void onOpen(Session session) {
        //紀錄連接到sessions中

        System.out.println("Client connected");        
        if (sessions == null) {
            sessions = new ArrayList<Session>();
            memSessionMap = new HashMap();
        }
        memSessionMap.put(key, value)
        sessions.add(session);
        System.out.println("Current sessions size: " + sessions.size());
    }
 
    @OnClose
    public void onClose(Session session) {
        //將連接從sessions中移除
        System.out.println("Connection closed");
        if (sessions == null) {
            sessions = new ArrayList<Session>();
        }
        sessions.remove(session);
        System.out.println("Current sessions size: " + sessions.size());
    }
}