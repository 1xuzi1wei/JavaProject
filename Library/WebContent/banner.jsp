<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息栏</title>
</head>

<body>
<%
String manager =(String) session.getAttribute("manager");
if(manager == null||"".equals(manager)){
	response.sendRedirect("login.jsp");
}
%>
<table>
	<tr>
		<td align="center">
		当前登录用户：<%=manager %>
		</td>
	</tr>
</table>
</body>
</html>