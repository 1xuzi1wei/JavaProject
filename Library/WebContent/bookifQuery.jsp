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
ArrayList<BookForm> coll = (ArrayList<BookForm>)request.getAttribute("bookifQuery");
ChStr chStr=new ChStr();
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统查询 &gt; 图书档案查询 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="book?action=bookifQuery">
<table>
<tr>
	<td>请选择查询的依据：
	<select name="f" id="f" class="wenbenkuang">
		<option value="barcode" >条形码</option>
		<option value="typename">图书类型</option>
		<option value="bookname" selected>书名</option>
		<option value="author">作者</option>
		<option value="publishing">出版社</option>
		<option value="bookcaseName">书架</option>
	</select>
	<input name="key" id="key" type="text">
	<input type="submit" name="submit" class="btn_grey" value="查询">
	</td>
</tr>

</table>

<table>
<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
	<tr>
		<td align="center">暂无图书信息！</td>
	</tr>
	</table>
	</td>
</tr>
<%}else{
	Iterator<BookForm> it = coll.iterator();
	  int id=0;
	  String bookname="";
	  String typename="";
	  String barcode="";
	  String publishing="";
	  String bookcase="";
	  int storage = 0;  
	%>
</table>
<table>
<tr align="center">
	<td>图书名称</td>
	<td>图书类型</td>
	<td>条形码</td>
	<td>出版社</td>
	<td>书架</td>
</tr>
<%
while(it.hasNext()){
	BookForm bookForm=(BookForm)it.next();
	id=Integer.valueOf(bookForm.getId());
	bookname=bookForm.getBookname();
	barcode=chStr.nullToString(bookForm.getBarcode(),"&nbsp;");
	if(barcode == null){
		barcode = "";
	}
	typename=bookForm.getTypename();
	publishing=bookForm.getPublishing();
	bookcase=chStr.nullToString(bookForm.getBookcaseName(),"&nbsp;");
	%>
	<tr align="center">
    <td><a href="book?action=bookQuery&id=<%=id%>"><%=bookname%></a></td>
    <td><%=typename%></td>
    <td><%=barcode%></td>  
    <td><%=publishing%></td>
    <td><%=bookcase%></td>
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