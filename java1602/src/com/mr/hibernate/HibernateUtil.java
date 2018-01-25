package com.mr.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();
	private static SessionFactory sessionFactory = null;
	//��̬��
	static{
		try{
			// ����Hibernate�����ļ�
		Configuration cfg = new Configuration().configure();
		sessionFactory = cfg.buildSessionFactory();
		}catch(Exception e){
			System.err.println("�����Ự����ʧ��");
			e.printStackTrace();
		}
	}
//	��ȡSession
	public static Session getSession(){
		Session session = threadLocal.get();
		if(session == null||!session.isOpen()){
			if(sessionFactory == null){
				rebuildSessionFactory();
			}
			session = (sessionFactory != null)? sessionFactory.openSession():null;
			threadLocal.set(session);
		}
		return session;
	}
	/**
     * �ؽ��Ự����
     */
public static void rebuildSessionFactory() {
	// TODO Auto-generated method stub
	try{
		// ����Hibernate�����ļ�
	Configuration cfg = new Configuration().configure();
	sessionFactory = cfg.buildSessionFactory();
	}catch(Exception e){
		System.err.println("�����Ự����ʧ��");
		e.printStackTrace();
	}
}
//��ȡSessionFactory����
public static SessionFactory getSessionFactory(){
	return sessionFactory;
}
//�ر�Session
public static void closeSession(){
	Session session = (Session)threadLocal.get();
	threadLocal.set(null);
	if(session != null){
		session.close();
	}
}

}
