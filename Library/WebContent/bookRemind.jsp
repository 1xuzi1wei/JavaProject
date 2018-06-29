<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		当前位置：系统查询 &gt; 借阅到期提醒 &gt;&gt;&gt;
	</td>
</tr>
</table>

<form name="form1" method="post" action="borrow?action=bookRemind">
<% 
ReaderForm readerForm= (ReaderForm) request.getAttribute("readerinfo");
@SuppressWarnings("unchecked")
ArrayList<BorrowForm> coll=(ArrayList<BorrowForm>)request.getAttribute("bookRemind");
if(coll == null && coll.isEmpty()){
	%>
	<table>
			<tr>
           	 	<td height="295" width="100%">&nbsp;</td>
            </tr>
	</table>
	<table>
	<tr>
		<td>暂无到期提醒信息！</td>
	</tr>
	</table>
	
	<% 
}else{
	Iterator<BorrowForm> it=coll.iterator();
	  String bookname="";
	  String bookbarcode="";
	  String readerbar="";
	  String readername="";
	  String borrowTime="";
	  String backTime="";
%>
<table align="center">
<tr>
	<td>&nbsp;</td>
</tr>
<tr align="center">
	<td>图书条形码</td>
	<td>&nbsp;</td>
	<td>图书名称</td>
	<td>&nbsp;</td>
	<td>读者条形码</td>
	<td>&nbsp;</td>
	<td>读者名称</td>
	<td>&nbsp;</td>
	<td>借阅时间</td>
	<td>&nbsp;</td>
	<td>应还时间</td>
</tr>
<%
	while(it.hasNext()){
		BorrowForm borrowForm = (BorrowForm)it.next();
		bookname=borrowForm.getBookName();
		bookbarcode=borrowForm.getBookBarcode();
		readerbar=borrowForm.getReaderBarcode();
		readername=borrowForm.getReaderName();
		borrowTime=borrowForm.getBorrowTime();
		backTime=borrowForm.getBackTime();
		%>
<tr align="center">
	<td><%=bookbarcode %></td>
	<td>&nbsp;</td>
	<td><%=bookname %></td>
	<td>&nbsp;</td>
	<td><%=readerbar %></td>
	<td>&nbsp;</td>
	<td><%=readername %></td>
	<td>&nbsp;</td>
	<td><%=borrowTime %></td>
	<td>&nbsp;</td>
	<td><%=backTime %></td>
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