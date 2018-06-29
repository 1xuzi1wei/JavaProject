<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.actionForm.LibraryForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
@SuppressWarnings("unchecked")
ArrayList<LibraryForm> coll = (ArrayList<LibraryForm>)request.getAttribute("libraryQuery");

 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function checkForm(form){
	for(i=0;i<form.length;i++){
		if(form.elements[i].value==""){
		alert("请将信息填写完整！");
		form.elements[i].focus();
		return false;
		}
	}
}
</script>
<body onLoad="onclock()">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统设置 &gt; 图书馆信息 &gt;&gt;&gt;
	</td>
</tr>
<tr>
	<td align="center" valign="top">
	<%
	if(coll == null || coll.isEmpty()){
	%>
	<table>
		<tr>
			<td align="center">暂无图书馆信息！</td>
		</tr>
	</table>
	</td>
</tr>
<%}else{
	Iterator<LibraryForm> it = coll.iterator();
	    String libraryname="";
		String curator="";
		String tel="";
		String address="";
		String email="";
		String url="";
		String createDate="";
		String introduce="";
	%>
</table>
<form action="library?action=libraryModify" name="form1" method="post">
<%
while(it.hasNext()){
	LibraryForm libraryForm=(LibraryForm)it.next();
	libraryname = libraryForm.getLibraryname();
	curator = libraryForm.getCurator();
	tel = libraryForm.getTel();
	address = libraryForm.getAddress();
	email=libraryForm.getEmail();
	url=libraryForm.getUrl();
	createDate=libraryForm.getCreateDate();
	introduce=libraryForm.getIntroduce();
 %>
<table>
<tr>
	<td>图书馆名称：</td>
	<td><input name="libraryname" type="text" id="libraryname" value="<%=libraryname%>" size="50"></td>
</tr>
<tr>
	<td>馆长：</td>
	<td><input name="curator" type="text" id="curator" value="<%=curator%>" size="50"></td>
</tr>
<tr>
	<td>联系电话：</td>
	<td><input name="tel" type="text" id="tel" value="<%=tel%>" size="50"></td>
</tr>
<tr>
	<td>联系地址：</td>
	<td><input name="address" type="text" id="address" value="<%=address%>" size="50"></td>
</tr>
<tr>
	<td>联系邮箱：</td>
	<td><input name="email" type="text" id="email" value="<%=email%>" size="50"></td>
</tr>
<tr>
	<td>图书馆网址：</td>
	<td><input name="url" type="text" id="url" value="<%=url%>" size="50"></td>
</tr>
<tr>
	<td>建馆时间：</td>
	<td><input name="createDate" type="text" id="createDate" value="<%=createDate%>" size="50"></td>
</tr>
<tr>
	<td>图书馆简介：</td>
	<td><textarea name="introduce"  id="libraryname" class="wenbenkuang"><%=introduce%></textarea></td>
</tr>
<tr align="center">
<td colspan="3">
<input name="submit" type="submit" class="btn_grey" value="保存" onClick="return checkForm(form1)">
<input name="submit2" type="reset" class="btn_grey" value="重置">
<input name="button" type="button" class="btn_grey" value="返回" onClick="history.back(-1)">
</td>
</tr>
	<%
	}
}
%>
</table>
</form>
<%@include file="copyright.jsp" %>
</body>
</html>