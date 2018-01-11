<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script></script>
    <title>倒计时</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!--  
	<link rel="stylesheet" type="text/css" href="/style.css">
-->
  </head>
  
  <body>
    <table width="350" height="450" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="bottom" ><table width="346" height="418" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="76">		</td>
        <td width="270">
<div id="countDown"><b>——</b></div>
<script language="javascript">
countdown("2009年国庆节","10/1/2009",countDown);
</script>
		</td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
