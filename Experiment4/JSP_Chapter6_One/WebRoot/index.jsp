<%@page import="bean.Grade"%>
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
    		for(int i = 0;i < 5;i++){
	    		request.setAttribute("i", i);
	    		%>
	    			<div>
	    				<%= "第" + (i+1) + "门学科的成绩(0-100之间)：" %>
	    				<input type="text" name="score" value="${ paramValues.score[i] }">
	    			</div>
	    		<%
    		}
    	%>
    	</div>
    	<div>
    		<input type="submit" value="提交">
			<button onclick="location.href='index.jsp'" type="button">清空</button>
    	</div>
    </form>
    <%
    	if(request.getParameter("score") != null){
	    	Grade grade = new Grade();
	    	int errorType = 0;
	    	//接收
	   		for(String scoreString : request.getParameterValues("score")){
	   			double score;
	   			try{
	   				score = Double.parseDouble(scoreString);
	   			}catch(NullPointerException nullPointerException){
	   				errorType = 1;
	   				break;
	   			}catch(NumberFormatException numberFormatException){
	   				errorType = 2;
	   				break;
	   			}
	   			if(score > 100 || score < 0){
	   				errorType = 3;
	   				break;
	   			}
	   			grade.getScores().add(score);
	   		}
	   		//显示
	    	if(errorType == 0){
	    		double sum = 0;
		    	for(Double score : grade.getScores()){
		    		sum += score;
		    	}
		    	out.println("总分：" + sum + "<br>平均分：" + sum/grade.getScores().size());
	    	}else if(errorType ==1){
	    		out.println("成绩不能为空！");
	    	}else if(errorType ==2){
	    		out.println("成绩格式有误！");
	    	}else if(errorType ==3){
	    		out.println("成绩需在0-100之间！");
	    	}
    	}
    %>
  </body>
</html>
