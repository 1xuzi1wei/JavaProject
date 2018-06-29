<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.actionForm.ReaderTypeForm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<%
ReaderTypeForm readerTypeForm= (ReaderTypeForm) request.getAttribute("readerTypeModifyQuery");
int id=Integer.valueOf(readerTypeForm.getId());
String name=readerTypeForm.getName();
int number = readerTypeForm.getNumber();
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：读者管理 &gt; 读者类型管理&gt; 修改读者类型信息 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="readerType?action=readerTypeModify">
<table>
	<tr>
		<td> <a href="#" onClick="window.open('readerTypeAdd.jsp')">添加读者类型信息</a></td>
	</tr>	
</table>
<table>
<tr>
	<td>
		<input name="id" type="hidden" value="<%=id%>"> 
	</td>
</tr>
<tr>
	<td>类型名称：</td>
	<td>
		<input name="name" type="text" value="<%=name%>"> 
	</td>
</tr>
<tr>
	<td>可借数量：</td>
	<td>
		<input name="number" type="text" value="<%=number%>"> （本）
	</td>
</tr>
<tr>
    <td>
        <input name="Submit" type="submit" class="btn_grey" value="保存" onClick="return check(form1)">
        <input name="Submit1" type="reset" class="btn_grey" value="重置">
		<input name="Submit2" type="button" class="btn_grey" value="返回" onClick="history.back()">
	</td>
</tr>
</table>
</form>
</body>
</html>