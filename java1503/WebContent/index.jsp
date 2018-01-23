<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:head/>
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
    <h2>用户注册</h2>
    <s:form action="userAction" method="post">
    <s:textfield name="name" label="用户名" required="true" requiredposition="left"></s:textfield>
   	<s:password name="password" label="密码" required="true" requiredposition="left"></s:password>
<!--    	<s:radio list="#{1:'男',0:'女'}" label="性别" required="true" requiredpositon="left"></s:radio> -->
<!--    	<s:select list="{'请选择省份','吉林','广东','山东','河南'}" name="province" label="省份"></s:select> -->
<!-- 	<s:checkboxlist list="{'足球','羽毛球','乒乓球','蓝球'}" name="hobby" label="爱好"></s:checkboxlist> -->
	<s:textarea name="description" cols="30" rows="5" label="描述"></s:textarea>
	<s:submit value="注册"></s:submit>
	<s:reset value="重置"></s:reset>
    </s:form>
  </body>
</html>
