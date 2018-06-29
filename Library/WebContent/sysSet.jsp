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
		当前位置：系统设置 &gt;&gt;&gt;
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
<a href="library?action=libraryQuery" class="word_dark" style="CURSOR:hand">图书馆信息</a>
</td>
</tr>

<tr>
<td>
<a href="manager?action=managerQuery" class="word_dark" style="CURSOR:hand">管理员设置</a>
</td>
</tr>

<tr>
<td align="center">
<a href="parameter?action=parameterQuery" class="word_dark" style="CURSOR:hand">参数设置</a>
</td>
</tr>

<tr>
<td align="center">
<a href="bookCase?action=bookCaseQuery" class="word_dark" style="CURSOR:hand">书架设置</a>
</td>
</tr>

<tr>
<td align="center">
<a href="publishing?action=publishingQuery" class="word_dark" style="CURSOR:hand">出版社设置</a>
</td>
</tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>