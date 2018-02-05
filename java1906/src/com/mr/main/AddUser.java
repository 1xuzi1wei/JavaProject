package com.mr.main;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import com.mr.dao.UserDAO;
import com.mr.user.User;
@SuppressWarnings("deprecation")
public class AddUser {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	        Resource resource = new ClassPathResource("applicationContext.xml");//获取配置文件
	        BeanFactory factory = new XmlBeanFactory(resource);
	        UserDAO userDAO = (UserDAO)factory.getBean("userDAO");//获取UserDAO
	        User user = new User();
	        user.setName("Spring与Hibernate整合");//设置姓名
	        user.setAge(20);//设置年龄
	        user.setSex("男");//设置性别
	        userDAO.insert(user);//执行用户添加的方法
	        System.out.println("添加成功！");
	}

}
