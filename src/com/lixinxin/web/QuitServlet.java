package com.lixinxin.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class QuitServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cookie cookieUn=new Cookie("username","");
		Cookie cookiePw=new Cookie("password","");
		cookieUn.setMaxAge(0);
		cookiePw.setMaxAge(0);
		response.addCookie(cookieUn);
		response.addCookie(cookiePw);
		session.removeAttribute("user");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}