<%@page import="util.NumericalTreatment"%>
<%@page import="bean.ShoppingCar"%>
<%@page import="bean.MerchandiseItem"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shoppingCar.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/shoppingCar.css">

  </head>
  
  <body>
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
	    <header>我的购物车</header>
	    <section>
		    <div class="shoppingCar">
		    	<div class="shoppingCar-content">
		    		<div class="content-title">
		    			<div class="title-merchandise">商品</div>
		    			<div class="title-unitPrice">单价</div>
		    			<div class="title-number">数量</div>
		    			<div class="title-subtotal">小计</div>
		    			<div class="title-option">操作</div>
		    		</div>
				    <%
				    	for(MerchandiseItem merchandiseItem : shoppingCar.getMerchandiseItems()){
				    		%>
				    			<div class="content-item">
				    				<div class="item-image">
				    					<img src="<%= merchandiseItem.getMerchandise().getImageURL() %>">
				    				</div>
				    				<div class="item-name">
				    					<%= merchandiseItem.getMerchandise().getName() %>
				    				</div>
				    				<div class="item-unitPrice">
				    					<%= "¥" + merchandiseItem.getMerchandise().getUnitPrice() %>
				    				</div>
				    				<div class="item-number">
					    				<%
					    					if(merchandiseItem.getNumber()>1){
					    				%>
				    					<a href="<%= "changeNumberAction?type=0&merchandiseId=" + merchandiseItem.getMerchandise().getId() %>">-</a>
				    					<%
				    						}
				    					%>
				    					<%= merchandiseItem.getNumber() %>
				    					<a href="<%= "changeNumberAction?type=1&merchandiseId=" + merchandiseItem.getMerchandise().getId() %>">+</a>
				    				</div>
				    				<div class="item-subtotal">
				    					<%= "¥" + NumericalTreatment.retainedDecimal(merchandiseItem.getSubtotal()) %>
				    				</div>
				    				<div class="item-option">
				    					<a href="<%= "deleteMerchandiseItemAction?type=0&merchandiseId=" + merchandiseItem.getMerchandise().getId() %>">删除</a>
				    				</div>
				    			</div>
				    		<%
				    	}
				    %>
			    </div>
			    <div class="shoppingCar-option">
			    	<a href="deleteMerchandiseItemAction?type=1">清空购物车</a>
			    	<a href="settlement.jsp">结算</a>
			    	<a href="index.jsp">返回商城</a>
			    </div>
		    </div>
	    </section>
	    <footer>2018-LashawnShui</footer>
    </div>
  </body>
</html>
