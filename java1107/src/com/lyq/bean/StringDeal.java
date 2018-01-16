package com.lyq.bean;

public class StringDeal {

	public StringDeal() {
		// TODO Auto-generated constructor stub
	}
	public static String shiftEnter(String str){
		String newStr = str.replaceAll("\r\n", "<br>");
		newStr = newStr.replaceAll(" ", "&nbsp;");
		return newStr;
	}

}
