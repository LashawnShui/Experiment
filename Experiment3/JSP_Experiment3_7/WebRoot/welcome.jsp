<%@page import="com.sun.org.apache.regexp.internal.recompile"%>
<%@ page language="java" import="java.util.*,bean.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'welcome.jsp' starting page</title>
    
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
		User user = (User)session.getAttribute("user");
		if(user == null){
			response.sendRedirect("index.jsp");
		}else{
			out.println("欢迎：" + user.getUsername());
		}
	%>
    <a href="loginAction">注销</a>
  </body>
</html>
