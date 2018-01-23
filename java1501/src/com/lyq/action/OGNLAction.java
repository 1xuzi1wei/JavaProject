package com.lyq.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OGNLAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private Student student;
	private Map<String,Object> request;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	@SuppressWarnings("unchecked")
	public OGNLAction() {
		// TODO Auto-generated constructor stub
	student = new Student();
	student.setId(1);
	student.setName("’≈»˝");
	name = "tom";
	request = (Map<String,Object>)ActionContext.getContext().get("request");
	}
	public String execute(){
		request.put("info","request≤‚ ‘");
		return SUCCESS;
	}
}
