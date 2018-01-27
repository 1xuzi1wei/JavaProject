package com.mr.main;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.mr.user.User;

public class Manager {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Resource resource = new ClassPathResource("applicationContext.xml");
		@SuppressWarnings("deprecation")
		BeanFactory factory = new XmlBeanFactory(resource);
		User user = (User)factory.getBean("user");
        System.out.println("用户姓名——"+user.getName());//输出用户的姓名
        System.out.println("用户年龄——"+user.getAge());//输出用户的年龄
        System.out.println("用户性别——"+user.getSex());//输出用户的性别
	}

}
