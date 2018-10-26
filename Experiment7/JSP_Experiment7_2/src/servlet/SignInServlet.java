package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDao;

public class SignInServlet extends HttpServlet {
	
	private static final long serialVersionUID = -1796253459564619592L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		ArrayList<User> users = userDao.signIn(
			request.getParameter("username"), 
			request.getParameter("password")
		);
		if (users.size() > 0) {
			request.getSession().setAttribute("user", users.get(0));
			response.sendRedirect("welcome.jsp");
		} else {
			request.getSession().setAttribute("signInErrorMessage", "�û������������");
			response.sendRedirect("index.jsp?error=signIn&username=" + request.getParameter("username"));
		}
	}

}
