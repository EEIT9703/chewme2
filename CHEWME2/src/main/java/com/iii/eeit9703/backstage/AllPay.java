package com.iii.eeit9703.backstage;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import allPay.payment.integration.*;
import allPay.payment.integration.domain.*;

@WebServlet("/allpay")
public class AllPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static AllInOne all;
	public static AioCheckOutDevide obj ;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 request.setCharacterEncoding("UTF-8");       // 說明傳送到本程式之資料的內碼
	         String ID = request.getParameter("ID");//讀
	         String product = request.getParameter("product");//讀
	         String money = request.getParameter("money");//讀

	         
	         //寫一個訂單VO放入訂單
			obj= new AioCheckOutDevide();					
			all = new AllInOne("");
			
			obj.setMerchantTradeNo(ID);//訂單編號
			obj.setMerchantTradeDate("2017/10/13 14:16:38"); //訂單時間
			obj.setTotalAmount(money);//金額
			obj.setTradeDesc("test Description");
			obj.setItemName(product);
			obj.setReturnURL("https://developers.allpay.com.tw/AioMock/MerchantReturnUrl");//成功回到哪裡
			obj.setNeedExtraPaidInfo("N");
			obj.setHoldTradeAMT("0");
			obj.setUseRedeem("N");
			obj.setCreditInstallment("3");
			obj.setInstallmentAmount("10");
			String form = all.aioCheckOut(obj, null);
			request.setAttribute("form",form);
			
		
//			request.setAttribute("MerchantTradeNo",ID);
//			request.setAttribute("MerchantTradeDate","2017/01/01 08:05:23");
//			request.setAttribute("TotalAmount",money);
//			request.setAttribute("TradeDesc","test Description");
//			request.setAttribute("ItemName",product);
//			request.setAttribute("ReturnURL","https://developers.allpay.com.tw/AioMock/MerchantReturnUrl");//付款成功畫面
//			request.setAttribute("NeedExtraPaidInfo","N");
//			request.setAttribute("HoldTradeAMT","0");
//			request.setAttribute("UseRedeem","N");
//			request.setAttribute("CreditInstallment","3");
//			request.setAttribute("InstallmentAmount","10");
							
	          RequestDispatcher rd =                       // 準備將移轉程式的執行順序
	                 request.getRequestDispatcher("/backage/allpay2.jsp");
	          rd.forward(request, response);               // 移轉程式的執行順序
	          return ;                                     // forward()之後會有一個return敘述
	       } catch(UnsupportedEncodingException e) {
	          throw new ServletException(e); 
	       }
	}

	
		
	}
