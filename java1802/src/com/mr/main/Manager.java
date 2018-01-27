package com.mr.main;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.mr.user.User;

@SuppressWarnings("deprecation")
public class Manager {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			Resource resource = new ClassPathResource("applicationContext.xml");            //装载配置文件
	        BeanFactory factory = new XmlBeanFactory(resource);
	        User user = (User) factory.getBean("user");                                    //获取Bean
	        user.printInfo();//输出JavaBean的属性值
	}

}
