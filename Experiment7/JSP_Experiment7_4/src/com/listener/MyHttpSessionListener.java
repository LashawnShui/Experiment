package com.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MyHttpSessionListener implements HttpSessionListener {

	public void sessionCreated(HttpSessionEvent arg0) {
		ServletContext application = arg0.getSession().getServletContext();
		Integer onlineSessions = (Integer)application.getAttribute("onlineSessions");
		if (onlineSessions == null) {
			onlineSessions = new Integer(1);
		} else {
			int count = onlineSessions.intValue() + 1;
			onlineSessions = new Integer(count);
		}
		application.setAttribute("onlineSessions", onlineSessions);
		System.out.println("当前在线的人数：" + application.getAttribute("onlineSessions") + "人");
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		ServletContext application = arg0.getSession().getServletContext();
		Integer onlineSessions = (Integer)application.getAttribute("onlineSessions");
		if (onlineSessions == null) {
			onlineSessions = new Integer(0);
		} else {
			int count = onlineSessions.intValue() - 1;
			onlineSessions = new Integer(count);
		}
		application.setAttribute("onlineSessions", onlineSessions);
		System.out.println("当前在线的人数：" + application.getAttribute("onlineSessions") + "人");
	}

}
