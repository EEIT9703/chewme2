package com.iii.eeit9703.utility;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iii.eeit9703.member.model.MemVO;

public class AutoLogin {
	
	public static MemVO memberLogin(
			HttpServletRequest request, 
			HttpServletResponse response,
			HttpSession session, Integer memId) throws IOException{
		MemVO memVO=null;
		session.setAttribute("requestURI", request.getRequestURI());
		session.setAttribute("memberId", memId.toString());
		response.sendRedirect("/CHEWME2/member/memberLogin.do");
		System.out.println("change to ok!");		
		return memVO;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
