<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getInfo.jsp' starting page</title>
    
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
  <jsp:useBean id="con" class="com.wgh.core.ConnDB" scope="page"></jsp:useBean>
  <ul>
  <%
  String sql = "select title from tb_bbsinfo order by id desc";
  ResultSet rs = con.executeQuery(sql);
  if(rs.next()){
  do{
	  out.print("<li>"+rs.getString(1)+"</li>");
	  }while(rs.next());
  }else{
 	  out.print("<li>暂时没有公告信息！</li>");
  }
   %>
  </ul>
  </body>
</html>
