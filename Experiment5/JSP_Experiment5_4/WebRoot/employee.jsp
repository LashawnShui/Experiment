<%@page import="utils.DBUtils"%>
<%@page import="dao.EmployeeDao"%>
<%@page import="bean.Employee"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'employee.jsp' starting page</title>
    
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
    	EmployeeDao employeeDao = new EmployeeDao();
    	if(request.getParameter("do") != null) {
    		if(request.getParameter("do").equals("insert")) {
    			try {
    				employeeDao.insertEmployee(new Employee(
    					0,
    					request.getParameter("emp_name"),
    					request.getParameter("job"),
    					Double.parseDouble(request.getParameter("salary")),
    					Integer.parseInt(request.getParameter("dept"))
    				));
    				response.sendRedirect("index.jsp");
    			} catch (Exception exception) {
    				response.sendRedirect("employee.jsp?type=insert&error=insert");
    			}
    		} else if(request.getParameter("do").equals("update")) {
    			try {
    				employeeDao.updateEmployee(new Employee(
    					Integer.parseInt(request.getParameter("emp_id")),
    					request.getParameter("emp_name"),
    					request.getParameter("job"),
    					Double.parseDouble(request.getParameter("salary")),
    					Integer.parseInt(request.getParameter("dept"))
    				));
    				response.sendRedirect("index.jsp");
    			} catch (Exception exception) {
    				response.sendRedirect("employee.jsp?type=update&emp_id=" + request.getParameter("emp_id") + "&error=update");
    			}
    		} else if(request.getParameter("do").equals("delete")) {
    			try {
    				employeeDao.deleteById(Integer.parseInt(request.getParameter("emp_id")));
    				response.sendRedirect("index.jsp");
    			} catch (Exception exception) {
    				exception.printStackTrace();
    			}
    		}
    	}
    	if(request.getParameter("type") != null) {
    		if(request.getParameter("type").equals("insert")) {
    			%>
    				<div>
	    				<form action="employee.jsp">
	    					<div>新增员工信息</div>
	    					<div>
	    						emp_name:<br>
	    						<input type="text" name="emp_name">
	    					</div>
	    					<div>
	    						job:<br>
	    						<input type="text" name="job">
	    					</div>
	    					<div>
	    						salary:<br>
	    						<input type="text" name="salary">
	    					</div>
	    					<div>
	    						dept:<br>
	    						<input type="text" name="dept">
	    					</div>
	    					<input type="hidden" name="do" value="insert">
	    					<div>
			    				<input type="submit" value="添加">
    							<button onclick="location.href='index.jsp'" type="button">取消</button>
			    			</div>
			    			<%
			    				if(request.getParameter("error") != null && request.getParameter("error").equals("insert")){
			    					%>
			    					<div>新增的员工信息有误</div>
			    					<%
			    				}
			    			%>
	    				</form>
    				</div>
    			<%
    		} else if(request.getParameter("type").equals("update")) {
    			Employee employee = employeeDao.selectById(Integer.parseInt(request.getParameter("emp_id")));
    			%>
					<div>
	    				<form action="employee.jsp">
	    					<div>修改员工信息</div>
	    					<div>
	    						emp_name:<br>
	    						<input type="text" name="emp_name" value="<%= employee.getEmp_name() %>">
	    					</div>
	    					<div>
	    						job:<br>
	    						<input type="text" name="job" value="<%= employee.getJob() %>">
	    					</div>
	    					<div>
	    						salary:<br>
	    						<input type="text" name="salary" value="<%= employee.getSalary() %>">
	    					</div>
	    					<div>
	    						dept:<br>
	    						<input type="text" name="dept" value="<%= employee.getDept() %>">
	    					</div>
	    					<input type="hidden" name="do" value="update">
	    					<input type="hidden" name="emp_id" value="<%= employee.getEmp_id() %>">
	    					<div>
			    				<input type="submit" value="修改">
    							<button onclick="location.href='index.jsp'" type="button">取消</button>
			    			</div>
			    			<%
			    				if(request.getParameter("error") != null && request.getParameter("error").equals("update")){
			    					%>
			    					<div>修改的员工信息有误</div>
			    					<%
			    				}
			    			%>
	    				</form>
    				</div>
				<%
    		} else if(request.getParameter("type").equals("delete")) {
    			response.sendRedirect("employee.jsp?do=delete&emp_id=" + request.getParameter("emp_id"));
    		}
    	}
    %>
  </body>
</html>
