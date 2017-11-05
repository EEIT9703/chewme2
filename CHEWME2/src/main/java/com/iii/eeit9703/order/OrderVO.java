package com.iii.eeit9703.order;

import java.sql.Date;

import com.iii.eeit9703.member.model.MemVO;

public class OrderVO {
	private Integer orderId;
	private String orderNumber;
	private String orderName;
	private Integer orderPeople;
	private Integer orderPrice;
	private Date orderTime;
	private Integer orderStatus;
	private MemVO memVO;
	
	
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
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	
}
