package com.itwillbs.ssb.db;

public class orderDTO {
	private String item_name;
	private String item_options_name;
	private String item_options_value;
	private int cart_quantity;
	private int item_price;
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_options_name() {
		return item_options_name;
	}
	public void setItem_options_name(String item_options_name) {
		this.item_options_name = item_options_name;
	}
	public String getItem_options_value() {
		return item_options_value;
	}
	public void setItem_options_value(String item_options_value) {
		this.item_options_value = item_options_value;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	
	@Override
	public String toString() {
		return "orderDTO [item_name=" + item_name + ", item_options_name=" + item_options_name + ", item_options_value="
				+ item_options_value + ", cart_quantity=" + cart_quantity + ", item_price=" + item_price + "]";
	}
}
