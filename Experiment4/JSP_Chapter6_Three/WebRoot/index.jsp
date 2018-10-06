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
	<style>
		body{
			background-color:${param.bgcolor };
			font-size:${param["font-size"] };
		}
		table{
			width:${param.width };
			border:${param.border };
		}
	</style>
  </head>
  
  <body>
    <form action="">
    	<div>
    		<div>
    			背景颜色：
    			<input type="text" name="bgcolor" value="${param.bgcolor }">
    		</div>
    		<div>
    			字号大小：
    			<input type="text" name="font-size" value="${param['font-size'] }">
    		</div>
    		<div>
    			表格宽度：
    			<input type="text" name="width" value="${param.width }">
    		</div>
    		<div>
    			表格边框：
    			<input type="text" name="border" value="${param.border }">
    		</div>
    	</div>
    	<div>
    		<input type="submit" value="提交">
    		<button onclick="location.href='index.jsp'" type="button">重置</button>
    	</div>
    </form>
    <table border="1" cellpadding="0" cellspacing="0">
    	<tr>
    		<td>1-1</td>
    		<td>1-2</td>
    		<td>1-3</td>
    	</tr>
    	<tr>
    		<td>2-1</td>
    		<td>2-2</td>
    		<td>2-3</td>
    	</tr>
    </table>
  </body>
</html>
