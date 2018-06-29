<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.BorrowDAO" %>
<%@ page import="com.mr.actionForm.BorrowForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统首页&gt;&gt;&gt;
	</td>
</tr>
</table>

<% 
BorrowDAO borrowDAO = new BorrowDAO();
ArrayList<BorrowForm> coll = (ArrayList<BorrowForm>)borrowDAO.bookBorrowSort();
if(coll == null && coll.isEmpty()){
	%>
	<table>
			<tr>
           	 	<td height="295" width="100%">&nbsp;</td>
            </tr>
	</table>
	<table align="center">
	<tr>
		<td>暂无图书借阅信息！</td>
	</tr>
	</table>
	
	<% 
}else{
	Iterator<BorrowForm> it=coll.iterator();
	  int i = 1;
	  int degree = 0;
	  String bookname="";
	  String typename="";
	  String bookbarcode="";
	  String bookcase="";
	  String pub="";
	  String author="";
	  double price=0.0;
%>
<table class="word_orange">
	<tr>
		<td>图书借阅排行榜</td>
	</tr>
	</table>
<table>
<tr align="center">
	<td>排名</td>
	<td>&nbsp;</td>
	<td>图书条形码</td>
	<td>&nbsp;</td>
	<td>图书名称</td>
	<td>&nbsp;</td>
	<td>图书类型</td>
	<td>&nbsp;</td>
	<td>书架</td>
	<td>&nbsp;</td>
	<td>出版社</td>
	<td>&nbsp;</td>
	<td>作者</td>
	<td>&nbsp;</td>
	<td>定价（元）</td>
	<td>&nbsp;</td>
	<td>借阅次数</td>
</tr>
<%
	while(it.hasNext() && i<6){
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
	<td> &nbsp;<%=i %></td>
	<td>&nbsp;</td>
	<td>&nbsp;<%=bookbarcode %></td>
	<td>&nbsp;</td>
	<td>&nbsp;<%=bookname %></td>
	<td>&nbsp;</td>
	<td>&nbsp;<%=typename %></td>
	<td>&nbsp;</td>
	<td>&nbsp;<%=bookcase %></td>
	<td>&nbsp;</td>
	<td>&nbsp;<%=pub %></td>
	<td>&nbsp;</td>
	<td>&nbsp;<%=author %></td>
	<td>&nbsp;</td>
	<td>&nbsp;<%=price %></td>
	<td>&nbsp;</td>
	<td>&nbsp;<%=degree %></td>
</tr>
		<% 	
		i++;
	}
}
%>
<tr align="right">
	<td><a href="borrow?action=bookBorrowSort">&nbsp;更多</a></td>
</tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>