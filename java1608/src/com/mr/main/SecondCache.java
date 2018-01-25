package com.mr.main;

import org.hibernate.Session;

import com.mr.hibernate.HibernateInitialize;
import com.mr.product.Product;

public class SecondCache {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			Session session1 = null;
			Session session2 = null;
			try{
				session1 = HibernateInitialize.getSession();
				session2 = HibernateInitialize.getSession();
				Product product1 = (Product)session1.get(Product.class, new Integer("1"));
				System.out.println("第一个Session装载对象");
				Product product2 = (Product)session2.get(Product.class, new Integer("1"));
				System.out.println("第二个Session装载对象");
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				HibernateInitialize.closeSession();
			}
	}

}
