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

		// Integer ID = Integer.parseInt(req.getParameter("id"));
		// System.out.println(ID);
		for (Part part : req.getParts()) {
	
			wirtepicture(part);
		}

	}

	private void wirtepicture(Part part) {
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
				photoVO.setName(part.getSubmittedFileName());
				photoVO.setPhoto(buf);
				dao.insert(photoVO);

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
