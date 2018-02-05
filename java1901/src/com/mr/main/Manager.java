package com.mr.main;

import org.springframework.aop.framework.ProxyFactory;

import com.mr.log.LoggerExecute;
import com.mr.target.Target;

public class Manager {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Target target = new Target();
		ProxyFactory di = new ProxyFactory();
		di.setTarget(target);
		di.addAdvice(new LoggerExecute());
		Target proxy = (Target)di.getProxy();
		proxy.execute("AOP的简单实现");
	}

}
