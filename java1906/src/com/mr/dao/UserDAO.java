package com.mr.dao;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.mr.user.User;
@Transactional
public class UserDAO extends HibernateDaoSupport{
	public void insert(User user){
		this.getHibernateTemplate().execute(new HibernateCallback<User>() {
			@Override
			public User doInHibernate(Session session) throws HibernateException {
				session.save(user);
				return null;
			}
	});
	}
}
