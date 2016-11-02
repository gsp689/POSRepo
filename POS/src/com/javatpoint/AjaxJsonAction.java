package com.javatpoint;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.pos.models.Order;
import com.pos.models.OrderItem;
import com.pos.models.Table;

public class AjaxJsonAction implements Action{

	private String tableData = new String();
	private String dummyMsg;
	//Parameter from Jquery
	private String tableNumber;

	public String execute() {
		Table t = new Table();
    	Order o = new Order();
    	OrderItem oi = new OrderItem();
    	ArrayList orderItems = new ArrayList<OrderItem>();
    	
    	oi.setItemCode(1);
    	oi.setItemName("orderItem1");
    	oi.setItemPrice(10);
    	oi.setQuantity(3);
    	
    	orderItems.add(oi);
    	orderItems.add(oi);
    	orderItems.add(oi);
    	
    	o.setOrderItems(orderItems);
    	ArrayList<Order> orders = new ArrayList<>();
    	orders.add(o);
    	orders.add(o);
    	t.setOrders(orders);
    	Gson gson = new Gson();
    	tableData = gson.toJson(t);
    	System.out.println(tableData);
        dummyMsg = "Ajax action Triggered";
        return SUCCESS;
	}


	public String getDummyMsg() {
	        return dummyMsg;
	}

	public void setDummyMsg(String dummyMsg) {
	        this.dummyMsg = dummyMsg;
	}

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	public String getTableData() {
		return tableData;
	}

	public void setTableData(String tableData) {
		this.tableData = tableData;
	}

}
