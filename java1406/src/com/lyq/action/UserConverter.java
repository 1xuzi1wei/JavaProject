package com.lyq.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class UserConverter {

	public UserConverter() {
		// TODO Auto-generated constructor stub
	}

	//ʵ�ֽ��ַ�������ת���ɸ������͵ķ���
    @SuppressWarnings("rawtypes")
	public Object convertFromString(Map context, String[] values, 
		Class toClass)
	{
		//����һ��Userʵ��
		 User user = new User();
		SimpleDateFormat format1=new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date1 = format1.parse(values[0]);
			SimpleDateFormat format2=new SimpleDateFormat("yyyy/MM/dd");
			String birthday=format2.format(date1);
			//ΪUserʵ����ֵ
			user.setDate(birthday);
			//����ת������Userʵ��		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
    }
    //ʵ�ֽ���������ת�����ַ������͵ķ���
    @SuppressWarnings("rawtypes")
	public String convertToString(Map context, Object o)
	{
		//����Ҫת����ֵǿ������ת��ΪUserʵ��
		User user = (User) o; 
		return "<" + user.getDate()+">";
    }
}
