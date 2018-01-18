<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <c:set var="hours">
  <%=new Date().getHours() %>
  </c:set>
  <c:set var="second">
  <%=new Date().getMinutes() %>
  </c:set>
  <c:choose>
  <c:when test="${hours>1 && hours<6 }">早上好</c:when>
  <c:when test="${hours>6 && hours<11 }">上午好</c:when>
  <c:when test="${hours>11 && hours<17 }">下午好</c:when>
  <c:when test="${hours>17 && hours<24 }">晚上好</c:when>
  </c:choose>
  现在的时间是：${hours}:${second}
  </body>
</html>
