<%@page import="java.text.SimpleDateFormat"%>
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
	<link rel="stylesheet" type="text/css" href="css/index.css">
  </head>
  
  <body>
  	<%
  		String[] ids = {"010020199601026929","010020199711126928"};
  	%>
  	<%!
  		Date getDate(String id){
  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
  			Date date = null;
  			try{
  				date = simpleDateFormat.parse(id.substring(6, 14));
  			}catch(Exception exception){
  				exception.printStackTrace();
  			}
  			return date;
  		}
  		String dateToString(Date date){
  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
  			return simpleDateFormat.format(date);
  		}
  	%>
  	<table border="1" cellspacing="0" cellpadding="0">
  		<tr>
  			<td>身份证</td>
  			<td>生日</td>
  		</tr>
  		<%
  			for(String id : ids){
  				%>
	  			<tr>
	  				<td><%= id %></td>
	  				<td><%= dateToString(getDate(id)) %></td>
	  			</tr>
	  			<%
	  		}
	  	%>
  	</table>
  </body>
</html>
