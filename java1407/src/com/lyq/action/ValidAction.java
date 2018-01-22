package com.lyq.action;

import com.opensymphony.xwork2.ActionSupport;

public class ValidAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public ValidAction() {
		// TODO Auto-generated constructor stub
	}
	private String username;
	private String password;
	private String repassword;
	private String phone;
	private String info;
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
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String execute(){
		if(username==null||"".equals(username)){
			setInfo("�û�������Ϊ�գ�");
			return "error";
		}else if(password==null||"".equals(password)){
			setInfo("���벻��Ϊ�գ�");
		return "error";
		}else if(repassword==null|| "".equals(repassword)){
			setInfo("������������벻��Ϊ�գ�");
			return "error";
		}else if(!password.equals(repassword)){
			setInfo("��������������ԭ���벻һ�£�");
			return "error";
		}else if(phone == null || "".equals(phone)){
			setInfo("�绰����Ϊ�գ�");
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
