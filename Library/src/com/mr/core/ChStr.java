package com.mr.core;

public class ChStr {
//	处理字符串中的空值
	public String nullToString(String v,String toV){
//		当输入变量v为空时
		if(v == null || "".equals(v)){
			v = toV;
		}
		return v;
		
	}
//	过滤危险字符
	public String filterStr(String str){
		str=str.replaceAll(";","");
		str=str.replaceAll("&","&amp;");
		str=str.replaceAll("<","&lt;");
		str=str.replaceAll(">","&gt;");
		str=str.replaceAll("'","");
		str=str.replaceAll("--"," ");
		str=str.replaceAll("/","");
		str=str.replaceAll("%","");
		return str;
	}

}
