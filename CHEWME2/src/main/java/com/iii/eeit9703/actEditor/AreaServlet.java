package com.iii.eeit9703.actEditor;

import java.io.*;
import java.util.ArrayList;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import org.json.JSONArray;

import com.iii.eeit9703.adphoto.model.*;



/**
 * Servlet implementation class AreaServlet
 */
@WebServlet("/AreaServlet.do")
public class AreaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String mission = request.getParameter("mission");
			request.setCharacterEncoding("UTF-8");
			String countryID = null;
			Integer countyID = null;
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			
			if("getCountry".equals(mission)){
				countryID = request.getParameter("country");
				CountyDAO countydao = new CountyDAO();
				ArrayList<CountyVO> countyList = countydao.getCounty(countryID);			
			
				JSONArray countyArrayList = new JSONArray(countyList);
//				System.out.print(countyArrayList);
				out.print(countyArrayList.toString());
				
				}
			
			if("getCountryAttr".equals(mission)){
				countryID = request.getParameter("country");
				System.out.println(countryID);
				AttrDAO attrdao = new AttrDAO();
				ArrayList<AttrVO> attrList = attrdao.getAttrByCountry(countryID);
				
				JSONArray attrArrayList = new JSONArray(attrList);
//				System.out.println(attrArrayList);
				out.print(attrArrayList.toString());
				
				}
			
			if("getCounty".equals(mission)){
				countyID =  Integer.parseInt(request.getParameter("county"));
				System.out.println(countyID);
				AttrDAO attrdao = new AttrDAO();
				ArrayList<AttrVO> attrList = attrdao.getAttrByCounty(countyID);
				
				JSONArray attrArrayList = new JSONArray(attrList);
				System.out.println(attrArrayList);
				out.print(attrArrayList.toString());
				
				}
			
			if("showPhoto".equals(mission)){
				Integer id = Integer.parseInt(request.getParameter("id"));
				System.out.println(id);
				
				for(Part part : request.getParts()){
					PhotoDAO dao = new PhotoDAO();
					PhotoVO vo = new PhotoVO();
					InputStream is = null;
					ByteArrayOutputStream bos = null;
					
					is = part.getInputStream();
					int len;
					int size=1024;
					byte[] buf;
					
					if(is instanceof ByteArrayInputStream){
						size = is.available();
						buf = new byte[size];
						len = is.read(buf, 0, size);
					}else{
						bos = new ByteArrayOutputStream();
						buf = new byte[size];
						while ((len = is.read(buf, 0, size))!=-1)
							bos.write(buf, 0, len);
						buf = bos.toByteArray();
						String base64 = Base64.getEncoder().encodeToString(buf);
						
					}
				}
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}