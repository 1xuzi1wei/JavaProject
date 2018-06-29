<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>

<table>

<tr align="center">
	<td valign="top" class="word_orange">
		当前位置：读者管理 &gt;&gt;&gt; 
	</td>
</tr>

</table>

<!-- <table> -->
<!-- 			<tr> -->
<!--            	 	<td height="295" width="100%">&nbsp;</td> -->
<!--             </tr> -->
<!-- </table> -->

<table >

<tr>
<td>
<a href="readerType?action=readerTypeQuery" class="word_dark" style="CURSOR:hand">读者类型管理</a>
</td>
</tr>

<tr>
<td align="center">
<a href="reader?action=readerQuery" class="word_dark" style="CURSOR:hand">读者档案管理</a>
</td>
</tr>

</table>
<%@ include file="copyright.jsp"%>
</body>
</html>