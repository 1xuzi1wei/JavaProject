package com.mr.main;

import java.util.Iterator;
import java.util.Set;

import org.hibernate.Session;

import com.mr.factory.Factory;
import com.mr.hibernate.HibernateInitialize;
import com.mr.product.Product;

public class SelectProduct {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session = null;			//声明第一个Session对象
		try {
			//Hibernate的持久化操作
			session = HibernateInitialize.getSession();//获取Session
			session.beginTransaction();//事务开启
			Factory factory = (Factory) session.get(Factory.class, new Integer("1"));//装载对象
			System.out.println("生产商："+factory.getFactoryName());
			System.out.println("*********************");
			Set<Product> products = factory.getProducts();
			Iterator<Product> it = products.iterator();
			while(it.hasNext()){
				Product product = it.next();
			System.out.println("产品名称："+product.getName());
			System.out.println("产品价格："+product.getPrice()+"元");
			}
			session.getTransaction().commit();//事务提交
	}catch(Exception e){
		e.printStackTrace();
		session.getTransaction().rollback();//事务回滚
	}finally{
		HibernateInitialize.closeSession();//关闭Session
	}

}
}
