package com.lyq.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	public TestAction() {
		// TODO Auto-generated constructor stub
		ActionContext context = ActionContext.getContext();
		request = (Map<String,Object>)context.get("request");
		session = context.getSession();
		application = context.getApplication();
	}
	private Map<String,Object> request;
	private Map<String,Object> session;
	private Map<String,Object> application;
		public String execute() {
			String info="明日科技";
			request.put("info", info);
			session.put("info", info);
			application.put("info", info);
			return SUCCESS;
		}
}
