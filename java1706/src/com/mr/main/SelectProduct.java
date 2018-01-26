package com.mr.main;

import org.hibernate.Session;

import com.mr.hibernate.HibernateInitialize;
import com.mr.people.People;

public class SelectProduct {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session = null;			//声明第一个Session对象
		try {
			//Hibernate的持久化操作
			session = HibernateInitialize.getSession();//获取Session
			session.beginTransaction();//事务开启
			People people = (People) session.load(People.class, new Integer("1"));//装载对象
			session.delete(people);
//			System.out.println("姓名："+people.getName());
//			System.out.println("年龄："+people.getSex());
//			System.out.println("身份证号："+people.getIdcard().getIdcard_code());
			session.getTransaction().commit();//事务提交
	}catch(Exception e){
		e.printStackTrace();
		session.getTransaction().rollback();//事务回滚
	}finally{
		HibernateInitialize.closeSession();//关闭Session
	}

}
}
