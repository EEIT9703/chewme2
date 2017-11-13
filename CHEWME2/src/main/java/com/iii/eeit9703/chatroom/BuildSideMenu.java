package com.iii.eeit9703.chatroom;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.iii.eeit9703.member.model.MemService;
import com.iii.eeit9703.member.model.MemVO;

@WebServlet("/buildSideMenu")
public class BuildSideMenu extends HttpServlet {
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuildSideMenu() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("server get the request build the sidemenu");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		MemService ms = new MemService();
		List<MemVO> memList = ms.getAll();
		ArrayList<Map> as = new ArrayList();
		//String jsonString = "[";
		
		for (MemVO memVO :memList){			
			Map memberMap = new HashMap();
			//jsonString += "{'name':"+memVO.getMemName()+",id:"+memVO.getMemId()+"},";
			memberMap.put("name", memVO.getMemName());
			memberMap.put("id", memVO.getMemId());
			as.add(memberMap);
		}
		//jsonString = jsonString.substring(0, jsonString.length()-1);
		//jsonString += "]";
		String jsonString = JSONValue.toJSONString(as);
		System.out.println(jsonString);
		out.println(jsonString);
		return;		
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
