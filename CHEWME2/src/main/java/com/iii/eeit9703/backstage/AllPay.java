package com.iii.eeit9703.backstage;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.json.*;
import javax.servlet.RequestDispatcher;
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
import com.iii.eeit9703.order.OrderDAO_hibernate;
import com.iii.eeit9703.order.OrderVO;
import com.iii.eeit9703.report.ReportDAO_hibernate;
import com.iii.eeit9703.report.ReportVO;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutDevide;


/**
 * Servlet implementation class activity
 */
@WebServlet("/allpay")
public class AllPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static AllInOne all;
	public static AioCheckOutDevide obj ;
   

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
			request.setCharacterEncoding("UTF-8");		
			response.setCharacterEncoding("UTF-8");
			String action =request.getParameter("action");
			Integer actID = Integer.parseInt(request.getParameter("actID"));
			Integer people = Integer.parseInt(request.getParameter("opt"));
			Integer price = Integer.parseInt(request.getParameter("price"));
	        HttpSession session = request.getSession();
   
	         if("goOrder".equals(action)){
				
	        	 	MemVO memVO=(MemVO) session.getAttribute("LoginOK");
	        	 	
	        	 	ActivityDAO_hibernate actDAO=new ActivityDAO_hibernate();	   	 	
	        	 	ActivityVO activityVO=actDAO.findByPrimaryKey(actID);
	        	 	
	        	 	//Date date=new Date(System.currentTimeMillis());
	        	 	Timestamp date=new Timestamp(System.currentTimeMillis());
	        	 	
	        	 	
	        	 	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	        	 	SimpleDateFormat sdFormat1 = new SimpleDateFormat("yyyyMMddHHmms");
	    			String strDate = sdFormat.format(date.getTime());
	    			String strDateNo=sdFormat1.format(date.getTime());
	    		
	    			
	        	 	OrderDAO_hibernate orderDAO=new OrderDAO_hibernate();
	        	 	OrderVO orderVO=new OrderVO();
	        	 	orderVO.setMemVO(memVO);
	        	 	orderVO.setOrderName(activityVO.getAct_name());
	        	 	orderVO.setOrderNumber(strDateNo);
	        	 	orderVO.setOrderPeople(people);
	        	 	orderVO.setOrderPrice(price);
	        	 	orderVO.setOrderStatus(0);
	        	 	orderVO.setOrderTime(date);
	        	 	orderVO.setActID(actID);
	        	 	orderDAO.insert(orderVO);
	        	
		 	
	           		Integer current =Integer.parseInt(activityVO.getAct_current());
	           	 	current = current+people;
	           	 	
	           	 	System.out.println(current);
	           
	           	 ActivityVO activityVO_result=new ActivityVO();
	           	 activityVO_result.setMemVO(memVO);
	           	 activityVO_result.setActID(actID);	      	 
//	           	 activityVO_result.setAct_name(activityVO.getAct_name());
//	           	 activityVO_result.setAct_groups(activityVO.getAct_groups());
	           	 activityVO_result.setAct_current(current.toString());
//	           	 activityVO_result.setBDate(activityVO.getBDate());
//	           	 activityVO_result.setEDate(activityVO.getEDate());
//	           	 activityVO_result.setActivity_state(activityVO.getActivity_state());
//	        	 activityVO_result.setAct_photo(activityVO.getAct_photo());
//	           	 activityVO_result.setAct_price(activityVO.getAct_price());
//	           	 activityVO_result.setAct_news(activityVO.getAct_news());
//	           	 activityVO_result.setSch_photo(activityVO.getSch_photo());
	          	
	           	actDAO.update(activityVO_result);
	           	 
	           	 
	           	 
	        			CollectionVO collectionVO =new CollectionVO();
	        			collectionVO.setMemVO(memVO);
	        			collectionVO.setActivityVO(activityVO);
	        			CollectionService ser =new CollectionService();
	        			ser.delete(collectionVO);	 	        	  	
    
	         //寫一個訂單VO放入訂單
			obj= new AioCheckOutDevide();					
			all = new AllInOne("");
			
			obj.setMerchantTradeNo(strDateNo);//訂單編號
			obj.setMerchantTradeDate(strDate); //訂單時間
			obj.setTotalAmount(price.toString());//金額
			obj.setTradeDesc("test Description");
			obj.setItemName(activityVO.getAct_name()+"__"+people+"人");
			obj.setReturnURL("https://tw.yahoo.com");//成功回到哪裡
			obj.setNeedExtraPaidInfo("N");
			obj.setHoldTradeAMT("0");
			obj.setUseRedeem("N");
		
			//obj.setCreditInstallment("3");
			obj.setInstallmentAmount(price.toString());
			String form = all.aioCheckOut(obj, null);						
			session.setAttribute("form",form);
	
//		  RequestDispatcher rd =                       // 準備將移轉程式的執行順序
//		                 request.getRequestDispatcher("/backage/allpay_list.jsp");
//		          rd.forward(request, response);               // 移轉程式的執行順序		   
		//response.sendRedirect("backage/allpay_list.jsp");
		
		return ; // forward()之後會有一個return敘述
		
	         }

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//catch (ServletException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		

}
}
