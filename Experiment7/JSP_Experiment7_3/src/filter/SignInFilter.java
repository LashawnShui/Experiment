package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class SignInFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,FilterChain filterChain) throws IOException, ServletException {
		String username = new String(servletRequest.getParameter("username").getBytes("iso-8859-1"), "utf-8");
		if (username != null && username.length() > 0 && username.substring(0, 1).equals("T")) {
			((HttpServletResponse)servletResponse).sendRedirect("index.jsp?error=signIn&username=" + servletRequest.getParameter("username"));
		}else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
