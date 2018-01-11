<%@ page language="java" import="java.util.*" import = "java.net.URLEncoder"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>写入cookie信息，并保存Cookie</title>
    
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
    String user = URLEncoder.encode(request.getParameter("user"),"UTF-8");/* 获取用户名 */
    Cookie cookie = new Cookie("cookie",user+"#"+new Date().toString());/* 创建并且实例化cookie对象 */
    cookie.setMaxAge(60*60*24*30);/* 设置cookie保存30天 */
    response.addCookie(cookie);/* 保存cookie */
     %>
     <script type="text/javascript">window.location.href="index.jsp";</script>
  </body>
</html>
