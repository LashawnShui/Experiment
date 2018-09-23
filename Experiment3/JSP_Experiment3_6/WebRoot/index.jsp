<%@page import="bean.MerchandiseList"%>
<%@page import="bean.Merchandise"%>
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
	<link rel="stylesheet" type="text/css" href="css/index.css">
  </head>
  
  <body>
    <%
    	MerchandiseList merchandiseList;
    	if(session.getAttribute("merchandiseList") == null){
    		merchandiseList = new MerchandiseList();
    		session.setAttribute("merchandiseList", merchandiseList);
    	}else{
    		merchandiseList = (MerchandiseList)session.getAttribute("merchandiseList");
    	}
    %>
    <div class="container">
	    <header>商城</header>
	    <section>
		    <div class="merchandises">
		    	<div class="merchandises-content">
		    		<div class="content-title">
		    			<div class="title-merchandise">商品</div>
		    			<div class="title-unitPrice">单价</div>
		    		</div>
				    <%
				    	for(Merchandise merchandise : merchandiseList.getMerchandises()){
				    		%>
				    			<div class="content-item">
				    				<div class="item-image">
				    					<img src="<%= merchandise.getImageURL() %>">
				    				</div>
				    				<div class="item-name">
				    					<a href="<%= "merchandise.jsp?merchandiseId=" + merchandise.getId() %>"><%= merchandise.getName() %></a>
				    				</div>
				    				<div class="item-unitPrice">
				    					<%= "¥" + merchandise.getUnitPrice() %>
				    				</div>
				    			</div>
				    		<%
				    	}
				    %>
			    </div>
			    <div class="merchandises-option">
			    	<a href="shoppingCar.jsp">查看购物车</a>
			    </div>
		    </div>
	    </section>
	    <footer>2018-LashawnShui</footer>
    </div>
  </body>
</html>
