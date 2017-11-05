package com.iii.eeit9703.order;

import java.util.List;



public interface Order_interface {
	public void insert(OrderVO orderVO);
	public List<OrderVO> getAll();
	
}
