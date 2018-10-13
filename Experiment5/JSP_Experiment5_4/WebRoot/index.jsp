<%@page import="bean.Employee"%>
<%@page import="dao.EmployeeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utils.DBUtils"%>
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
    	EmployeeDao employeeDao = new EmployeeDao();
  		ArrayList<Employee> employees = employeeDao.selectAll();
  		if(request.getParameter("job") != null && request.getParameter("job").equals("") == false) {
  			employees = employeeDao.selectByJob(request.getParameter("job"));
  		}
  		String[] titles = {"emp_id", "emp_name", "job", "salary", "dept", "操作"};
    %>
    <div class="container">
    	<div>
    		<form action="index.jsp">
    			根据job的值：<input type="text" name="job" value="${param.job }">
    			<input type="submit" value="查询">
    			<button onclick="location.href='index.jsp'" type="button">重置</button>
    		</form>
    	</div>
    	<div class="container-form">
	    	<div class="form-content">
	    		<div class="content-title">
	    			<%
	    				for(int i = 0;i < titles.length;i++) {
	    					%>
	   						<div>
	   							<%= titles[i] %>
	   						</div>
	    					<%
	    				}
	    			%>
	    		</div>
    			<%
    				for(Employee employee : employees) {
    					Object[] values = {employee.getEmp_id(), employee.getEmp_name(), employee.getJob(), employee.getSalary(), employee.getDept()};
    					%>
   						<div class="content-row">
   							<%
			    				for(int i = 0;i < values.length;i++) {
			    					%>
			   						<div>
			   							<%= values[i] %>
			   						</div>
			    					<%
			    				}
			    			%>
			    			<div>
			    				<a href="employee.jsp?type=update&emp_id=<%= employee.getEmp_id() %>">修改</a>
			    				<a href="employee.jsp?type=delete&emp_id=<%= employee.getEmp_id() %>">删除</a>
			    			</div>
   						</div>
    					<%
    				}
    			%>
    		</div>
    		<div class="form-options">
				<button onclick="location.href='employee.jsp?type=insert'">添加员工信息</button>
			</div>
    	</div>
   	</div>
  </body>
</html>
