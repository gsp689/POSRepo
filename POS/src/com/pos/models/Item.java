package com.pos.models;


public class Item {

	private int itemCode;
	private String itemName;
	private double itemPrice;
	private boolean maintainStock;
	
	public int getItemCode() {
		return itemCode;
	}
	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public double getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}
	public boolean isMaintainStock() {
		return maintainStock;
	}
	public void setMaintainStock(boolean maintainStock) {
		this.maintainStock = maintainStock;
	}
	
	public String execute()  {
		// TODO Auto-generated method stub
		return "success";
	}
}
