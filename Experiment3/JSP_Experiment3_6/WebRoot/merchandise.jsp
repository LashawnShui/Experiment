<%@page import="bean.MerchandiseList"%>
<%@page import="bean.ShoppingCar"%>
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
    
    <title>My JSP 'merchandise.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/merchandise.css">

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
  	<%
    	Merchandise currentMerchandise;
    	if(session.getAttribute("currentMerchandise") == null){
    		currentMerchandise = new Merchandise();
    		session.setAttribute("currentMerchandise", currentMerchandise);
    	}else{
    		currentMerchandise = (Merchandise)session.getAttribute("currentMerchandise");
    	}
    %>
  	<%
  		long id = Long.parseLong(request.getParameter("merchandiseId"));
  		for(Merchandise merchandise : merchandiseList.getMerchandises()){
  			if(merchandise.getId() == id){
  				currentMerchandise = merchandise;
  				session.setAttribute("currentMerchandise", currentMerchandise);
  				break;
  			}
  		}
  	%>
  	<%
    	ShoppingCar shoppingCar;
    	if(session.getAttribute("shoppingCar") == null){
    		shoppingCar = new ShoppingCar();
    		session.setAttribute("shoppingCar", shoppingCar);
    	}else{
    		shoppingCar = (ShoppingCar)session.getAttribute("shoppingCar");
    	}
    %>
  	<div class="container">
	    <header>商城</header>
	    <section>
		    <div class="merchandise">
		    	<div class="merchandise-content">
		    		<div class="content-title">详情信息</div>
		    		<div class="content-image">
		    			<img src="<%= currentMerchandise.getImageURL() %>">
		    		</div>
		    		<div class="content-name">
						<%= "商品名：" + currentMerchandise.getName() %>
					</div>
		    		<div class="content-unitPrice">
		    			<%= "单价：¥" + currentMerchandise.getUnitPrice() %>
		    		</div>
		    	</div>
		    	<div class="merchandise-option">
		    		<a href="addToShoppingCarAction">加入购物车</a>
		    		<a href="shoppingCar.jsp">查看购物车</a>
		    		<a href="index.jsp">返回商城</a>
		    	</div>
		    </div>
	    </section>
	    <footer>2018-LashawnShui</footer>
    </div>
  </body>
</html>
