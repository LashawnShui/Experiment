<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
  	<h3>0aa,1bb,2cc,3dd,4ee,5ff,6gg,7kk,8mm,9nn,10zz<br>以逗号分隔，取其中的第偶数个</h3>
    <c:forTokens items="0aa,1bb,2cc,3dd,4ee,5ff,6gg,7kk,8mm,9nn,10zz" delims="," var="item" begin="0" end="10" varStatus="status">
  		<c:if test="${status.count%2==0}">
  			<c:out value="${item}"/>
   		</c:if>
	</c:forTokens>
  </body>
</html>
