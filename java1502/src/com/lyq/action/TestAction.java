package com.lyq.action;

import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public TestAction() {
		// TODO Auto-generated constructor stub
	}
	public String execute() throws InterruptedException{
//		�߳�˯��1��
		Thread.sleep(1000);
		return SUCCESS;
	}

}
