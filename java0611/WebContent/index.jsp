<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript">
   function checkNull(form){/* 检验留言人或者留言内容不能为空 */
	for(var i=0;i<form.length;i++){  
		if(form.elements[i].value == ""){         //form的属性elements的首字e要小写
			alert("很抱歉，"+form.elements[i].title + "不能为空!");
			form.elements[i].focus();			//当前元素获取焦点
			return false;
		}
	}
}</script>
    <title>编写一个简易的留言簿,实现添加留言和显示留言内容等功能</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
<%
if(session.getAttribute("message") != null)/* 显示留言内容 */
  {
  	out.print(session.getAttribute("message").toString());
  }
 %>
    <form action="deal.jsp" method="post" name ="form1" onSubmit="return checkNull(form1)">
    &nbsp;&nbsp;&nbsp;&nbsp;留言人：<input type="text" name="name" title="留言人"><br>
    留言内容：<textarea rows="3" cols="30" name="content" title="留言内容"></textarea><br>
    <input type="submit" value="签写留言" name="submit">&nbsp;
    <input type="reset" value="重置" name="reset">
    </form>
  </body>
</html>
