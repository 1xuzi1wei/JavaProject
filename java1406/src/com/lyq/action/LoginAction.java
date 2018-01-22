package com.lyq.action;

public class LoginAction {

	public LoginAction() {
		// TODO Auto-generated constructor stub
	}
	private User user;
	private String name;
	private String password;
	private String info;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String execute(){
		if(user.getDate() == null ||"".equals(user.getDate())){
			info="日期不能为空！";
		return "error";
		}else if(password == null || "".equals(password)){
			info="密码不能为空";
		return "error";
		}else if(name == null || "".equals(name)){
			info = "用户名不能为空";
			return "error";
		}else{
			return "success";
		}
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}
