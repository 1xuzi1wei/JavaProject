package com.lyq.bean;

import java.io.Serializable;

public class Email implements Serializable{
	private static final long serialVersionUID = 1L;
	private boolean email ;
	/*Email��ַ*/
	private String mailAdd;
	public String getMailAdd() {
		return mailAdd;
	}
	public void setMailAdd(String mailAdd) {
		this.mailAdd = mailAdd;
	}
	/*Ĭ���޲εĹ��췽��*/
	public Email(){
	}
	public Email(String mailAdd){
		this.mailAdd = mailAdd;
	}
//�Ƿ���һ����׼��Email��ʽ
	public boolean isEmail(){
//		������ʽ
		String regex = "123";
//		matches()�������ж��ַ����Ƿ���������ʽƥ��
		if(mailAdd.matches(regex))
		{
			email = true;
		}
		return email;
	}
	
}
	
	
