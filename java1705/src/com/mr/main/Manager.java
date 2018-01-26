package com.mr.main;

import java.util.Iterator;
import java.util.Set;

import org.hibernate.Session;

import com.mr.hibernate.HibernateInitialize;
import com.mr.role.Role;
import com.mr.user.User;

public class Manager {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session = null;
		try{
			session = HibernateInitialize.getSession();
			session.beginTransaction();
			User user = (User)session.get(User.class, new Integer("1"));
			Set<Role> roles = user.getRoles();
			@SuppressWarnings("rawtypes")
			Iterator it1 = roles.iterator();
			while(it1.hasNext()){
				Role role1 = (Role) it1.next();
				System.out.print(role1.getRoleName()+"||");
			}
			System.out.println();
			System.out.println("******************");
			Role role = (Role)session.get(Role.class, new Integer("2"));
			Set<User> users = role.getUsers();
			@SuppressWarnings("rawtypes")
			Iterator it2 = users.iterator();
			while(it2.hasNext()){
				User user1 = (User) it2.next();
				System.out.print(user1.getName()+"||");
			}
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			HibernateInitialize.closeSession();
		}
	}

}
