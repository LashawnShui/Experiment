<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	<% 
	    try{
	        Class.forName("com.mysql.jdbc.Driver");//记载数据库驱动，注册到驱动管理器
	        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","500532");
	        if(conn!=null){
	            out.println("数据库连接成功！！！");
	        }else{
	            out.println("数据库连接失败！！！");
	        }
	    }catch(Exception e){
	        e.printStackTrace();
	    }
	%>
  </body>
</html>
