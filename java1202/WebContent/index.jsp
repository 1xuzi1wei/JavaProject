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
  <ul>
     <li>定义request范围内的变量username</li>
<br>
<c:set var="username" value="明日科技" scope="request"></c:set>
<c:out value="username的值为：${username}"></c:out>
<li>定义request范围内的变量username</li>
<jsp:useBean id="userInfo" class="com.wgh.UserInfo">
<c:set target="${userInfo}" property="name">wgh</c:set>
<br>
<c:out value="UserInfo的name的属性值为：${userInfo.name}"></c:out>
<li>移除request范围内的变量username</li>
<br>
<c:remove var="username" scope="request"></c:remove>
username的值为：<c:out value="${username}" default="空"></c:out>
<br>
</jsp:useBean>
<c:catch var="error">
<jsp:useBean id="userInfo1" class="com.wgh.UserInfo">
<c:set target="${userInfo1}" property="pwd">
111
</c:set>
</jsp:useBean>
</c:catch>
<c:out value="${error}"></c:out>
  </ul>
 

  </body>
</html>
