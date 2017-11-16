package com.iii.eeit9703.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.iii.eeit9703.member.model.MemService;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.member.model.MemberSession;

@WebServlet("/googlelogin.do")
public class GoogleServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		// Google取得acces_token的url
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter rw = res.getWriter();
		String g_client_id = "237459292600-4nc82k5o9iq1caepr82fsukrcpsflah0.apps.googleusercontent.com";
		String g_client_secret = "Bd50eylAoc3bDAJEwRMM6jBS";
		String g_redirect_uri = "http://localhost:8081/CHEWME2/googlelogin.do";// 交回來處理的servlet
		URL oauthToken = new URL("https://accounts.google.com/o/oauth2/token");
		HttpURLConnection conOauthToken = (HttpURLConnection) oauthToken.openConnection();

		String idTokenStr = null;
		String accessTokenStr = null;
		String inputLine;
		StringBuilder sb = null;
		MemVO mv = new MemVO();
		HttpSession session = req.getSession();
		// 設定connection使用的方法為POST
		conOauthToken.setRequestMethod("POST");
		conOauthToken.setDoOutput(true);

		OutputStreamWriter opsw = new OutputStreamWriter(conOauthToken.getOutputStream());
		opsw.write("code=" + req.getParameter("code") + "&");// 取得google回傳的code
		opsw.write("client_id=" + g_client_id + "&");
		opsw.write("client_secret=" + g_client_secret + "&");
		opsw.write("redirect_uri=" + g_redirect_uri + "&");
		opsw.write("grant_type=authorization_code");
		opsw.close();
		// 如果認證成功
		if (conOauthToken.getResponseCode() == HttpURLConnection.HTTP_OK) {
			StringBuilder sbLines = new StringBuilder("");

			// 取得Google回傳的資料(JSON格式)
			BufferedReader reader = new BufferedReader(new InputStreamReader(conOauthToken.getInputStream(), "UTF-8"));
			String strLine = "";
			while ((strLine = reader.readLine()) != null) {
				System.out.println(strLine);
				sbLines.append(strLine);
			}
			System.out.println("第一次" + req.getPathInfo());
			try {
				// 將取回的資料放入JSONObject中,以方便存取想到的參數
				JSONObject jo = new JSONObject(sbLines.toString());
				idTokenStr = jo.getString("id_token");
				accessTokenStr = jo.getString("access_token");

				// 印出google回傳的access token
				// res.getWriter().println(jo.getString("id_token"));
				// System.out.println(idTokenStr);
			} catch (JSONException je) {
				je.printStackTrace();
			}
		}
		res.setHeader("content-type", "text/html;charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		//取得id_token然後再送去google那解碼
		try{
			URL url=new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token="+accessTokenStr);
			URLConnection conn=url.openConnection();
			BufferedReader in=new BufferedReader(new InputStreamReader(conn.getInputStream()));//接收google回傳的資料
			
			sb=new StringBuilder();//準備StringBuilder接收
			//BufferReader一行一行讀取資料到sb裡
			while((inputLine=in.readLine())!=null){
				System.out.println(inputLine);
				sb.append(inputLine);
			}
			in.close();
		}catch(MalformedURLException me){
			me.printStackTrace();
		}
		//System.out.println(sb.toString());
		
		//google回傳JSON格式,取資料
		try{
			JSONObject jo=new JSONObject(sb.toString());
			MemService msvc=new MemService();
			String id=jo.getString("id");
			mv=msvc.getGID(id);
			if(mv.getGoogleId()!=null){
				mv.setMemName(jo.getString("name"));
				mv.setMemMail(jo.getString("email"));
				mv.setGoogleId(jo.getString("id"));
				MemberSession ms = new MemberSession(mv);		
				Set<Integer> record =new LinkedHashSet<Integer>();
				session.setAttribute("LoginOK", mv);
				session.setAttribute("LoginOK_MS",ms);
				session.setAttribute("record", record);
				session.setAttribute("picUri", jo.getString("picture"));
				
				rw.write("<script>alert('登入成功！'); location.href='index.jsp';</script>");   
	            return; 
				
			}else{
				mv=new MemVO();
				mv.setMemberId(jo.getString("email"));				
				mv.setMemName(jo.getString("name"));
				mv.setMemNickN(jo.getString("given_name"));
				mv.setMemMail(jo.getString("email"));
				mv.setGoogleId(jo.getString("id"));
				mv=msvc.insertGoogle(jo.getString("email"),jo.getString("name"),jo.getString("given_name"), jo.getString("email"), jo.getString("id"));
				MemberSession ms = new MemberSession(mv);		
				Set<Integer> record =new LinkedHashSet<Integer>();

				session.setAttribute("LoginOK", mv);
				session.setAttribute("LoginOK_MS",ms);
				session.setAttribute("record", record);
				session.setAttribute("picUri", jo.getString("picture"));
				rw.write("<script>alert('登入成功！'); location.href='index.jsp';</script>");   
	            return; 
			}
		}catch (JSONException je) {
			je.printStackTrace();
		}
	}

}