<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>页面重定向</title>
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
    String user = request.getParameter("user").toString();/* 获取用户名 */
    String password = request.getParameter("pwd").toString();/* 获取密码 */
    if("mr".equals(user)&&"mrsoft".equals(password))/* 如果用户输入的用户或者密码错误时，将会跳转错误处理页面 */
    {
    out.println(" <script type='text/javascript'>alert('登录成功！');window.location.href='login.jsp';</script>");
    }else{
    response.sendRedirect("error.jsp");
    }
     %>
     
    
  </body>
</html>
