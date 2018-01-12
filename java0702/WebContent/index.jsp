<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>获取JavaBean属性信息</title>
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
  <jsp:useBean id="produce" class="com.lyq.bean.Produce"></jsp:useBean>
  <ul>
  <li>
  商品名称：<jsp:getProperty property="name" name="produce"/>
  </li>
    <li>
价格：<jsp:getProperty property="price" name="produce"/>
</li>
  <li>
  数量：<jsp:getProperty property="count" name="produce"/>
  </li>
    <li>
   厂址 ：<jsp:getProperty property="factoryAdd" name="produce"/>
  </li>
  </ul>
  </body>
</html>
