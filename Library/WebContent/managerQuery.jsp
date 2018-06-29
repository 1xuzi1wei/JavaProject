<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.actionForm.ManagerForm"%>
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
ArrayList<ManagerForm> coll = (ArrayList<ManagerForm>)
request.getAttribute("managerQuery");
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统设置 &gt; 管理员设置 &gt;&gt;&gt;
	</td>
</tr>

<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
	<tr>
		<td align="center">暂无管理员信息！</td>
	</tr>
	<tr>
		<td> <a href="#" onClick="window.open('managerAdd.jsp')">添加管理员信息</a></td>
	</tr>
	</table>
	<%
	}else{
		Iterator<ManagerForm> it = coll.iterator();
		int id = 0;
		String name = "";
		int sysset = 0;
		int readerset = 0;
		int bookset = 0;
		int borrowback = 0;
		int sysquery = 0;
	%>
	</td>
</tr>
</table>
<table>
	<tr>
		<td> <a href="#" onClick="window.open('managerAdd.jsp')">添加管理员信息</a></td>
	</tr>
</table>
<table>
<tr>
	<td align="center">管理员名称</td>
	<td align="center">系统设置</td>
	<td align="center">读者管理</td>
	<td align="center">图书管理</td>
	<td align="center">图书借还</td>
	<td align="center">系统查询</td>
	<td align="center">权限设置</td>
	<td align="center">删除</td>
</tr>
<%
	while(it.hasNext()){	
 	 ManagerForm managerForm2 = it.next();
	 id = managerForm2.getId();
	 name = managerForm2.getName();
	 sysset = managerForm2.getSysset();
	 readerset = managerForm2.getReaderset();
	 bookset = managerForm2.getBookset();
	 borrowback = managerForm2.getBorrowback();
	 sysquery = managerForm2.getSysquery();
	
	%>
<tr>
	<td>
		<%=name %>
	</td>
	<td align="center">
	<input type="checkbox" class="noborder" name="checkbox"
	 value="checkbox" disabled="disabled" class="noborder"
	<%if(sysset == 1){out.println("checked");} %>>
	</td>
	<td align="center">
	<input type="checkbox" class="noborder" name="checkbox" 
	value="checkbox" disabled="disabled" class="noborder"
	<%if(readerset == 1){out.println("checked");} %>>
	</td>
	<td align="center">
	<input type="checkbox" class="noborder" name="checkbox" 
	value="checkbox" disabled="disabled" class="noborder"
	<%if(bookset == 1){out.println("checked");} %>>
	</td>
	
	<td align="center">
	<input type="checkbox" class="noborder" name="checkbox" 
	value="checkbox" disabled="disabled" class="noborder"
	<%if(borrowback == 1){out.println("checked");} %>>
	</td>
	<td align="center">
	<input type="checkbox" class="noborder" name="checkbox" 
	value="checkbox" disabled="disabled" class="noborder"
	<%if(sysquery == 1){out.println("checked");} %>>
	</td>
	<td align="center"><%if(!name.equals(mr)){%><a href="#" 
	onClick="window.open('manager?action=managerModifyQuery&id=<%=id%>')">
	权限设置</a><%}else{%>&nbsp;<%}%></td>
	<td align="center"><%if(!name.equals(mr)){%><a 
	href="manager?action=managerDel&id=<%=id%>">删除</a>
	<%}else{%>&nbsp;<%}%></td>
</tr>
<%
	}
}
%>
</table>
<%@ include file="copyright.jsp" %>
</body>
</html>