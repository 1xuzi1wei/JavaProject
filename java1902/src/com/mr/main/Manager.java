package com.mr.main;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.mr.dao.UserDAO;
import com.mr.user.User;

@SuppressWarnings("deprecation")
public class Manager {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Resource resource = new ClassPathResource("applicationContext.xml");
		BeanFactory factory = new XmlBeanFactory(resource);
		User user = new User();
		user.setId(new Integer(1));
		user.setName("张三");
		user.setAge(new Integer(30));//设置年龄
        user.setSex("男");//设置性别
		UserDAO userDAO = (UserDAO) factory.getBean("userDAO");
        userDAO.inserUser(user);
        System.out.println("数据添加成功!!!");
	}

}
