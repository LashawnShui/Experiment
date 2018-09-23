<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    	if(request.getParameter("firstNumber") != null && request.getParameter("firstNumber").equals("") != true && request.getParameter("secondNumber") != null && request.getParameter("secondNumber").equals("") != true){
    	int firstNumber = Integer.parseInt(request.getParameter("firstNumber"));
    	char operator = request.getParameter("operator").charAt(0);
    	int secondNumber = Integer.parseInt(request.getParameter("secondNumber"));
    	double result = 0;
    	int errorType = 0;
    	switch(operator){
    		case '+':
    			result = firstNumber + secondNumber;
    			break;
    		case '-':
    			result = firstNumber - secondNumber;
    			break;
    		case '*':
    			result = firstNumber * secondNumber;
    			break;
    		case '/':
    			if(secondNumber != 0){
    				result = firstNumber * 1.0 / secondNumber;
    			}else{
    				request.setAttribute("errorMessage", "除数不能为零！");
    				errorType = 1;
    			}
    			break;
    	}
    	if(errorType == 0){
    		request.setAttribute("result", result);
    	}else if(errorType == 1){
    		;
    	}
    	}
    %>
    <h2>我的计算器</h2>
    <hr/>
    <form action="">
    	<div>
    		请输入第一个数：
    		<input type="number" name="firstNumber">
    	</div>
    	<div>
    		请选择运算方式：
    		<select name="operator">
    			<option value="+">+</option>
    			<option value="-">-</option>
    			<option value="*">*</option>
    			<option value="/">/</option>
    		</select>
    	</div>
    	<div>
    		请输入第二个数：
    		<input type="number" name="secondNumber">
    	</div>
    	<div>
    		<input type="submit" value="计算">
    		<input type="reset">
    	</div>
    </form>
    <div>
		结果：
		<%
			if(request.getAttribute("result")==null){
		%>
			<input type="text" name="result">
		<%
			}else{
		%>
			<input type="text" name="result" value="<%= request.getAttribute("result") %>">
		<%
			}
		%>
	</div>
	${errorMessage }
  </body>
</html>
