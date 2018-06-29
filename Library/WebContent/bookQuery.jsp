<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.BookDAO" %>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.actionForm.BookForm"%>
<%@ page import="com.mr.core.ChStr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<%
@SuppressWarnings("unchecked")
ArrayList<BookForm> coll = (ArrayList<BookForm>)request.getAttribute("bookQuery");
ChStr chStr=new ChStr();
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：图书管理 &gt; 图书档案管理 &gt;&gt;&gt;
	</td>
</tr>

<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
	<tr>
		<td align="center">暂无图书信息！</td>
	</tr>
	<tr>
		<td> <a href="#" onClick="window.open('bookAdd.jsp')">添加图书信息</a></td>
	</tr>
	</table>
	</td>
</tr>
<%}else{
	Iterator<BookForm> it = coll.iterator();
	  int id=0;
	  String barcode= "";
	  String bookname= "";
	  String typename= "";
	  String author = "";
	  String publishing= "";
	  Double price = 0.0;
	  int pages = 0;
	  String bookcase= "";
	  String intime= "";
	  String operator="";
	%>
</table>
<table>
	<tr>
		<td> <a href="#" onClick="window.open('bookAdd.jsp')">添加图书信息</a></td>
	</tr>
</table>
<table align="center">
<tr align="center">
	<td>图书名称</td>
	<td>图书类型</td>
	<td>条形码</td>
	<td>作者</td>
	<td>出版社</td>
	<td>价格</td>
	<td>页码</td>
	<td>录入时间</td>
	<td>书架</td>
	<td>操作员</td>
	<td>修改</td>
	<td>删除</td>
</tr>
<%
while(it.hasNext()){
	BookForm bookForm=(BookForm)it.next();
	id=Integer.valueOf(bookForm.getId());
	bookname=bookForm.getBookname();
	barcode=chStr.nullToString(bookForm.getBarcode(),"&nbsp;");
	typename=bookForm.getTypename();
	author=bookForm.getAuthor();
	price=bookForm.getPrice();
	pages=bookForm.getPage();
	intime=bookForm.getInTime();
	publishing=bookForm.getPublishing();
	operator=bookForm.getOperator();
	bookcase=chStr.nullToString(bookForm.getBookcaseName(),"&nbsp;");
	%>
	<tr align="center">
    <td><%=bookname%></td>
    <td><%=typename%></td>
    <td><%=barcode%></td> 
    <td><%=author%></td> 
    <td><%=publishing%></td>
    <td><%=price%></td>
    <td><%=pages%></td>
    <td><%=intime%></td>
    <td><%=bookcase%></td>
    <td><%=operator %></td>
    <td><a href="book?action=bookModifyQuery&id=<%=id%>">修改</a></td>
    <td><a href="book?action=bookDel&id=<%=id%>">删除</a></td>
  </tr>
	<%
	}
}
%>

</table>
<%@ include file="copyright.jsp"%>
</body>
</html>