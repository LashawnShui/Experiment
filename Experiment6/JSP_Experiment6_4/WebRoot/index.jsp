<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
    <div>
    	<form action="signInAction" method="post">
    		<div>
    			用户名：<input type="text" name="username" value="${param.username }">
    		</div>
    		<div>
    			密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" value="">
    		</div>
    		<div>
    			<input type="submit" value="登录">
    		</div>
    	</form>
    </div>
    <%
    	if(request.getParameter("error") != null && request.getParameter("error").equals("signIn")){
    		out.println(session.getAttribute("signInErrorMessage"));
    	}
    %>
  </body>
</html>
