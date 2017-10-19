package com.iii.eeit9703.crawler.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.iii.eeit9703.crawler.model.AttrService;
import com.iii.eeit9703.crawler.model.AttrVO;

@WebServlet("/Attraction.do")
public class AttrServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {

			try {
				
				String name = req.getParameter("name");
				String county = req.getParameter("county");
				String type = req.getParameter("type");
				String address = req.getParameter("address");
				String tel = req.getParameter("tel");
				String intro = req.getParameter("intro");
				
				AttrVO attrVO = new AttrVO();
				attrVO.setName(name);
				attrVO.setCounty(county);
				attrVO.setType(type);
				attrVO.setAddress(address);
				attrVO.setTel(tel);
				attrVO.setIntro(intro);
				

				req.setAttribute("attrVO", attrVO);

				AttrService attr1 = new AttrService();
				attrVO = attr1.addAttr(name, county, type, address, tel, intro);

				RequestDispatcher view = req.getRequestDispatcher("ShowView.jsp");
				view.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failure = req.getRequestDispatcher("InsertAttr.jsp");
				failure.forward(req, res);
			}
		}
		if ("delete".equals(action)) {
			try {
				Integer attractionID = new Integer(req.getParameter("attractionID"));
				AttrService attrsvc = new AttrService();
				attrsvc.deleteAttr(attractionID);

				RequestDispatcher view = req.getRequestDispatcher("ListAll.jsp");
				view.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if ("one_info".equals(action)) {
			try {
				Integer attractionID = new Integer(req.getParameter("attractionID"));
				AttrService attrupd = new AttrService();
				AttrVO attrVO = attrupd.getOneAttr(attractionID);

				req.setAttribute("attrVO", attrVO);
				RequestDispatcher view = req.getRequestDispatcher("show_one.jsp");
				view.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if ("update_one".equals(action)) {
			try {
				Integer attractionID = new Integer(req.getParameter("attractionID"));
				AttrService attrsvc = new AttrService();
				AttrVO attrVO = attrsvc.getOneAttr(attractionID);

				req.setAttribute("attrVO", attrVO);
				RequestDispatcher view = req.getRequestDispatcher("update_input.jsp");
				view.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
