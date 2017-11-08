package com.iii.eeit9703.crawler.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.iii.eeit9703.crawler.model.AttrDAO;
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
		HttpSession session = req.getSession();

		// 新增商家資料
		if ("insert".equals(action)) {
			Map<String, String> error = new HashMap<String, String>();  // 存放錯誤訊息的Map物件
			req.setAttribute("error", error);

			try {
				InputStream inputStream = null;

				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					error.put("nameerror", "姓名欄位不得空白");
				}

				String county = req.getParameter("county");
				String type = req.getParameter("type");
				String address = req.getParameter("address");
				if (address == null || address.trim().length() == 0) {
					error.put("addresserror", "地址欄位不得空白");
				}
				String tel = req.getParameter("tel");
				if (tel == null || tel.trim().length() == 0) {
					error.put("telerror", "電話欄位不得空白");
				}
				String intro = req.getParameter("intro");
				if (intro == null || intro.trim().length() == 0) {
					error.put("introerror", "簡介欄位不得空白");
				}
				Part filepart = req.getPart("photo");				
				
				if (filepart != null) {
					
					System.out.println(filepart.getName());
					System.out.println(filepart.getSize());
					System.out.println(filepart.getContentType());
					inputStream = filepart.getInputStream();
				}else {
					error.put("imageerror", "請上傳圖片");
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
				
				if (!error.isEmpty()) {					
					RequestDispatcher failure = req.getRequestDispatcher("insertAttr.jsp");
					failure.forward(req, res);
					return;
				}
				AttrService attr1 = new AttrService();
				attrVO = attr1.addAttr(name, county, type, address, tel, intro, inputStream);	
				
//				session.setAttribute("attrVO", attrVO);
				
				RequestDispatcher view = req.getRequestDispatcher("showView.jsp");
				view.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failure = req.getRequestDispatcher("insertAttr.jsp");
				failure.forward(req, res);
			}
		}
		// 刪除一筆商家資料
		if ("delete".equals(action)) {
			try {
				Integer attractionID = new Integer(req.getParameter("attractionID"));
				AttrService attrsvc = new AttrService();
				attrsvc.deleteAttr(attractionID);

				RequestDispatcher view = req.getRequestDispatcher("manageList.jsp");
				view.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 在列表中點選查看一筆景點資料
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
		// 從管理列表點選查看景點管理頁面(可編輯)
		if("one_info_edit".equals(action)){
			try {
				Integer attractionID = new Integer(req.getParameter("attractionID"));
				AttrService attrupd = new AttrService();
				AttrVO attrVO = attrupd.getOneAttr(attractionID);
				// System.out.println(attrVO);
				
				req.setAttribute("attrVO", attrVO);
				RequestDispatcher view = req.getRequestDispatcher("showOneManage.jsp");
				view.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 進入資料修改頁面，準備修改
		if ("update_one".equals(action)) {
			try {
				Integer attractionID = new Integer(req.getParameter("attractionID"));
				System.out.println(attractionID);
				AttrService attrsvc = new AttrService();
				AttrVO attrVO = attrsvc.getOneAttr(attractionID);
				
				System.out.println(attrVO.getAttractionID() + "testID");

				req.setAttribute("attrVO", attrVO);
				RequestDispatcher view = req.getRequestDispatcher("update_input.jsp");
				view.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 送出已修改的資料
		if ("update".equals(action)) {

			Integer attractionID = new Integer(req.getParameter("attractionID"));

			try {
				InputStream inputStream = null;
				
				AttrService attrsvc = new AttrService();
				AttrVO attrVO1 = attrsvc.getOneAttr(attractionID);
				
//				System.out.println(attrVO1.getImage());				
				
				String name = req.getParameter("name");
				String county = req.getParameter("county");
				String type = req.getParameter("type");
				String address = req.getParameter("address");
				String tel = req.getParameter("tel");
				String intro = req.getParameter("intro");

				Part filepart = req.getPart("photo");	
				
				
//				if(filepart != null){
//					System.out.println(filepart.getName());
//					System.out.println(filepart.getSize());
//					System.out.println(filepart.getContentType());					
					inputStream = filepart.getInputStream();
//				}
					byte[] bb  = new byte[inputStream.available()];
					System.out.println(bb.length);

					if(bb.length == 0){
						AttrVO attrVO = new AttrVO();
						attrVO.setAttractionID(attractionID);
						attrVO.setName(name);
						attrVO.setCounty(county);
						attrVO.setType(type);
						attrVO.setAddress(address);
						attrVO.setTel(tel);
						attrVO.setIntro(intro);
						
						req.setAttribute("attrVO", attrVO);

						AttrService attr2 = new AttrService();
						attrVO = attr2.upnoimage(attractionID, name, county, type, address, tel, intro);
						
						
						RequestDispatcher successView = req.getRequestDispatcher("show_one.jsp");
						successView.forward(req, res);
					}else{
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
					}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
