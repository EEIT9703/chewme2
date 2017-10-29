package com.iii.eeit9703.crawler.controller;

import java.io.IOException;
import java.io.InputStream;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.iii.eeit9703.crawler.model.AttrService;
import com.iii.eeit9703.crawler.model.AttrVO;

@MultipartConfig(maxFileSize = 16177215)
public class AttrServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {

			try {
				InputStream inputStream = null;

				String name = req.getParameter("name");
				String county = req.getParameter("county");
				String type = req.getParameter("type");
				String address = req.getParameter("address");
				String tel = req.getParameter("tel");
				String intro = req.getParameter("intro");

				Part filepart = req.getPart("photo");

				if (filepart != null) {
					System.out.println(filepart.getName());
					System.out.println(filepart.getSize());
					System.out.println(filepart.getContentType());
					inputStream = filepart.getInputStream();
				}

				AttrVO attrVO = new AttrVO();
				attrVO.setName(name);
				attrVO.setCounty(county);
				attrVO.setType(type);
				attrVO.setAddress(address);
				attrVO.setTel(tel);
				attrVO.setIntro(intro);
				attrVO.setImage(inputStream);

				req.setAttribute("attrVO", attrVO);

				AttrService attr1 = new AttrService();
				attrVO = attr1.addAttr(name, county, type, address, tel, intro, inputStream);

				RequestDispatcher view = req.getRequestDispatcher("showView.jsp");
				view.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failure = req.getRequestDispatcher("insertAttr.jsp");
				failure.forward(req, res);
			}
		}
		if ("delete".equals(action)) {
			try {
				Integer attractionID = new Integer(req.getParameter("attractionID"));
				AttrService attrsvc = new AttrService();
				attrsvc.deleteAttr(attractionID);

				RequestDispatcher view = req.getRequestDispatcher("listAll.jsp");
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
				// System.out.println(attrVO);

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
		if ("update".equals(action)) {

			Integer attractionID = new Integer(req.getParameter("attractionID"));

			try {
				InputStream inputStream = null;

				String name = req.getParameter("name");
				String county = req.getParameter("county");
				String type = req.getParameter("type");
				String address = req.getParameter("address");
				String tel = req.getParameter("tel");
				String intro = req.getParameter("intro");

				Part filepart = req.getPart("photo");
				if (filepart != null) {
					System.out.println(filepart.getName());
					System.out.println(filepart.getSize());
					System.out.println(filepart.getContentType());
					inputStream = filepart.getInputStream();
				}

				AttrVO attrVO = new AttrVO();
				attrVO.setAttractionID(attractionID);
				attrVO.setName(name);
				attrVO.setCounty(county);
				attrVO.setType(type);
				attrVO.setAddress(address);
				attrVO.setTel(tel);
				attrVO.setIntro(intro);
				attrVO.setImage(inputStream);

				req.setAttribute("attrVO", attrVO);

				AttrService attr1 = new AttrService();
				attrVO = attr1.updateattr(attractionID, name, county, type, address, tel, intro, inputStream);
				
				RequestDispatcher successView = req.getRequestDispatcher("show_one.jsp");
				successView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
