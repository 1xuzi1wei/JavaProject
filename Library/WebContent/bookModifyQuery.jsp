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
<script type="text/javascript">
function check(form){
	if(form.barcode.value==""){
		alert("请输入条形码!");
		form.barcode.focus();
		return false;
	}
	if(form.bookName.value==""){
		alert("请输入图书姓名!");
		form.bookName.focus();
		return false;
	}
	if(form.price.value==""){
		alert("请输入图书定价!");
		form.price.focus();
		return false;
	}
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
</head>
<%
String str=null;
BookTypeDAO bookTypeDAO=new BookTypeDAO();
BookTypeForm bookTypeForm1 = new BookTypeForm ();
Collection<BookTypeForm> coll=(Collection<BookTypeForm>)bookTypeDAO.query(str,bookTypeForm1);
if(coll==null || coll.isEmpty()){
	out.println("<script>alert('请先录入图书类型信息!');history.back(-1);</script>");
}else{
	Iterator<BookTypeForm> it=coll.iterator();
	int typeID=0;
	  String typename1="";
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
			  	BookForm bookForm= (BookForm) request.getAttribute("bookModifyQuery");
			  	%>


<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：图书管理 &gt; 图书档案管理&gt; 修改图书信息 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="book?action=bookModify">
<%
int ID=bookForm.getId().intValue();
String bookname=bookForm.getBookname();
String barcode=bookForm.getBarcode();
if(barcode==null) barcode="";
int typeid=bookForm.getTypeid();
String typename=bookForm.getTypename();
String author=bookForm.getAuthor();
String ISBN=bookForm.getIsbn();
String publishing=bookForm.getPublishing();
Double price=bookForm.getPrice();
int pages=bookForm.getPage();
int bookcaseid=bookForm.getBookcaseid();
String bookcaseName=bookForm.getBookcaseName();	
String inTime=bookForm.getInTime();
String operator=bookForm.getOperator();
%>
<table>
	<tr>
		<td> <a href="#" onClick="window.open('bookAdd.jsp')">添加图书信息</a></td>
	</tr>
</table>
<table>
<tr>
	<td><input name="id" type="hidden" id="id" value="<%=ID%>">条形码：</td>
	<td>		
		<input name="barcode" type="text" id="barcode" value="<%=barcode%>">
	</td>
</tr>

<tr>
	<td>图书名称：</td>
	<td>
		<input name="bookName" type="text" id ="bookName" value="<%=bookname%>">
	</td>
</tr>

<tr>
	<td>图书类型：</td>
	<td>
		<select name="typeid" class="wenbenkuang" id="typeid">			
	<%
		while(it.hasNext()){
			BookTypeForm bookTypeForm=(BookTypeForm)it.next();
			typeID = Integer.valueOf(bookTypeForm.getId());
			typename1 = bookTypeForm.getTypeName();
		%>
				<option value="<%=typeID%>" <%if(typeid == typeID) out.println("selected");%>><%=typename1%></option>

		<%}%>
		</select>
	</td>
</tr>

<tr>
        <td>作者：</td>
        <td><input name="author" type="text" id="author" value="<%=author%>"></td>
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
			<option value="<%=isbn %>" <%if(isbn.equals(ISBN)) out.println("selected"); %>><%=pubname %></option>
		<%}%>
			</select></td>
</tr>
<tr>
        <td>价格：</td>
        <td><input name="price" type="text" id="price" value="<%=price%>"> (元) * </td>
</tr>
<tr>
        <td align="center">页码：</td>
        <td><input name="page" type="text" id="page" value="<%=pages%>"></td>
</tr>
 <tr>
        <td>书架：</td>
        <td><select name="bookcaseid" class="wenbenkuang" id="bookcadeid">
		<%
		while(it_bookCase.hasNext()){
			BookCaseForm bookCaseForm=(BookCaseForm)it_bookCase.next();
			bookcaseID = bookCaseForm.getId();
			bookcasename = bookCaseForm.getName();
		%>
			<option value="<%=bookcaseID %>" <%if(bookcaseID == bookcaseid) out.println("selected"); %>><%=bookcasename %></option>
			<%}%>
			</select>
       		<input name="operator" type="hidden" id="operator" value="<%=manager%>">
        </td>
</tr>
<tr>
    <td>
     	<input name="submit" type="submit" value="保存" class="btn_grey" onClick="return checkForm(form1)">
		<input name="submit1" type="reset" value="重置" class="btn_grey">
		<input name="submit2" type="button" value="返回" class="btn_grey" onClick="history.back(-1)">
	</td>
</tr>
</table>
</form>
			  	<%
			}
		}
}
%>
<%@include file="copyright.jsp" %>
</body>
</html>
