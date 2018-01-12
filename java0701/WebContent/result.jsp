<%@ page language="java" import="java.util.*" import = "com.lyq.bean.Email" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证邮箱地址是否合法</title>
    
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
  <% 
  request.setCharacterEncoding("UTF-8");
  String mailAdd = request.getParameter("mailAdd");/* 获取邮箱地址 */
//   实例化Email，并对mailAdd进行赋值
 Email email = new Email(mailAdd);
 if(email.isEmail()){
 out.print(mailAdd+"<br>是一个标准的邮箱地址！<br>");
 }else
 {
 	out.print(mailAdd+"<br>不是一个标准的邮箱地址！<br>");
 }

  %>
  <a href= "index.jsp">返回</a>
  </body>
</html>
