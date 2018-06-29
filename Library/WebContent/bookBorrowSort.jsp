<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.BorrowDAO" %>
<%@ page import="com.mr.actionForm.ReaderForm" %>
<%@ page import="com.mr.actionForm.BorrowForm" %>
<%@ page import="java.util.*"%>
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
		当前位置：图书借阅排行榜 &gt;&gt;&gt;
	</td>
</tr>
</table>

<form name="form1" method="post" action="borrow?action=bookRemind">
<% 
@SuppressWarnings("unchecked")
ArrayList<BorrowForm> coll=(ArrayList<BorrowForm>)request.getAttribute("bookBorrowSort");
if(coll==null && coll.isEmpty()){
	%>
	<table>
			<tr>
           	 	<td height="295" width="100%">&nbsp;</td>
            </tr>
	</table>
	<table>
	<tr>
		<td>暂无图书借阅信息！</td>
	</tr>
	</table>
	
	<% 
}else{
	Iterator<BorrowForm> it=coll.iterator();
	  int degree = 0;
	  String bookname="";
	  String typename="";
	  String bookbarcode="";
	  String bookcase="";
	  String pub="";
	  String author="";
	  double price=0.0;
%>
<table>
<tr align="center">
	<td>图书条形码</td>
	<td>图书名称</td>
	<td>图书类型</td>
	<td>书架</td>
	<td>出版社</td>
	<td>作者</td>
	<td>定价（元）</td>
	<td>借阅次数</td>
</tr>
<%
	while(it.hasNext()){
		BorrowForm borrowForm = (BorrowForm)it.next();
		bookname=borrowForm.getBookName();
        bookbarcode=borrowForm.getBookBarcode();
        typename=borrowForm.getBookType();
		degree=borrowForm.getDegree();
		bookcase=borrowForm.getBookcaseName();
        pub=borrowForm.getPubName();
        author=borrowForm.getAuthor();
        price=borrowForm.getPrice();
		%>
<tr align="center">
	<td><%=bookbarcode %></td>
	<td><%=bookname %></td>
	<td><%=typename %></td>
	<td><%=bookcase %></td>
	<td><%=pub %></td>
	<td><%=author %></td>
	<td><%=price %></td>
	<td><%=degree %></td>
</tr>
		<% 	
	}
}
%>
</table>
</form>

<%@ include file="copyright.jsp"%>
</body>
</html>