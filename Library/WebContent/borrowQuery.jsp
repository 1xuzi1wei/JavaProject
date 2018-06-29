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
<link href="CSS/style.css" rel="stylesheet">
</head>
<script src="JS/function.js"></script>
<script type="text/javascript">
function checkForm(form){
	if(form.flag[0].checked == false && form.flag[1].checked == false){
		alert("请选择查询方式！");
		return false;
	}
	if(form.flag[1].checked){
		if(form.startTime.value == ""){
			alert("请输入开始日期！");
			form.startTime.focus();
			return false;
		}
		if(CheckDate(form.startTime.value)){
			alert("您输入的开始日期的不正确！（应如：2018-05-12）");
			form.startTime.focus();
			return false;
		}
		if(form.endTime.value == ""){
			alert("请输入结束日期！");
			form.endTime.focus();
			return false;
		}
		if(CheckDate(form.endTime.value)){
			alert("您输入的结束日期的不正确！（应如：2018-05-12）");
			form.endTime.focus();
			return false;
		}
	}
}
</script>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>

<%
@SuppressWarnings("unchecked")
ArrayList<BorrowForm> coll=(ArrayList<BorrowForm>)request.getAttribute("borrowQuery"); 
%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统查询 &gt; 图书借阅查询 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="borrow?action=borrowQuery">
<table>
<tr>
	<td><input name="flag" type="checkbox" class="noborder" value="a" checked>请选择查询依据：
	<select name="f" class="wenbenkuang" id="f">
	<option value="barcode">图书条形码</option>
	<option value="bookname">图书名称</option>
	<option value="readerbarcode">读者条形码</option>
	<option value="readername">读者名称</option>
	</select>
	<input name="key" type="text" id="key">
	<input name="submit" type="submit" class="btn_grey" value="查询" onClick="return checkForm(form1)">
	</td>
</tr>
<tr>
	<td>
	<input name="flag" type="checkbox" class="noborder" value="b">借阅时间：	从
	<input name="startTime" type="text" id="startTime"> 
	到
	<input name="endTime" type="text" id="endTime">（日期格式为：2018-05-12）
	</td>
</tr>
</table>
</form>
<%
if(coll == null || coll.isEmpty()){
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
	  String bookname="";
	  String bookbarcode="";
	  String readerbar="";
	  String readername="";
	  String borrowTime="";
	  String backTime="";
	  int ifback=0;
	  String ifbackstr="";
	  %>
	  <table >
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
	  	<td>&nbsp;</td>
	  	<td>是否归还</td>
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
		ifback=borrowForm.getIfBack();
		if(ifback == 0){
			ifbackstr="未归还";
		}else{
			ifbackstr="已归还";
		}
		%>
	<tr align="center">
		<td>&nbsp;<%=bookbarcode %></td>
		<td>&nbsp;</td>
		<td>&nbsp;<%=bookname %></td>
		<td>&nbsp;</td>
		<td>&nbsp;<%=readerbar %></td>
		<td>&nbsp;</td>
		<td>&nbsp;<%=readername %></td>
		<td>&nbsp;</td>
		<td>&nbsp;<%=borrowTime %></td>
		<td>&nbsp;</td>
		<td>&nbsp;<%=backTime %></td>
		<td>&nbsp;</td>
		<td>&nbsp;<%=ifbackstr %></td>
	</tr>
	  </table>
<% 
	}
}%>

<%@ include file="copyright.jsp"%>
</body>
</html>