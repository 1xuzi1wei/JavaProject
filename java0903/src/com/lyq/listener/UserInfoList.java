package com.lyq.listener;

import java.util.Vector;

public class UserInfoList {
	private static UserInfoList user = new UserInfoList();
	private Vector vector = null;
	public UserInfoList() {
		// TODO Auto-generated constructor stub
		this.vector = new Vector();
	}
	public static UserInfoList getInstance()
	{
		return user;
	}
//	增加用户
	public boolean adduserInfo(String user)
	{
		if(user != null)
		{
			this.vector.add(user);
			return true;
		}
		else
		{
		}return false;
	}
//	获取用户的列表
	public Vector getList()
	{
		return vector;
	}
//	移除用户
	public void removeUserInfo(String user)
	{
		if(user != null)
			vector.removeElement(user);
	}
}
