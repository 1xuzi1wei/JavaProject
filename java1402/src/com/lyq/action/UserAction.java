package com.lyq.action;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public UserAction() {
		// TODO Auto-generated constructor stub
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	private String info;
	public String add(){
		info = "添加用户信息";
		return "add";
	}
	public String update(){
		info = "更新用户信息";
		return "update";
	}

}
