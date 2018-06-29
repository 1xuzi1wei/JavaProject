<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.actionForm.PublishingForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<%
String mr = "mr";
@SuppressWarnings("unchecked")
ArrayList<PublishingForm> coll = (ArrayList<PublishingForm>)request.getAttribute("publishingQuery");


%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统设置 &gt; 出版社设置 &gt;&gt;&gt;
	</td>
</tr>
<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
	<tr>
		<td align="center">暂无出版社信息！</td>
	</tr>
	<tr>
		<td> <a href="#" onClick="window.open('publishingAdd.jsp')">添加出版社信息</a></td>
	</tr>
	</table>
	<%
	}else{
		Iterator<PublishingForm> it = coll.iterator();
		String isbn = "";
		String pubname = "";	
		%>
	</td>
</tr>
</table>
<table>
	<tr>
		<td> <a href="#" onClick="window.open('publishingAdd.jsp')">添加出版社信息</a></td>
	</tr>
</table>
<table >
<tr align="center">
	<td>ISBN</td>
	<td>出版社名称</td>
	<td>修改</td>
	<td>删除</td>
	</tr>
<%
	while(it.hasNext()){
	 PublishingForm publishingForm = (PublishingForm)it.next();
	 isbn = publishingForm.getIsbn();
	 pubname = publishingForm.getPubname();	
	 %>
<tr align="center">
	<td>
		<%=isbn %>
	</td>
	<td>
		<%=pubname %>
	</td>
	<td><a href="#" onClick="window.open('publishing?action=publishingModifyQuery&isbn=<%=isbn%>')">修改</a></td>
	<td><a href="#" onClick="window.open('publishing?action=publishingDel&isbn=<%=isbn%>')">删除</a></td>
</tr>
<%
	}
}
%>
</table>
<%@include file="copyright.jsp" %>
</body>
</html>