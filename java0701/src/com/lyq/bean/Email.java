package com.lyq.bean;

import java.io.Serializable;

public class Email implements Serializable{
	private static final long serialVersionUID = 1L;
	private boolean email ;
	/*Email地址*/
	private String mailAdd;
	public String getMailAdd() {
		return mailAdd;
	}
	public void setMailAdd(String mailAdd) {
		this.mailAdd = mailAdd;
	}
	/*默认无参的构造方法*/
	public Email(){
	}
	public Email(String mailAdd){
		this.mailAdd = mailAdd;
	}
//是否是一个标准的Email格式
	public boolean isEmail(){
//		正则表达式
		String regex = "123";
//		matches()方法可判断字符串是否与正则表达式匹配
		if(mailAdd.matches(regex))
		{
			email = true;
		}
		return email;
	}
	
}
	
	
