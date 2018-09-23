<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
		String [] messages = {
			"用户名：" + request.getParameter("userName"),
			"密码：" + request.getParameter("password"),
			"请求使用的协议：" + request.getProtocol(),
			"请求的URL：" + request.getServletPath(),
			"请求的方法：" + request.getMethod(),
			"远程地址：" + request.getRemoteAddr()
		};
		for(String message : messages){
			out.println(message + "<br>");
		}
	%>
  </body>
</html>
