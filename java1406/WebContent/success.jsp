<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
     <p align="center" class="STYLE1">&nbsp;</p>
 <p align="center" class="STYLE1">&nbsp;</p>
 <p align="center" class="STYLE1">转换成功！</p>
 <div align="center">
   <table width="211" border="1">
     <tr>
       <td width="116" bgcolor="#FFCCFF"><div align="center">用户名：</div></td>
       <td width="79"><s:property value="name"/></td>
     </tr>
     <tr>
       <td bgcolor="#FFCCFF"><div align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码：</div></td>
       <td><s:property value="password"/></td>
     </tr>
     <tr>
       <td bgcolor="#FFCCFF"><div align="center">出生日期：</div></td>
       <td><s:property value="user.date"/></td>
     </tr>
   </table>
 </div>
  </body>
</html>
