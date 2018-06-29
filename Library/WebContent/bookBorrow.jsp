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
function checkbook(form){
	if(form.barcode.value==""){
		alert("请输入读者条形码！");
		form.barcode.focus();
		return false;
	}
	if(form.inputkey.value==""){
		alert("请输入查询关键字！");
		form.inputkey.focus();
		return false;
	}
	if(form.number.value-form.borrowNumber.value <= 0){
		alert("您不能再借阅其他的图书了！");
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
		当前位置：图书借还 &gt; 图书借阅 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="borrow?action=bookBorrow">
<% 
ReaderForm readerForm= (ReaderForm) request.getAttribute("readerinfo");
@SuppressWarnings("unchecked")
ArrayList<BorrowForm> coll=(ArrayList<BorrowForm>)request.getAttribute("borrowinfo");
int borrowNumber = 0;
int id = 0;
String name= "";
String sex = "";
String barcode = "";
String paperType = "";
String paperNO = "";
int number = 0;
String typename = "";
	if(readerForm != null){
		id=Integer.valueOf(readerForm.getId());
		name=readerForm.getName();
		sex=readerForm.getSex(); 
		barcode=readerForm.getBarcode();
		paperType=readerForm.getPaperType();
		paperNO=readerForm.getPaperNO();
		number=readerForm.getNumber();
		typename=readerForm.getTypename();
	}
%>
<table>
<tr>
	<td>读者条形码：</td>
	<td>
		<input name="barcode" type="text" id ="barcode" value="<%=barcode%>">
		<input name="submit1" type="submit" class="btn_grey" value="确定" onClick="return checkreader(form1)">
	</td>
</tr>
</table>
<table>
<tr>
	<td>姓名：</td>
	<td>
<%-- 		<input name="id" type="hidden" value="<%=id%>"> --%>
		<input name="name" type="text" value="<%=name%>">
	</td>
	<td>性别：</td>
	<td>
	<input name="sex" type="text" value="<%=sex%>">
	</td>
	<td>读者类型：</td>
	<td>
	<input name="readerType" type="text" value="<%=typename%>">
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
<table>
<tr>
	<td>
	添加的依据：
	<input name="f" type="radio" class="noborder" value="barcode" checked>图书条形码&nbsp;&nbsp;
	<input name="f" type="radio" class="noborder" value="bookname">图书名称&nbsp;&nbsp;
	<input name="inputkey" type="text" id="inputkey">
	<input name="submit2" type="submit" class="btn_grey" value="确定" onClick="return checkbook(form1)">
	<input name="operator" type="hidden" id="operator" value="<%=manager%>">
	<input name="button" type="button" class="btn_grey" value="完成借阅" onClick="window.location.href='bookBorrow.jsp'">
	</td>
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
</tr>
<%
String bookname="";
String borrowTime="";
String backTime="";
double price=0;
String pubname="";
String bookcase="";
if(coll!=null && !coll.isEmpty()){
	borrowNumber=coll.size();
	Iterator<BorrowForm> it=coll.iterator();
	while(it.hasNext()){
	BorrowForm borrowForm=(BorrowForm)it.next();
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
</tr>
<%	}
}%>

<tr>
	<td><input name="borrowNumber" type="hidden" id="borrowNumber" value="<%=borrowNumber %>"></td>
</tr>

</table>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>