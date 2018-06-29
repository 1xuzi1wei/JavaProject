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
<script type="text/javascript">
	function checkreader(form){
	if(form.barcode.value==""){
		alert("请输入读者条形码！");
		form.barcode.focus();
		return false;
	}
}
</script>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：图书借还 &gt; 图书归还 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="borrow?action=bookBack">
<% 
ReaderForm readerForm= (ReaderForm) request.getAttribute("readerinfo");
@SuppressWarnings("unchecked")
ArrayList<BorrowForm> coll=(ArrayList<BorrowForm>)request.getAttribute("borrowinfo");
// int borrowNumber = 0;

int readerid = 0;
String name= "";
String sex = "";
String barcode = "";
String birthday="";
String paperType = "";
String paperNO = "";
int number = 0;
String typename = "";
	if(readerForm != null){
		readerid=Integer.valueOf(readerForm.getId());
		name=readerForm.getName();
		sex=readerForm.getSex(); 
		barcode=readerForm.getBarcode();
		birthday=readerForm.getBirthday();
		paperType=readerForm.getPaperType();
		paperNO=readerForm.getPaperNO();
		number=readerForm.getNumber();
		typename=readerForm.getTypename();
	}
%>
<table>
<tr>
	<td>条形码：</td>
	<td>
		<input name="barcode" type="text" id ="barcode" value="<%=barcode%>">
		<input name="submit" type="submit" class="btn_grey" value="确定" onClick="return checkreader(form1)">
	</td>
</tr>
</table>
<table>
<tr>
	<td>姓名：</td>
	<td>
<%-- 		<input name="readerid" type="hidden" value="<%=readerid%>"> --%>
		<input name="name" type="text" value="<%=name%>">
	</td>
	<td>性别：</td>
	<td>
	<input name="sex" type="text" value="<%=sex%>">
	</td>
	<td>读者类型：</td>
	<td>
	<input name="typename" type="text" value="<%=typename%>">
	</td>
	<td>出生日期：</td>
	<td>
	<input name="birthday" type="text" value="<%=birthday%>">
	</td>
</tr>
<tr>
	<td>证件类型：</td>
	<td><input name="paperType" type="text" id="paperType" value="<%=paperType%>"></td>
	<td>证件号码：</td>
	<td><input name="paperNO" type="text" id="paperNO" value="<%=paperNO%>"></td>
	<td>可借数量：</td>
	<td><input name="number" type="text" id="number" value="<%=number%>">册</td>
</tr>
</table>
<table align="center">
<tr>
	<td>&nbsp;</td>
</tr>
<tr align="center">
	<td>图书名称</td>
	<td>&nbsp;</td>
	<td>借阅时间</td>
	<td>&nbsp;</td>
	<td>应还时间</td>
	<td>&nbsp;</td>
	<td>出版社</td>
	<td>&nbsp;</td>
	<td>书架</td>
	<td>&nbsp;</td>
	<td>定价（元）</td>
	<td>
	<input name="button" type="button" class="btn_grey" value="完成归还" onClick="window.location.href='bookBack.jsp'">
	</td>
</tr>
<%
int id=0;
String bookname="";
String borrowTime="";
String backTime="";
double price=0.0;
String pubname="";
String bookcase="";
if(coll!=null && !coll.isEmpty()){
	Iterator<BorrowForm> it=coll.iterator();
	while(it.hasNext()){	
	BorrowForm borrowForm=(BorrowForm)it.next();
	id=Integer.valueOf(borrowForm.getId());
	bookname=borrowForm.getBookName();
	borrowTime=borrowForm.getBorrowTime();
	backTime=borrowForm.getBackTime();
	price=borrowForm.getPrice();
	pubname=borrowForm.getPubName();
	bookcase=borrowForm.getBookcaseName();
%>
<tr align="center">
    <td >&nbsp;<%=bookname%></td>
    <td>&nbsp;</td>
    <td >&nbsp;<%=borrowTime%></td>
    <td>&nbsp;</td>
    <td >&nbsp;<%=backTime%></td>
    <td>&nbsp;</td>
    <td>&nbsp;<%=pubname%></td>
    <td>&nbsp;</td>
    <td>&nbsp;<%=bookcase%></td>
    <td>&nbsp;</td>
    <td>&nbsp;<%=price%></td>
    <td align="center"><a href="borrow?action=bookBack&barcode=<%=barcode %>&id=<%=id %>&operator=<%=manager%>">归还</a>&nbsp;</td>
</tr>
<%	}
}%>
</table>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>