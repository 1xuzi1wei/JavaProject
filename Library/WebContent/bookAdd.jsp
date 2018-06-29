<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.BookDAO" %>
<%@ page import="com.mr.dao.BookTypeDAO" %>
<%@ page import="com.mr.actionForm.BookForm" %>
<%@ page import="com.mr.actionForm.BookTypeForm"%>
<%@ page import="com.mr.dao.BookCaseDAO" %>
<%@ page import="com.mr.actionForm.BookCaseForm" %>
<%@ page import="com.mr.dao.PublishingDAO" %>
<%@ page import="com.mr.actionForm.PublishingForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<%
String str=null;
BookTypeDAO bookTypeDAO=new BookTypeDAO();
BookTypeForm bookTypeForm = new BookTypeForm();
Collection<BookTypeForm> coll=(Collection<BookTypeForm>)bookTypeDAO.query(str,bookTypeForm);
if(coll==null || coll.isEmpty()){
	out.println("<script>alert('请先录入图书类型信息!');history.back(-1);</script>");
}else{
	Iterator<BookTypeForm> it=coll.iterator();
	int typeID=0;
	  String typename="";
	  String str1=null;
	  BookCaseDAO bookCaseDAO=new BookCaseDAO();
	  BookCaseForm bookCaseForm1 = new BookCaseForm ();
	  Collection<BookCaseForm> bookCasecoll=(Collection<BookCaseForm>)bookCaseDAO.query(str,bookCaseForm1);
	  if(bookCasecoll==null || bookCasecoll.isEmpty()){
			out.println("<script>alert('请先录入书架信息!');history.back(-1);</script>");
		}else{
			Iterator<BookCaseForm> it_bookCase=bookCasecoll.iterator();
			int bookcaseID=0;
		  	String bookcasename="";
		  	String str2=null;
		    PublishingDAO publishingDAO=new PublishingDAO();
		    PublishingForm publishingForm1 = new PublishingForm ();
		    Collection<PublishingForm> publishingcoll=(Collection<PublishingForm>)publishingDAO.query(str,publishingForm1);
		    if(publishingcoll==null || publishingcoll.isEmpty()){
				out.println("<script>alert('请先录入出版社信息!');history.back(-1);</script>");
			}else{
				Iterator<PublishingForm> it_publishing=publishingcoll.iterator();
				String isbn="";
			  	String pubname="";	
			%>

<script type="text/javascript">
function check(form){
	if(form.bookName.value==""){
		alert("请输入图书名称!");
		form.bookName.focus();
		return false;
	}
	if(form.barcode.value==""){
		alert("请输入条形码!");
		form.barcode.focus();
		return false;
	}
	if(form.price.value==""){
		alert("请输入图书的定价!");
		form.price.focus();
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
		当前位置：图书管理 &gt; 图书档案管理 &gt;添加图书信息&gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="book?action=bookAdd">
<table align="center">
<tr>
	<td>条形码：</td>
	<td>
		<input name="barcode" type="text" id ="barcode" >*
	</td>
</tr>

<tr>
	<td>图书名称：</td>
	<td>
		<input name="bookName" type="text" id ="bookName" >
	</td>
</tr>

<tr>
	<td>图书类型：</td>
	<td>
		<select name="bookTypeid" class="wenbenkuang" id="bookTypeid">			
	<%
		while(it.hasNext()){
			BookTypeForm bookTypeForm1=(BookTypeForm)it.next();
			typeID = Integer.valueOf(bookTypeForm1.getId());
			typename = bookTypeForm1.getTypeName();
		%>
				<option value="<%=typeID%>"><%=typename%></option>

		<%}%>
		</select>
	</td>
</tr>
<tr>
	<td>作者：</td>
	<td>
		<input name="author" type="text" id ="author" >
	</td>
</tr>
<tr>
		<td>出版社：</td>
		<td><select name="isbn" class="wenbenkuang" id="isbn">
		<%
		while(it_publishing.hasNext()){
			PublishingForm publishingForm=(PublishingForm)it_publishing.next();
			isbn = publishingForm.getIsbn();
			pubname = publishingForm.getPubname();
		%>
			<option value="<%=isbn %>"><%=pubname %></option>
		<%}%>
			</select></td>
</tr>


<tr>
        <td>价格：</td>
        <td><input name="price" type="text" id="price"> (元) * </td>
</tr>

<tr>
        <td>页码：</td>
        <td><input name="page" type="text" id="page"></td>
</tr>

 <tr>
        <td>书架：</td>
        <td><select name="bookcaseid" class="wenbenkuang" id="bookcaseid">
		<%
		while(it_bookCase.hasNext()){
			BookCaseForm bookCaseForm=(BookCaseForm)it_bookCase.next();
			bookcaseID = bookCaseForm.getId();
			bookcasename = bookCaseForm.getName();
		%>
			<option value="<%=bookcaseID %>" ><%=bookcasename %></option>
			<%}%>
			</select>
       		<input name="operator" type="hidden" id="operator" value="<%=manager%>">
        </td>
</tr>

<tr>
    <td colspan="2" align="center">
		<input name="submit" type="submit" class="btn_grey" value="保存" onClick="return check(form1)">
		<input name="submit1" type="reset" class="btn_grey" value="重置" >
		<input name="submit2" type="button" class="btn_grey" value="关闭" onClick="window.close();">
	</td>
</tr>
</table>
</form>
<%@ include file="copyright.jsp"%>
</body>
<%}
}
}%>
</html>