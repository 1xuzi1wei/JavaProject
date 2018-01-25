package com.mr.servlet;

import org.hibernate.Session;

import com.mr.hibernate.HibernateInitialize;
import com.mr.product.Product;

public class GetProduct {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session = null;
		try{
			session = HibernateInitialize.getSession();
//			Product product = (Product)session.get(Product.class, new Integer(1));
			Product product = (Product)session.load(Product.class, new Integer(1));
			System.out.println("产品ID："+product.getId());
			System.out.println("产品名称："+product.getName());
			System.out.println("产品价格："+product.getPrice()+"元");
			System.out.println("生产厂商："+product.getFactory());
			System.out.println("产品备注："+product.getRemark());
		}catch(Exception e){
			System.out.println("对象装载失败");
			e.printStackTrace();
		}finally{
			HibernateInitialize.closeSession();
		}
	}

}
