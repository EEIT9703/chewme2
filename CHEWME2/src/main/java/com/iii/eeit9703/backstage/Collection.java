package com.iii.eeit9703.backstage;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
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
@WebServlet("/Collection")
public class Collection extends HttpServlet {
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
			 if("getMyCollectionsById".equals(action)){
				 System.out.println("bbbb");
				 	Integer ID = Integer.parseInt(request.getParameter("actID"));
					MemVO memVO=(MemVO) session.getAttribute("LoginOK");
					
					ActService Actser=new ActService();
					ActivityVO activityVO=Actser.getOneAct(ID);
					List list=new LinkedList();
					HashMap map	= new HashMap();		
					map.put("actID", activityVO.getActID().toString());
					map.put("act_name",activityVO.getAct_name());
					map.put("act_groups",activityVO.getAct_groups().toString());
					map.put("act_current",activityVO.getAct_current().toString());
					map.put("BDate",activityVO.getBDate().toString());
					map.put("EDate", activityVO.getEDate().toString());
					map.put("activity_state",activityVO.getActivity_state().toString());
					map.put("act_price",activityVO.getAct_price());
					//list.add(map);
					
					HashMap map2= new HashMap();							
					map2.put("activityVO", map);
					
					String jsonString = JSONValue.toJSONString(map2);  
					out.println(jsonString);
            }
			
				
				 if("deleteCollection".equals(action)){
					 System.out.println("del");
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
//						   out.println();
	               }
	
                if("getMyCollections".equals(action)){
                	System.out.println("ccccc");
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
        					map.put("act_price",collectionVO.getActivityVO().getAct_price());
        					list.add(map);
            		   	}
            		   	JSONArray attrArrayList = new JSONArray(list);				
        				out.print(attrArrayList.toString());
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
