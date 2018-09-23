<%@page import="util.NumericalTreatment"%>
<%@page import="bean.MerchandiseItem"%>
<%@page import="bean.ShoppingCar"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'settlement.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/settlement.css">

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
	    <header>我的购物车(结算页)</header>
	    <section>
		    <div class="shoppingCar">
		    	<div class="shoppingCar-content">
		    		<div class="content-title">
		    			<div class="title-merchandise">商品</div>
		    			<div class="title-unitPrice">单价</div>
		    			<div class="title-number">数量</div>
		    			<div class="title-subtotal">小计</div>
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
			    					<%= merchandiseItem.getNumber() %>
			    				</div>
			    				<div class="item-subtotal">
			    					<%= "¥" + NumericalTreatment.retainedDecimal(merchandiseItem.getSubtotal()) %>
			    				</div>
			    			</div>
			    		<%
				    	}
				    %>
				    <div class="content-information">
				   		<div class="information-number">
				    		<%= "数量：" + shoppingCar.getNumber() %>
				    	</div>
				    	<div class="information-total">
				    		<%= "总计：¥" + NumericalTreatment.retainedDecimal(shoppingCar.getTotal()) %>
				    	</div>
			    </div>
			    </div>
		    </div>
	    </section>
	    <footer>2018-LashawnShui</footer>
    </div>
  </body>
</html>
