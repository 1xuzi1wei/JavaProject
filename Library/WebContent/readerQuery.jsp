<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.ReaderDAO" %>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.actionForm.ReaderForm"%>
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
ArrayList<ReaderForm> coll = (ArrayList<ReaderForm>)request.getAttribute("readerQuery");
ChStr chStr=new ChStr();
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：读者管理 &gt; 读者档案管理 &gt;&gt;&gt;
	</td>
</tr>

<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
	<tr>
		<td align="center">暂无读者信息！</td>
	</tr>
	<tr>
		<td> <a href="#" onClick="window.open('readerAdd.jsp')">添加读者信息</a></td>
	</tr>
	</table>
	</td>
</tr>
<%}else{
	Iterator<ReaderForm> it = coll.iterator();
	 int id=0;
	  String name="";
	  String sex="";
	  String typename="";
	  String barcode="";
	  String paperType="";
	  String paperNO="";
	  String tel="";
	  String email="";
	%>
</table>
<table>
	<tr>
		<td> <a href="#" onClick="window.open('readerAdd.jsp')">添加读者信息</a></td>
	</tr>
</table>
<table>
<tr align="center">
	<td>条形码</td>
	<td>姓名</td>
	<td>读者类型</td>
	<td>性别</td>
	<td>证件类型</td>
	<td>证件号码</td>
	<td>电话</td>
	<td>Email</td>
	<td>修改</td>
	<td>删除</td>
</tr>
<%
while(it.hasNext()){
	ReaderForm readerForm=(ReaderForm)it.next();
	id=Integer.valueOf(readerForm.getId());
	name=readerForm.getName();
	sex=readerForm.getSex();
	barcode=chStr.nullToString(readerForm.getBarcode(),"&nbsp;");
	typename=chStr.nullToString(readerForm.getTypename(),"&nbsp;");
	paperType=readerForm.getPaperType();
	paperNO=chStr.nullToString(readerForm.getPaperNO(),"&nbsp;");
	tel=chStr.nullToString(readerForm.getTel(),"&nbsp;");
	email=chStr.nullToString(readerForm.getEmail(),"&nbsp;");
	%>
	<tr align="center">
    <td><%=barcode%></td>  
    <td><a href="reader?action=readerModifyQuery&id=<%=id%>"><%=name%></a></td>
    <td><%=typename%></td>
    <td><%=sex%></td>
    <td><%=paperType%></td>
    <td><%=paperNO%></td>
    <td><%=tel%></td>
    <td><%=email%></td>
    <td><a href="reader?action=readerModifyQuery&id=<%=id%>">修改</a></td>
    <td><a href="reader?action=readerDel&id=<%=id%>">删除</a></td>
  </tr>
	<%
	}
}
%>

</table>
<%@ include file="copyright.jsp"%>
</body>
</html>