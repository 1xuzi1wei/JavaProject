<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.ReaderDAO" %>
<%@ page import="com.mr.dao.ReaderTypeDAO" %>
<%@ page import="com.mr.actionForm.ReaderForm" %>
<%@ page import="com.mr.actionForm.ReaderTypeForm" %>
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
ReaderTypeDAO readerTypeDAO=new ReaderTypeDAO();
ReaderTypeForm readerTypeForm = new ReaderTypeForm();
Collection<ReaderTypeForm> coll=(Collection<ReaderTypeForm>)readerTypeDAO.query(str,readerTypeForm);
if(coll == null || coll.isEmpty()){
	out.println("<script>alert('请先录入读者类型信息!');history.back(-1);</script>");
}else{
Iterator<ReaderTypeForm> it=coll.iterator();
int typeID = 0;
String typeName = "";

%>
<script type="text/javascript">
function check(form){
	if(form.name.value==""){
		alert("请输入读者姓名!");
		form.name.focus();
		return false;
	}
	if(form.barcode.value==""){
		alert("请输入条形码!");
		form.name.focus();
		return false;
	}
	if(form.paperNO.value==""){
		alert("请输入证件号码!");
		form.paperNO.focus();
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
		当前位置：读者管理 &gt; 读者档案管理 &gt;添加读者信息&gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="reader?action=readerAdd">
<table>
<tr>
	<td>姓名：</td>
	<td>
		<input name="name" type="text" id="name">
		*
	</td>
</tr>
<tr>
	<td>姓别：</td>
	<td>
	
	<input name="sex" type="radio" value="男" class="noborder" id="radiobutton" >
	<label for="radiobutton">男
	</label>
	<label>
	<input name="sex" type="radio" value="女" class="noborder" >女
	</label>
	</td>
</tr>

<tr>
	<td>条形码：</td>
	<td>
		<input name="barcode" type="text"  id ="barcode" >
	</td>
</tr>

<tr>
	<td>读者类型：</td>
	<td>
		<select name="readertypeid" class="wenbenkuang" id="readertypeid">			
	<%
		while(it.hasNext()){
			ReaderTypeForm readerTypeForm1=(ReaderTypeForm)it.next();
			typeID = Integer.valueOf(readerTypeForm1.getId());
			typeName = readerTypeForm1.getName();
		%>
				<option value="<%=typeID%>"><%=typeName%></option>

		<%}%>
		</select>
	</td>
</tr>

<tr>
        <td>职业：</td>
        <td><input name="vocation" type="text" id="vocation"></td>
</tr>

<tr>
		 <td>出生日期：</td>
		 <td><input name="birthday" type="text" id="birthday"></td>
</tr>
<tr>
		<td>有效证件：</td>
		<td><select name="paperType" class="wenbenkuang" id="paperType">
			<option value="学生证"  selected>学生证</option>
			<option value="身份证" >身份证</option>
			<option value="工作证" >工作证</option>
			<option value="港澳台通行证" >港澳台通行证</option>
		</select></td>
</tr>
<tr>
        <td>证件号码：</td>
        <td><input name="paperNO" type="text" id="paperNO" >  * </td>
</tr>
<tr>
        <td align="center">电话：</td>
        <td><input name="tel" type="text" id="tel" ></td>
</tr>
 <tr>
        <td>Email：</td>
        <td><input name="email" type="text" id="email" >
        <input name="operator" type="hidden" id="operator" value="<%=manager%>"></td>
</tr>
<tr>
        <td>备注：</td>
        <td><textarea name="remark" class="wenbenkuang" id="remark"></textarea></td>
</tr>
      
<tr>
    <td>
        <input name="Submit" type="submit" class="btn_grey" value="保存" onClick="return check(form1)">
		<input name="Submit1" type="reset" class="btn_grey" value="重置">
		<input name="Submit2" type="button" class="btn_grey" value="返回" onClick="history.back()">
	</td>
</tr>
</table>
</form>
<%@ include file="copyright.jsp"%>
</body>
<%}%>
</html>