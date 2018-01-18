<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'navigation.jsp' starting page</title>
    
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
    <table width="901" height="128" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg.jpg">
  <tr>
    <td width="16" height="91">&nbsp;</td>
    <td width="885">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td style=" font-size:11pt; color:#FFFFFF"><b>${param.typeList}</b></td>
  </tr>
</table>
  </body>
</html>
