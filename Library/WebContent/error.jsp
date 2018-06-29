<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误提示</title>
<%
String error = (String)request.getAttribute("error");
%>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<table style="width:100%;height:27;border:0; cellpadding:0; cellspacing:0;" >
	<tr>
	<td align="center" valign="middle" class="word_login">
	错误提示信息：<%=error %><br>
	<input name="Submit" type="submit" class="btn_grey" value="返回" onClick="history.back(-1)">
	            </td>
	</tr>
  </table>
</body>
</html>