package com.lyq.bean;

import java.io.UnsupportedEncodingException;

public class CharactorEncoding {

	public CharactorEncoding() {
		// TODO Auto-generated constructor stub
	}
	public String toString(String str)
	{
//×ª»»×Ö·û	
		String text ="";
		if(str != null && !"".equals(str))
		{
			try {
				
				text = new String(str.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
		return text;
	}
}

