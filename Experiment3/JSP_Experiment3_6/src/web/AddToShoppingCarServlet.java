package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Merchandise;
import bean.ShoppingCar;

public class AddToShoppingCarServlet extends HttpServlet {

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
		Merchandise currentMerchandise = (Merchandise)request.getSession().getAttribute("currentMerchandise");
		shoppingCar.addToShoppingCar(currentMerchandise);
		response.sendRedirect("merchandise.jsp?merchandiseId=" + currentMerchandise.getId());
	}

}
