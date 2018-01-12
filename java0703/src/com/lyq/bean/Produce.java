package com.lyq.bean;

public class Produce {

	public Produce() {
		// TODO Auto-generated constructor stub
	}
//	商品名称
	private String name = "吉他";
//	商品价格
	private double price = 1880.5;
//	商品数量
	private int count = 100;
//	商品出厂厂址
	private String factoryAdd = "吉林省长春市琴行";
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getFactoryAdd() {
		return factoryAdd;
	}
	public void setFactoryAdd(String factoryAdd) {
		this.factoryAdd = factoryAdd;
	}
	

}
