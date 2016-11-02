package com.pos.models;

import java.util.ArrayList;
import java.util.List;

public class Table {
	
	
	private boolean isBilled;
	private ArrayList<Order> orders;
	
	public boolean isBilled() {
		return isBilled;
	}
	public void setBilled(boolean isBilled) {
		this.isBilled = isBilled;
	}
	public ArrayList<Order> getOrders() {
		return orders;
	}
	public void setOrders(ArrayList<Order> orders) {
		this.orders = orders;
	}
	

}
