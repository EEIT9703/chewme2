package com.iii.eeit9703.backstage;
import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import com.iii.eeit9703.adphoto.model.*;
@MultipartConfig
@WebServlet("/upload")
public class Uploadfile extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
		
		 String action = req.getParameter("action");
		// System.out.println(ID);
		for (Part part : req.getParts()) {
	     //wirtepicture(req,res,part,action);
			PhotoDAO dao = new PhotoDAO();
			PhotoVO photoVO = new PhotoVO();
			InputStream is = null;
			ByteArrayOutputStream bos = null;
			try {

				is = part.getInputStream();
				int len;
				int size = 1024;
				byte[] buf;

				if (is instanceof ByteArrayInputStream) {
					size = is.available();
					buf = new byte[size];
					len = is.read(buf, 0, size);
				} else {
					bos = new ByteArrayOutputStream();
					buf = new byte[size];
					while ((len = is.read(buf, 0, size)) != -1)
						bos.write(buf, 0, len);
					buf = bos.toByteArray();
					String base64 = Base64.getEncoder().encodeToString(buf);
					
//					BASE64Encoder encoder = new BASE64Encoder();
//					String imageString = encoder.encode(buf);
					
					if("upload".equals(action)){
					Integer id = Integer.parseInt(req.getParameter("id"));
					photoVO.setPhoto_no(id);
					photoVO.setName(part.getSubmittedFileName());
					photoVO.setPhoto(base64);
			
					dao.insert(photoVO);
					}
				
					if("insert".equals(action)){	
						photoVO.setName(part.getSubmittedFileName());
						photoVO.setPhoto(base64);
						photoVO.setStatus(0);
						dao.insert(photoVO);									
					}

				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					is.close();
					bos.close();
					// is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

	}
//binary
//	private void wirtepicture(HttpServletRequest req, HttpServletResponse res,Part part,String action) {
//		PhotoDAO dao = new PhotoDAO();
//		PhotoVO photoVO = new PhotoVO();
//		InputStream is = null;
//		ByteArrayOutputStream bos = null;
//		try {
//
//			is = part.getInputStream();
//			int len;
//			int size = 1024;
//			byte[] buf;
//
//			if (is instanceof ByteArrayInputStream) {
//				size = is.available();
//				buf = new byte[size];
//				len = is.read(buf, 0, size);
//			} else {
//				bos = new ByteArrayOutputStream();
//				buf = new byte[size];
//				while ((len = is.read(buf, 0, size)) != -1)
//					bos.write(buf, 0, len);
//				buf = bos.toByteArray();
//				String base64 = Base64.getEncoder().encodeToString(buf);
//				
////				BASE64Encoder encoder = new BASE64Encoder();
////				String imageString = encoder.encode(buf);
//				
//				if("upload".equals(action)){
//				id = Integer.parseInt(req.getParameter("id"));
//				photoVO.setPhoto_no(id);
//				photoVO.setName(part.getSubmittedFileName());
//				photoVO.setPhoto(base64);
//				dao.insert(photoVO);
//				}
//			
//				if("insert".equals(action)){	
//					photoVO.setName(part.getSubmittedFileName());
//					photoVO.setPhoto(base64);
//					dao.insert(photoVO);									
//				}
//
//			}
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			try {
//				is.close();
//				bos.close();
//				// is.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//
//	}
	
	//base
//	private void wirtepicture(Part part) {
//		PhotoDAO dao = new PhotoDAO();
//		PhotoVO photoVO = new PhotoVO();
//		InputStream is = null;
//	
//		try {
//		
//			is = part.getInputStream();
//		
//			
//			
//				photoVO.setName(part.getSubmittedFileName());
//				photoVO.setPhoto();
//				dao.insert(photoVO);
//
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			try {
//				is.close();
//				
//				// is.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//
//	}
}
