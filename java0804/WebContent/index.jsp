<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <form action="RegServlet" method="post">
	<table align="center" width="450">
		<tr>
			<td align="center" colspan="2">
				<h2>用户注册</h2>
				<hr>
			</td>
		</tr>
		<tr>
			<td align="right">用户名：</td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td align="right">密码：</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td align="right">性别：</td>
			<td>
				<input type="radio" name="sex" value="男" checked="checked">男
				<input type="radio" name="sex" value="女">女
			</td>
		</tr>
		<tr>
			<td align="right">QQ号码：</td>
			<td><input type="text" name="qq" /></td>
		</tr>
		<tr>
			<td align="right">E-Mail地址：</td>
			<td><input type="text" name="mail" /></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="注　册">
			</td>
		</tr>
	</table>
</form>
  </body>
</html>
