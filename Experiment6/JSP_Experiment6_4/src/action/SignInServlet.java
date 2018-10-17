package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

import bean.User;

public class SignInServlet extends HttpServlet {
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
			request.getSession().setAttribute("signInErrorMessage", "用户名或密码错误！");
			response.sendRedirect("index.jsp?error=signIn&username=" + request.getParameter("username"));
		}
	}
}
