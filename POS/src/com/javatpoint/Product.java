    package com.javatpoint;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.pos.models.Order;
import com.pos.models.OrderItem;
import com.pos.models.Table;

public class Product {  
    private int id;  
    private String name;  
    private float price;  
    public int getId() {  
        return id;  
    }  
    public void setId(int id) {  
        this.id = id;  
    }  
    public String getName() {  
        return name;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
    public float getPrice() {  
        return price;  
    }  
    public void setPrice(float price) {  
        this.price = price;  
    }  
      
    public String execute(){  
        return "success";  
    }  
    public static void main(String[] args) {
    	Table t = new Table();
    	Order o = new Order();
    	OrderItem oi = new OrderItem();
    	ArrayList orderItems = new ArrayList<OrderItem>();
    	
    	oi.setItemCode(1);
    	oi.setItemName("orderItem1");
    	oi.setItemPrice(10);
    	oi.setQuantity(3);
    	
    	orderItems.add(oi);
    	
    	o.setOrderItems(orderItems);
    	ArrayList<Order> orders = new ArrayList<>();
    	orders.add(o);
    	t.setOrders(orders);
    	Gson gson = new Gson();
    	String jsonInString = gson.toJson(t);
    	System.out.println(jsonInString);

	}
    }  