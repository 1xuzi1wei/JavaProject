package com.lyq.action;

public class Student {

	public Student() {
		// TODO Auto-generated constructor stub
	}
	private int id;
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
	private String name;
	
	public String say(){
		return "我是一个学生";
	}
}
