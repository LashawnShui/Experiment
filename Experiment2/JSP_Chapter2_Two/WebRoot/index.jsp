<%@ page import="bean.Student" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
    	Student studentOne = new Student("001","李白","男","01",723.0);
    	Student studentTwo = new Student("002","孟浩然","男","02",689.0);
    	Student studentThree = new Student("003","杨玉环","女","03",600.0);
    	ArrayList<Student> arrayList = new ArrayList<Student>();
    	arrayList.add(studentOne);
    	arrayList.add(studentTwo);
    	arrayList.add(studentThree);
    %>
    <table border="1" cellspacing="0" cellpadding="0">
    	<tr>
    		<td>学号</td>
    		<td>姓名</td>
    		<td>性别</td>
    		<td>班级</td>
    		<td>成绩</td>
    	</tr>
    	<%
    		for(Student student : arrayList){
    			%>
    			<tr>
		    		<td><%= student.getId() %></td>
		    		<td><%= student.getName() %></td>
		    		<td><%= student.getSex() %></td>
		    		<td><%= student.getClass_id() %></td>
		    		<td><%= student.getGrade() %></td>
		    	</tr>
		    	<%
    		}
    	%>
    </table>
  </body>
</html>
