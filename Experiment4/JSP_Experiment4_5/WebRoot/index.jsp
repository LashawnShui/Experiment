<%@page import="com.sun.faces.renderkit.html_basic.HtmlBasicRenderer.Param"%>
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
    <form action="user.jsp">
    	<div>
    		<div>
    			用户昵称：
    			<input type="text" name="nickname" value="${param.nickname }">
    		</div>
    		<div>
    			<span style="margin-right:2em;">密</span>码：
    			<input type="password" name="password" value="${param.password }">
    		</div>
    		<div>
    			确认密码：
    			<input type="password" name="confirmPassword" value="${param.confirmPassword }">
    		</div>
    		<div>
    			<span style="margin-right:2em;">性</span>别：
    			<input type="radio" name="sex" value="男"
    				<%
	    				if(request.getParameter("sex") != null && request.getParameter("sex").equals("男")){
	    					out.println("checked");
	    				}
    				%>
    			>男
    			<input type="radio" name="sex" value="女"
    				<%
	    				if(request.getParameter("sex") != null && request.getParameter("sex").equals("女")){
	    					out.println("checked");
	    				}
    				%>
    			>女
    		</div>
    		<div>
    			<span style="margin-right:2em;">爱</span>好：
    			<input type="checkbox" name="hobby" value="体育"
    				<%
    					if(request.getParameter("hobby") != null){
    						for(String hobby : request.getParameterValues("hobby")){
    							if(hobby.equals("体育")){
    								out.println("checked");
    								break;
    							}
    						}
    					}
    				%>
    			>体育
    			<input type="checkbox" name="hobby" value="美术"
    				<%
    					if(request.getParameter("hobby") != null){
    						for(String hobby : request.getParameterValues("hobby")){
    							if(hobby.equals("美术")){
    								out.println("checked");
    								break;
    							}
    						}
    					}
    				%>
    			>美术
    			<input type="checkbox" name="hobby" value="音乐"
    				<%
    					if(request.getParameter("hobby") != null){
    						for(String hobby : request.getParameterValues("hobby")){
    							if(hobby.equals("音乐")){
    								out.println("checked");
    								break;
    							}
    						}
    					}
    				%>
    			>音乐
    			<input type="checkbox" name="hobby" value="旅游"
    				<%
    					if(request.getParameter("hobby") != null){
    						for(String hobby : request.getParameterValues("hobby")){
    							if(hobby.equals("旅游")){
    								out.println("checked");
    								break;
    							}
    						}
    					}
    				%>
    			>旅游
    		</div>
    	</div>
    	<div>
    		<input type="submit" value="提交">
    		<button onclick="location.href='index.jsp'" type="button">重置</button>
    	</div>
    	<%
    		if(request.getParameter("errorType") != null){
    			if(request.getParameter("errorType").equals("1")){
	    			out.println("用户昵称不能为空！");
	    		}else if(request.getParameter("errorType").equals("2")){
	    			out.println("密码不能为空！");
	    		}else if(request.getParameter("errorType").equals("3")){
	    			out.println("确认密码不能为空！");
	    		}else if(request.getParameter("errorType").equals("4")){
	    			out.println("两次输入的密码不一致！");
	    		}else if(request.getParameter("errorType").equals("5")){
	    			out.println("性别不能为空！");
	    		}
    		}
    	%>
    </form>
  </body>
</html>
