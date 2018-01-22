package com.lyq.action;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public LoginAction() {
		// TODO Auto-generated constructor stub
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String username;
	private String password;
	public String execute(){
		if(username.equals("mr")&&password.equals("mrsoft")){
			return "success";
		}else{
			return "error";
		}
	}
	public String exit(){
		return "exit";
	}

}
