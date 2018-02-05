package com.mr.log;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class LoggerExecute implements MethodInterceptor{
	public Object invoke(MethodInvocation invocation) throws Throwable{
		before();
		invocation.proceed();
		return null;
	}

	private void before() {
		// TODO Auto-generated method stub
		System.out.println("程序开始执行！");
	}
}
