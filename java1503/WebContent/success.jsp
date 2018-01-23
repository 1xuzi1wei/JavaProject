<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
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
    <div>
    <h2>用户注册信息</h2>
    <ul>
    <li>用户名：<s:property value="name"/></li>
    <li>密码：<s:property value="password"/></li>
<!--     <li>性别：<s:if test="sex==0">女</s:if> <s:else>男</s:else></li> -->
<!--     <li>省份：<s:property value="province"/></li> -->
<!--     <li>爱好：<s:property value="hobby"/></li> -->
    <li>描述：<s:property value="description"/></li>
    </ul>
    </div>
  </body>
</html>
