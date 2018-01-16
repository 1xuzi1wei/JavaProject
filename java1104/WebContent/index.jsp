<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <jsp:useBean id="user" scope="page" class="com.lyq.bean.UserInfo" type="com.lyq.bean.UserInfo"></jsp:useBean>
    <jsp:setProperty property="name" name="user" value="明日科技"/>
    ${pageScope.user.name}<br>
    <form action="deal.jsp">   
<!--     <input type="text" name="name"> -->
<!--     <input type="submit" value="提交"> -->
<!--     <input name="affect" type="checkbox" id="affect" value="登山">登山 -->
<!--     <input name="affect" type="checkbox" id="affect" value="游泳">游泳 -->
<!--     <input name="affect" type="checkbox" id="affect" value="慢走">慢走 -->
<!--     <input name="affect" type="checkbox" id="affect" value="晨跑">晨跑 -->
<!--     <input type="submit" value="提交"> -->
<!--     </form> -->
${header.connection}或${header["connection"]}<br>
${header["user-agent"]}<br>
版权所有：${initParam.company}<br>
<%
Cookie cookie=new Cookie("user","mrbccd");
response.addCookie(cookie);
 %>
 ${cookie.user.value}<br>
  </body>
</html>
