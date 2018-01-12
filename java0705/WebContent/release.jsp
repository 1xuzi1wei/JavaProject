<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新闻信息发布</title>
    
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
  <jsp:useBean id="news" class="com.lyq.bean.News"></jsp:useBean>
   <jsp:useBean id="encoding" class="com.lyq.bean.CharactorEncoding"></jsp:useBean>
   <jsp:setProperty property="*" name="news"/><br>
   <div id="title">
   <%= encoding.toString(news.getTitle()) %>
   </div><br>
   <hr>
    <div id="content">
   <%= encoding.toString(news.getContent()) %>
   </div>
  </body>
</html>
