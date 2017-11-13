package com.iii.eeit9703.chatroom;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

@ServerEndpoint("/WsPushServer")
public class WsPushServer {
    private  static  Set<WsPushServer>  sockets=new HashSet<WsPushServer>();
    private  static  List<String>   nameList=new ArrayList<String>();
    private  Session  session;
    private String username;
    private Gson  gson=new Gson();
    
    //只要有人连接这个服务，就会打开，执行下面的方法。
    @OnOpen
    public void open(Session session){
        //一个session就代表一个通信会话
        System.out.println("sessionid:"+session.getId()+"通道开启了。。。。");
        //把session添加到容器中
        this.session=session;
        sockets.add(this);

        //getQueryString把url中？后面的所有的串儿都取出来
        String QueryString = session.getQueryString();
        System.out.println(QueryString);
        
        //获取用户名
        this.username = QueryString.substring(QueryString.indexOf("=")+1);
        nameList.add(username);

        String message = (username+"进入聊天室！！");

        broadcast(sockets, gson.toJson(message) );
    }
    
    //退出
    @OnClose
    public void close(Session session){
        //1.清理退出的session
        sockets.remove(this);
        //2.清理列表用户名
        nameList.remove(this.username);
        //3.更新消息信息
        String message=(this.username+"退出聊天室！！");
        //4.广播消息信息
        broadcast(sockets, gson.toJson(message));
    }
    
    @OnError
    public void onError(Throwable e){
            e.printStackTrace();
    }

    //收
    @OnMessage
    /** * * @param session * @param msg 从客户端接收的消息 */
    public void message(Session session,String msg){
        //接收消息

        String  message=(this.username + ":" + msg + ":" + new Date().toString());
        broadcast(sockets, gson.toJson(message));

    }
    
    /** * 广播消息 * @param ss 用户session * @param msg 广播消息 */
    public void broadcast(Set<WsPushServer>  ss ,String msg ){

        for (Iterator<WsPushServer> iterator = ss.iterator(); iterator.hasNext();) {
                WsPushServer chatSocket = (WsPushServer) iterator.next();
            try {
                chatSocket.session.getBasicRemote().sendText(msg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}