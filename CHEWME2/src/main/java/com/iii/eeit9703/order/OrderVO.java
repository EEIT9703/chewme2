package com.iii.eeit9703.order;

import java.sql.Date;
import java.sql.Timestamp;

import com.iii.eeit9703.member.model.MemVO;

public class OrderVO {
	private Integer orderId;
	private String orderNumber;
	private String orderName;
	private Integer orderPeople;
	private Integer orderPrice;
	private Timestamp orderTime;
	private Integer orderStatus;
	private Integer actID;
	private MemVO memVO;
	
	
	public Integer getActID() {
		return actID;
	}
	public void setActID(Integer actID) {
		this.actID = actID;
	}
	public MemVO getMemVO() {
		return memVO;
	}
	public void setMemVO(MemVO memVO) {
		this.memVO = memVO;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public Integer getOrderPeople() {
		return orderPeople;
	}
	public void setOrderPeople(Integer orderPeople) {
		this.orderPeople = orderPeople;
	}
	public Integer getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Timestamp getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	
}
