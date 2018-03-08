package com.lixinxin.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.lixinxin.domain.User;
import com.lixinxin.service.LoginService;

public class AutoLoginFilter implements Filter {
	public AutoLoginFilter() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {		
		HttpServletRequest request = (HttpServletRequest) req;
		Cookie[] cookies = request.getCookies();
		String username = null;
		String password = null;
		if (cookies != null) {			
			for (Cookie cookie : cookies) {		
				if ("username".equals(cookie.getName())) {
					username = cookie.getValue();
				}
				if ("password".equals(cookie.getName())) {
					password = cookie.getValue();
				}
			}
		}
		
		if (username != null && password != null) {
			LoginService service = new LoginService();
			User user = service.login(username, password);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
			}
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
