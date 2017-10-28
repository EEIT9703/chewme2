package com.iii.eeit9703.backstage;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.iii.eeit9703.activity.model.ActService;
import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.adphoto.model.PhotoDAO;
import com.iii.eeit9703.adphoto.model.PhotoVO;
import com.iii.eeit9703.member.model.MemDAO_hibernate;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.report.ReportDAO_hibernate;
import com.iii.eeit9703.report.ReportVO;

import net.minidev.json.JSONValue;







/**
 * Servlet implementation class activity
 */
@WebServlet("/activity")
public class activity extends HttpServlet {
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
			String action = request.getParameter("action");
			request.setCharacterEncoding("UTF-8");
			
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			
			if("getAllphoto".equals(action)){
				
				PhotoDAO dao = new PhotoDAO();
				ArrayList<PhotoVO> attrList = (ArrayList<PhotoVO>) dao.getAll();
				for(PhotoVO  aa :attrList){
				System.out.println(aa.getPhoto());
					
				}
				JSONArray attrArrayList = new JSONArray(attrList);
		
				out.print(attrArrayList.toString());
				}
			
				if("getAllactivity".equals(action)){
				ActService ser= new ActService();
				ArrayList<ActivityVO> attrList = (ArrayList<ActivityVO>) ser.getAll();			
				JSONArray attrArrayList = new JSONArray(attrList);
				System.out.println(attrArrayList.toString());
				out.print(attrArrayList.toString());
				}
				
				if("getAllmember".equals(action)){
					MemDAO_hibernate hib= new MemDAO_hibernate();
					//MemService hib=new MemService();
			
					List<MemVO> attrList = (ArrayList<MemVO>)hib.getAll();
					
					List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
					HashMap<String,String> map = null;
					for(MemVO vo : attrList){
						map = new HashMap<String,String>();
						map.put("memAddr", vo.getMemAddr());
						map.put("mamberId", vo.getMemberId().toString());
						list.add(map);
					}					
					JSONArray attrArrayList = new JSONArray(list);			
					out.print(attrArrayList.toString());
					}
			
				if("delete".equals(action)){
					System.out.println("delete");
				Integer id =new Integer(request.getParameter("ID"));
					PhotoDAO dao = new PhotoDAO();
					//List<PhotoVO> countyList =  dao.getAll();			
					//System.out.println(countyList.size());
					dao.delete(id);
					
					ArrayList<PhotoVO> attrList = (ArrayList<PhotoVO>) dao.getAll();
					
					JSONArray attrArrayList = new JSONArray(attrList);
			
					out.print(attrArrayList.toString());
					}
				
					if("getAllReport".equals(action)){
					System.out.println("getAllReport");
					ReportDAO_hibernate dao= new ReportDAO_hibernate();				
//					ArrayList<ReportVO> attrList = (ArrayList<ReportVO>) dao.getAll();
					List<ReportVO> attrList = dao.getAll();
					for(ReportVO vo:attrList){
						
						System.out.println(vo.getReportContext());
						System.out.println(vo.getMemVO().getMemberId());
					}
					String jsonString =JSONValue.toJSONString(attrList);
			
					out.print(jsonString);
//				    JSONArray attrArrayList = new JSONArray(attrList);
//					
//					out.print(attrArrayList.toString());
					}

		
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

}
}
