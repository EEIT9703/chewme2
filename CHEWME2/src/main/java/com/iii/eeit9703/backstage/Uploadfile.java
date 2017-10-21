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

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("aa");
		req.setCharacterEncoding("UTF-8");
		PhotoDAO dao= new PhotoDAO();
		PhotoVO photoVO = new PhotoVO();
		
		//Part part =req.getPart("photo");
		
		//String action = req.getParameter("file");	
			for(Part part : req.getParts()) {
				InputStream	is=	part.getInputStream();
			
//				BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream()));
//				String line;
//				StringBuffer sb = new StringBuffer();
//				while ((line = reader.readLine()) != null) {
//					sb.append(line);
//				}
				 	int len;
				    int size = 1024;
				    byte[] buf;

				    if (is instanceof ByteArrayInputStream) {
				      size = is.available();
				      buf = new byte[size];
				      len = is.read(buf, 0, size);
				    } else {
				      ByteArrayOutputStream bos = new ByteArrayOutputStream();
				      buf = new byte[size];
				      while ((len = is.read(buf, 0, size)) != -1)
				        bos.write(buf, 0, len);
				      	buf = bos.toByteArray();
				    }
				
				photoVO.setName(part.getSubmittedFileName());	
				photoVO.setPhoto(buf);
				dao.insert(photoVO);
	            }
			
			
		
			//	System.out.println("aa");
		
		
	}
}
