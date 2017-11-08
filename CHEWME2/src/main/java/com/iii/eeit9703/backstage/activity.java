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
			
			HttpSession session = request.getSession();
				if("inputCar".equals(action)){			
				Integer ID = Integer.parseInt(request.getParameter("ID"));
				MemVO memVO=(MemVO) session.getAttribute("LoginOK");
				Integer memID= memVO.getMemId();
						
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
					ser.insert(colVO);
					map =new HashMap<String,String>();
					map.put("inputOK","加入");
					errorMsgMap.add(map);
					JSONArray attrArrayList = new JSONArray(errorMsgMap);				
					out.print(attrArrayList.toString());
	
				}
				
				if("deleteCar".equals(action)){			
					Integer ID = Integer.parseInt(request.getParameter("ID"));
					MemVO memVO=(MemVO) session.getAttribute("LoginOK");
					Integer memID= memVO.getMemId();
					
						CollectionService ser= new CollectionService();						
						ActivityVO actVO=new ActivityVO();
						actVO.setActID(ID);
						CollectionVO colVO=new CollectionVO();
						colVO.setMemVO(memVO);
						colVO.setActivityVO(actVO);
						ser.delete(colVO);

					
		
					}
				
				 if("deleteCollection".equals(action)){
					 
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
                if("getMyCollection".equals(action)){
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
        					list.add(map);
            		   	}
            		   	JSONArray attrArrayList = new JSONArray(list);				
        				out.print(attrArrayList.toString());
               }
//			
                    
                if("getAllphotoByStatus".equals(action)){
    				
    				PhotoDAO dao = new PhotoDAO();
    				ArrayList<PhotoVO> attrList = (ArrayList<PhotoVO>) dao.getAllByState();
    				System.out.println(attrList.size()+"FFFFFFFFFFFFFFFFFFFS");
    				for(PhotoVO  aa :attrList){
    				System.out.println(aa.getPhoto());
    					
    				}
    				JSONArray attrArrayList = new JSONArray(attrList);
    		
    				out.print(attrArrayList.toString());
    				}
                
                	if("updateAdStates".equals(action)){
                	Integer ID = Integer.parseInt(request.getParameter("id"));
                	Integer opt = Integer.parseInt(request.getParameter("opt"));
                	PhotoDAO Dao=new PhotoDAO();
                	PhotoVO oldVO=Dao.findByPrimaryKey(ID);
                	
    				PhotoVO photoVO=new PhotoVO();
    				photoVO.setPhoto_no(ID);
    				photoVO.setPhoto(oldVO.getPhoto());
    				photoVO.setName(oldVO.getName());
    				photoVO.setStatus(opt);	
    				Dao.update(photoVO);
    			
    				}
                
                
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
				//ActService ser= new ActService();
				ActivityDAO_hibernate ser =new ActivityDAO_hibernate();
				List<ActivityVO> attrList = (ArrayList<ActivityVO>)ser.getAll();
				System.out.println(attrList.size());
				List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
				HashMap<String,String> map = null;
				for(ActivityVO act : attrList){
					map = new HashMap<String,String>();						
					map.put("actID", act.getActID().toString());
					map.put("act_name", act.getAct_name());
					map.put("act_groups", act.getAct_groups().toString());
					map.put("act_current", act.getAct_current().toString());
					map.put("BDate", act.getBDate().toString());
					map.put("EDate", act.getEDate().toString());
					map.put("activity_state", act.getActivity_state().toString());		
					list.add(map);
				}				

				JSONArray attrArrayList = new JSONArray(list);				
				out.print(attrArrayList.toString());
									
//				String jsonString =JSONValue.toJSONString(attrList);
//				System.out.println(jsonString);
//				out.print(jsonString);
				}
				
				if("getAllmember".equals(action)){
					MemDAO_hibernate hib= new MemDAO_hibernate();
					//MemService hib=new MemService();			
					List<MemVO> attrList = (ArrayList<MemVO>)hib.getAll();					
					List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
					HashMap<String,String> map = null;
					for(MemVO vo : attrList){
						map = new HashMap<String,String>();
						map.put("memId", vo.getMemId().toString());
						map.put("memberId", vo.getMemberId());
						map.put("memName", vo.getMemName());
						map.put("memPwd", vo.getMemPwd());
						map.put("memBirthday", vo.getMemBirthday().toString());
						map.put("memMail", vo.getMemMail());
						map.put("memPhone", vo.getMemPhone());			
						map.put("memStatus", vo.getMemStatus());
						map.put("memRole", vo.getMemRole());
						list.add(map);
					}	
					
					JSONArray attrArrayList = new JSONArray(list);				
					out.print(attrArrayList.toString());
					}
				
				
				if("upDateMemberStatus".equals(action)){
					Integer ID = Integer.parseInt(request.getParameter("id"));
					String opt = request.getParameter("opt");
					MemDAO_hibernate hib= new MemDAO_hibernate();
					MemVO oldVO=hib.findByPrimaryKey(ID);
					
					MemVO memVO=new MemVO();
					
					memVO.setMemId(ID);
					memVO.setMemberId(oldVO.getMemberId());
					memVO.setMemName(oldVO.getMemName());
					memVO.setMemNickN(oldVO.getMemNickN());
					memVO.setMemPwd(oldVO.getMemPwd());
					memVO.setMemBirthday(oldVO.getMemBirthday());
					memVO.setMemMail(oldVO.getMemMail());
					memVO.setMemAddr(oldVO.getMemAddr());
					memVO.setMemPhone(oldVO.getMemPhone());
					memVO.setMemIntr(oldVO.getMemIntr());
					memVO.setMemPhoto(oldVO.getMemPhoto());
					memVO.setMemStatus(opt);
					memVO.setMemRole(oldVO.getMemRole());
					memVO.setGoogleId(oldVO.getGoogleId());
					memVO.setRandomCode(oldVO.getRandomCode());
					hib.update(memVO);
					
					
					}
				
				
				if("upDateMemberRole".equals(action)){
					MemDAO_hibernate hib= new MemDAO_hibernate();
						
								
					
					
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
					
					List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
					HashMap<String,String> map = null;
					for(ReportVO vo : attrList){
						map = new HashMap<String,String>();						
						map.put("reportTime", vo.getReportTime().toString());
						map.put("reportContext", vo.getReportContext());
						map.put("act_name", vo.getActivityVO().getAct_name());
						map.put("memName", vo.getMemVO().getMemName());
							
						list.add(map);
					}				

					JSONArray attrArrayList = new JSONArray(list);				
					out.print(attrArrayList.toString());
									
//					String jsonString =JSONValue.toJSONString(attrList);
//					out.print(jsonString);

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
				
					
		
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

}
}
