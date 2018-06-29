<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.actionForm.ManagerForm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<%
ManagerForm managerForm2 = (ManagerForm)request.getAttribute("managerModifyQuery");
int id = Integer.valueOf(managerForm2.getId());
String name = managerForm2.getName();
System.out.println("权限设置中管理员的名字："+name);
int sysset = managerForm2.getSysset();
int readerset = managerForm2.getReaderset();
int bookset = managerForm2.getBookset();
int borrowback = managerForm2.getBorrowback();
int sysquery = managerForm2.getSysquery();
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统设置 &gt; 管理员设置&gt; 修改管理员信息 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="manager?action=managerModify">
<table align="center">
<tr>
	<td>管理员名称：</td>
	<td>
		<input name="id" type="hidden" value="<%=id%>">
		<input name="name" type="text" readonly="readonly" value="<%=name%>">
	</td>
</tr>
<tr>
	<td align="center">拥有的权限：</td>
	<td>
		<table align="center">
			<tr>
				<td>
				<input type="checkbox" class="noborder" name="sysset" id="sysset" value="1"
				<%if(sysset == 1){out.println("checked");} %>>
				系统设置
				</td>
				
				<td>
				<input type="checkbox" class="noborder" name="readerset" id="readerset" value="1"
				<%if(readerset == 1){out.println("checked");} %>>
				读者管理
				</td>
			</tr>
			
			<tr>
				<td>
				<input type="checkbox" class="noborder" name="bookset" id="bookset" value="1"
					<%if(bookset == 1){out.println("checked");} %>>
				图书管理
				</td>
				
				<td>
				<input type="checkbox" class="noborder" name="borrowback" id="borrowback" value="1"
						<%if(borrowback == 1){out.println("checked");} %>>
				图书借还	
				</td>
			</tr>
			<tr>
				<td>
				<input type="checkbox" class="noborder" name="sysquery" id="sysquery" value="1"
					<%if(sysquery == 1){out.println("checked");} %>>
				系统查询
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
			<td>&nbsp;</td>
			<td>
				<input name="submit" type="submit" value="保存" class="btn_grey">&nbsp;
				<input name="button1" type="button" value="关闭" class="btn_grey" onClick="window.close();">
				<input name="button2" type="button" value="返回" class="btn_grey" onClick="history.back(-1)">
			</td>
</tr>
</table>
</form>
<%@include file="copyright.jsp" %>
</body>
</html>