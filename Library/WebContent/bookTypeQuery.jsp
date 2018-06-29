<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.actionForm.BookTypeForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<%
@SuppressWarnings("unchecked")
ArrayList<BookTypeForm> coll = (ArrayList<BookTypeForm>)request.getAttribute("bookTypeQuery");
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：图书管理 &gt; 图书类型管理 &gt;&gt;&gt;
	</td>
</tr>

<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
	<tr>
		<td align="center">暂无图书类型信息！</td>
	</tr>
	<tr>
		<td> <a href="#" onClick="window.open('bookTypeAdd.jsp')">添加图书类型信息</a></td>
	</tr>
	</table>
	</td>
</tr>
<%}else{
	Iterator<BookTypeForm> it = coll.iterator();
	 int id = 0;
	 String typename= "";
	 int days = 0;
	%>
</table>
<table>
	<tr>
		<td> <a href="#" onClick="window.open('bookTypeAdd.jsp')">添加图书类型信息</a></td>
	</tr>
</table>
<table>
<tr align="center">
	<td>图书类型名称</td>
	<td>可借天数</td>
	<td>修改</td>
	<td>删除</td>
</tr>
<%
while(it.hasNext()){
	BookTypeForm bookTypeForm=(BookTypeForm)it.next();
	id=Integer.valueOf(bookTypeForm.getId());
	typename=bookTypeForm.getTypeName();
	days=bookTypeForm.getDays();
	%>
	<tr align="center">
    <td><%=typename%></td>  
    <td><%=days%></td>
    <td><a href="bookType?action=bookTypeModifyQuery&id=<%=id%>">修改</a></td>
    <td><a href="bookType?action=bookTypeDel&id=<%=id%>">删除</a></td>
  </tr>
	<%
	}
}
%>

</table>
<%@ include file="copyright.jsp"%>
</body>
</html>