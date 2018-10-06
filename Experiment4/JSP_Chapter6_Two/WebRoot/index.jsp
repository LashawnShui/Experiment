<%@page import="bean.Numbers"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
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
    <form action="">
    	<div>
   		<%
   			for(int i = 0;i < 2;i++){
   				request.setAttribute("i", i);
				%>
					<div>
			    		<%= "第" + (i+1) + "个数：" %>
			    		<input type="text" name="number" value="${paramValues.number[i] }">
			    	</div>
				<%
   			}
   		%>
    	</div>
    	<div>
    		<input type="submit" value="比较">
    		<button onclick="location.href='index.jsp'" type="button">重置</button>
    	</div>
    </form>
    <%
    	if(request.getParameter("number") != null){
    		Numbers numbers = new Numbers();
    		int errorType = 0;
    		for(String numberString : request.getParameterValues("number")){
    			if(numberString.equals("")){
    				errorType = 1;
    				break;
    			}
    			double number;
    			try{
    				number = Double.parseDouble(numberString);
    			}catch(NullPointerException nullPointerException){
    				errorType = 1;
    				break;
    			}catch(NumberFormatException numberFormatException){
    				errorType = 2;
    				break;
    			}
    			numbers.getNumbers().add(number);
    		}
    		if(errorType == 0){
    			out.println("第1个数 " + (numbers.getNumbers().get(0) < numbers.getNumbers().get(1) ? "<" : numbers.getNumbers().get(0).equals(numbers.getNumbers().get(1)) ? "=" : ">") + " 第2个数<br>");
    		}else if(errorType == 1){
    			out.println("数字不能为空！");
    		}else if(errorType == 2){
    			out.println("数字格式有误！");
    		}
    	}
    %>
  </body>
</html>
