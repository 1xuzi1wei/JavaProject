package com.lyq.action;

import com.opensymphony.xwork2.ActionSupport;
public class GreetingAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public GreetingAction() {
		// TODO Auto-generated constructor stub
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	private String username;
	public String execute(){
		if(username == null || "".equals(username)){
			return ERROR;
		}else{
		return SUCCESS;
		}
	}

}
