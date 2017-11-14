package com.iii.eeit9703.member.model;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import com.sun.jersey.core.util.Base64;
@WebFilter("/*")
public class FindUserPassword implements Filter {
	String requestURI;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			HttpSession session = req.getSession();

			String cookieName = "";
			String user = "";
			String password = "";
			String rememberMe = "false";

			Cookie[] cookies = req.getCookies();

			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					cookieName = cookies[i].getName();
					if (cookieName.equals("user")) {
						user = cookies[i].getValue();
					} else if (cookieName.equals("password")) {
						String tmp = cookies[i].getValue();
						if (tmp != null) {
							byte[] ba = Base64.decode(tmp);
							//password = 	GlobalService.decryptString(GlobalService.KEY, tmp);
							 //byte[] ba=DatatypeConverter.parseBase64Binary(tmp);
							if (ba != null) {
								password = new String(ba);
							}
							
						}
					} else if (cookieName.equals("rm")) {
						rememberMe = cookies[i].getValue();
					}
				}
			} else {
				//沒幹嘛
			}
			session.setAttribute("rememberMe", rememberMe);
			session.setAttribute("user", user);
			session.setAttribute("password", password);
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
