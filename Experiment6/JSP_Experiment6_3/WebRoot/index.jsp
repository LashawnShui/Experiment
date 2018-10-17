<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		HashMap<String,String> hashMap = new HashMap<String,String>();
		String[][] tableStrings = {
			{"百度","http://www.baidu.com"},
			{"雅虎","http://www.yahoo.com"},
			{"谷歌","http://www.google.com"}
		};
		for(String[] rowStrings : tableStrings){
			hashMap.put(rowStrings[0], rowStrings[1]);
		}
		pageContext.setAttribute("hashMap", hashMap);
	%>
	<c:forEach var="item" items="${hashMap }">
		<c:out value="${item.key }"></c:out>
		<c:out value="${item.value }"></c:out>
		<br>
	</c:forEach>
  </body>
</html>
