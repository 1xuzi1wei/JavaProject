<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.actionForm.BookCaseForm"%>
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
ArrayList<BookCaseForm> coll = (ArrayList<BookCaseForm>)request.getAttribute("bookCaseQuery");


%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统设置 &gt; 书架设置 &gt;&gt;&gt;
	</td>
</tr>
<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
	<tr>
		<td align="center">暂无书架信息！</td>
	</tr>
	<tr>
		<td> <a href="#" onClick="window.open('bookCaseAdd.jsp')">添加书架信息</a></td>
	</tr>
	</table>
	<%
	}else{
		Iterator<BookCaseForm> it = coll.iterator();
		int id = 0;
		String name = "";	
		%>
	</td>
</tr>
</table>
<table>
	<tr>
		<td> <a href="#" onClick="window.open('bookCaseAdd.jsp')">添加书架信息</a></td>
	</tr>
</table>
<table >
<tr align="center">
	<td>书架名称</td>
	<td>修改</td>
	<td>删除</td>
	</tr>
<%
	while(it.hasNext()){
	 BookCaseForm bookCaseForm = (BookCaseForm)it.next();
	 id = Integer.valueOf(bookCaseForm.getId());
	 name = bookCaseForm.getName();	
	 %>
<tr>
	<td align="center">
		<%=name %>
	</td>
	<td><a href="#" onClick="window.open('bookCase?action=bookCaseModifyQuery&id=<%=id%>')">修改</a></td>
	<td><a href="#" onClick="window.open('bookCase?action=bookCaseDel&id=<%=id%>')">删除</a></td>
</tr>
<%
	}
}
%>
</table>
<%@include file="copyright.jsp" %>
</body>
</html>