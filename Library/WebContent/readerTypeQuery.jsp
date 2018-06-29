<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.actionForm.ReaderTypeForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<%
@SuppressWarnings("unchecked")
ArrayList<ReaderTypeForm> coll = (ArrayList<ReaderTypeForm>)request.getAttribute("readerTypeQuery");
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：读者管理 &gt; 读者类型管理 &gt;&gt;&gt;
	</td>
</tr>

<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
	<tr>
		<td align="center">暂无读者类型信息！</td>
	</tr>
	<tr>
		<td> <a href="#" onClick="window.open('readerTypeAdd.jsp')">添加读者类型信息</a></td>
	</tr>
	</table>
	</td>
</tr>
<%}else{
	Iterator<ReaderTypeForm> it = coll.iterator();
	 int id = 0;
	 String name= "";
	 int number = 0;
	%>
</table>
<table>
	<tr>
		<td> <a href="#" onClick="window.open('readerTypeAdd.jsp')">添加读者信息</a></td>
	</tr>
</table>
<table>
<tr align="center">
	<td>读者类型名称</td>
	<td>可借数量</td>
	<td>修改</td>
	<td>删除</td>
</tr>
<%
while(it.hasNext()){
	ReaderTypeForm readerTypeForm=(ReaderTypeForm)it.next();
	id=Integer.valueOf(readerTypeForm.getId());
	name=readerTypeForm.getName();
	number=readerTypeForm.getNumber();
	%>
	<tr align="center">
    <td><%=name%></td>  
    <td><%=number%></td>
    <td><a href="readerType?action=readerTypeModifyQuery&id=<%=id%>">修改</a></td>
    <td><a href="readerType?action=readerTypeDel&id=<%=id%>">删除</a></td>
  </tr>
	<%
	}
}
%>

</table>
<%@ include file="copyright.jsp"%>
</body>
</html>