package com.iii.eeit9703.backstage;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.json.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.simple.JSONValue;

import com.iii.eeit9703.activity.model.ActService;
import com.iii.eeit9703.activity.model.ActivityDAO_hibernate;
import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.adphoto.model.PhotoDAO;
import com.iii.eeit9703.adphoto.model.PhotoVO;
import com.iii.eeit9703.collection.CollectionService;
import com.iii.eeit9703.collection.CollectionVO;
import com.iii.eeit9703.member.model.MemDAO_hibernate;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.member.model.MemberSession;
import com.iii.eeit9703.report.ReportDAO_hibernate;
import com.iii.eeit9703.report.ReportVO;




/**
 * Servlet implementation class activity
 */
@WebServlet("/ShoppingCar")
public class ShoppingCar extends HttpServlet {
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
			
			HttpSession session = request.getSession();
				if("inputCar".equals(action)){			
				Integer ID = Integer.parseInt(request.getParameter("ID"));
				MemVO memVO=(MemVO) session.getAttribute("LoginOK");
				Integer memID= memVO.getMemId();
				System.out.println(memID+"ididididididididdi");		
				MemberSession chd = new MemberSession(memID);
				List<CollectionVO> collList=chd.getOwnColVoList();
				System.out.println(collList.size());
				List<HashMap<String,String>> errorMsgMap = new ArrayList<HashMap<String,String>>();
				HashMap<String,String> map = null;
				for(CollectionVO collection :collList){
					System.out.println(collection.getActivityVO().getActID());
											
					if(collection.getActivityVO().getActID()==ID){
						System.out.println("if");
						System.out.println(ID);
						map =new HashMap<String,String>();
						map.put("existColl", "已加入購物車");						
						errorMsgMap.add(map);
						JSONArray attrArrayList = new JSONArray(errorMsgMap);				
						out.print(attrArrayList.toString());
						return;       				
					}			 
				}			
					CollectionService ser= new CollectionService();						
					ActivityVO actVO=new ActivityVO();
					actVO.setActID(ID);
					CollectionVO colVO=new CollectionVO();
					colVO.setMemVO(memVO);
					colVO.setActivityVO(actVO);
					colVO.setStatus(0);
					ser.insert(colVO);
					map =new HashMap<String,String>();
					map.put("inputOK","加入");
					errorMsgMap.add(map);
					JSONArray attrArrayList = new JSONArray(errorMsgMap);				
					out.print(attrArrayList.toString());
	
				}
				
//				if("deleteCar".equals(action)){			
//					Integer ID = Integer.parseInt(request.getParameter("ID"));
//					MemVO memVO=(MemVO) session.getAttribute("LoginOK");
//					Integer memID= memVO.getMemId();
//					
//						CollectionService ser= new CollectionService();						
//						ActivityVO actVO=new ActivityVO();
//						actVO.setActID(ID);
//						CollectionVO colVO=new CollectionVO();
//						colVO.setMemVO(memVO);
//						colVO.setActivityVO(actVO);
//						ser.delete(colVO);
//
//					
//		
//					}
				
				 if("deleteCar".equals(action)){
					 
					 	Integer ID = Integer.parseInt(request.getParameter("actID"));
						MemVO memVO=(MemVO) session.getAttribute("LoginOK");
						ActivityVO activityVO =new ActivityVO();
						activityVO.setActID(ID);
						CollectionVO collectionVO =new CollectionVO();
						collectionVO.setMemVO(memVO);
						collectionVO.setActivityVO(activityVO);
						CollectionService ser =new CollectionService();
						ser.delete(collectionVO);
						
//	            		   	JSONArray attrArrayList = new JSONArray(list);				
//	        				out.print(attrArrayList.toString());
						out.println();
	               }
				
				
				
//			
                if("getMyCars".equals(action)){
                	if( session.getAttribute("LoginOK")!=null){
                		
                		MemVO memVO=(MemVO) session.getAttribute("LoginOK");
                		Integer memID= memVO.getMemId();
                		
                		MemberSession chd = new MemberSession(memID);
                		List<CollectionVO> set=chd.getOwnColVoList();
//            		MemDAO_hibernate dao =new MemDAO_hibernate();
//            		Set<CollectionVO> set=dao.getCollByMemNo(1);
                		List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
                		HashMap<String,String> map = null;
                		for(CollectionVO collectionVO :set){
                			map = new HashMap<String,String>();						
                			map.put("actID", collectionVO.getActivityVO().getActID().toString());
                			map.put("act_name",collectionVO.getActivityVO().getAct_name());
                			map.put("act_groups",collectionVO.getActivityVO().getAct_groups().toString());
                			map.put("act_current",collectionVO.getActivityVO().getAct_current().toString());
                			map.put("BDate",collectionVO.getActivityVO().getBDate().toString());
                			map.put("EDate", collectionVO.getActivityVO().getEDate().toString());
                			map.put("activity_state",collectionVO.getActivityVO().getActivity_state().toString());
                			map.put("act_photo",collectionVO.getActivityVO().getAct_photo());
                			list.add(map);
                		}
                		JSONArray attrArrayList = new JSONArray(list);				
                		out.print(attrArrayList.toString());
                		return;
                	}
                	out.println();
                	return;
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
