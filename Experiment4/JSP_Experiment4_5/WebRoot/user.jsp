<%@page import="bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
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
    	if(request.getParameter("nickname").equals("")){
    		response.sendRedirect("index.jsp?errorType=1&" + request.getQueryString());
    	}else if(request.getParameter("password").equals("")){
    		response.sendRedirect("index.jsp?errorType=2&" + request.getQueryString());
    	}else if(request.getParameter("confirmPassword").equals("")){
    		response.sendRedirect("index.jsp?errorType=3&" + request.getQueryString());
    	}else if(request.getParameter("password").equals(request.getParameter("confirmPassword")) == false){
    		response.sendRedirect("index.jsp?errorType=4&" + request.getQueryString());
    	}else if(request.getParameter("sex") == null){
    		response.sendRedirect("index.jsp?errorType=5&" + request.getQueryString());
    	}
    %>
    <%
    	String nickname = request.getParameter("nickname");
    	String password = request.getParameter("password");
    	String sex = request.getParameter("sex");
    	String [] hobbyStrings = request.getParameterValues("hobby");
  	 	ArrayList<String> hobby = new ArrayList<String>();
  	 	if(hobbyStrings != null){
	  	 	for(String hobbyString : hobbyStrings){
	  	 		hobby.add(hobbyString);
	  	 	}
  	 	}
    	User user = new User(nickname,password,sex,hobby);
    	session.setAttribute("user", user);
    %>
    <div>
    	<div>
    		用户昵称：${user.nickname }
    	</div>
    	<div>
    		<span style="margin-right:2em;">密</span>码：${user.password }
    	</div>
    	<div>
    		<span style="margin-right:2em;">性</span>别：${user.sex }
    	</div>
    	<div>
    		<span style="margin-right:2em;">爱</span>好：<%
    			for(String hobbyString : user.getHobby()){
    				out.println(hobbyString + " ");
    			}
    		%>
    	</div>
    </div>
    <button onclick="location.href='<%= "index.jsp?" + request.getQueryString() %>'" type="button">返回</button>
  </body>
</html>
