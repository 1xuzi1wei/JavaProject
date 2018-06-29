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

<tr>
	<td valign="top" class="word_orange">
		当前位置：图书管理 &gt;&gt;&gt;
	</td>
</tr>

</table>
<!-- <table> -->
<!-- 			<tr> -->
<!--            	 	<td height="295" width="100%">&nbsp;</td> -->
<!--             </tr> -->
<!-- </table> -->
<table>

<tr>
<td>
<a href="bookType?action=bookTypeQuery" class="word_dark" style="CURSOR:hand">图书类型管理</a>
</td>
</tr>

<tr>
<td>
<a href="book?action=bookQuery" class="word_dark" style="CURSOR:hand">图书档案管理</a>
</td>
</tr>

</table>
<%@ include file="copyright.jsp"%>
</body>
</html>