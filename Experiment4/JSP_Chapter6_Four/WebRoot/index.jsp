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
    		<div>
    			一个数字：
    			<input type="text" name="number" value="${param.number }">
    		</div>
    	</div>
    	<div>
    		<input type="submit" value="提交">
    		<button onclick="location.href='index.jsp'" type="button">重置</button>
    	</div>
    </form>
    <%
    	if(request.getParameter("number") != null){
    		String numberString = request.getParameter("number");
    		int number = 0;
    		int errorType = 0;
    		if(numberString.equals("")){
    			errorType = 1;
    		}else{
	    		try{
	    			number = Integer.parseInt(numberString);
	    		}catch(NumberFormatException numberFormatException){
	    			errorType = 2;
	    		}
	    		if(errorType == 0 && (number > 9 || number < 1)){
	    			errorType = 3;
	    		}
	    	}
	    	if(errorType == 0){
	    		for(int i = 1;i <= number;i++){
	    			request.setAttribute("i", i);
	    			%>
	    				<div>
		   					<%
		   						for(int j = 1;j <= i;j++){
		   							request.setAttribute("j", j);
		   							%>
		   								<span>${i }*${j }=${i*j }</span>
		   							<%
		   						}
		   					%>
	    				</div>
	    			<%
	    		}
	    	}else if(errorType == 1){
	    		out.println("数字不能为空！");
	    	}else if(errorType == 2){
	    		out.println("数字格式有误！");
	    	}else if(errorType == 3){
	    		out.println("数字需在1-9之间！");
	    	}
    	}
    %>
  </body>
</html>
