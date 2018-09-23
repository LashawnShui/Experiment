package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MerchandiseItem;
import bean.ShoppingCar;

public class ChangeNumberServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ShoppingCar shoppingCar = (ShoppingCar)request.getSession().getAttribute("shoppingCar");
		long id = Long.parseLong(request.getParameter("merchandiseId"));
		if(request.getParameter("type").equals("0")){
			for(MerchandiseItem merchandiseItem : shoppingCar.getMerchandiseItems()){
				if(merchandiseItem.getMerchandise().getId() == id){
					merchandiseItem.setNumber(merchandiseItem.getNumber() - 1);
					break;
				}
			}
		}else if(request.getParameter("type").equals("1")){
			for(MerchandiseItem merchandiseItem : shoppingCar.getMerchandiseItems()){
				if(merchandiseItem.getMerchandise().getId() == id){
					merchandiseItem.setNumber(merchandiseItem.getNumber() + 1);
					break;
				}
			}
		}
		response.sendRedirect("shoppingCar.jsp");
	}

}
