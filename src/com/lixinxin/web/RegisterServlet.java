package com.lixinxin.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.lixinxin.domain.User;
import com.lixinxin.service.RegisterService;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String word = (String) session.getAttribute("words");
		String checkcode = request.getParameter("checkcode");
		if (checkcode != null & !"".equals(checkcode)) {
			if (checkcode.equals(word)) {
				Map<String, String[]> map = request.getParameterMap();
				User user = new User();
				try {
					BeanUtils.populate(user, map);
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
				RegisterService service = new RegisterService();
				int rows = service.register(user);
				if (rows > 0) {
					response.sendRedirect("/day16_showProducts/skip.html");
				} else {
					response.sendRedirect("/day16_showProducts/register.jsp");
				}
			}else{
				request.setAttribute("message", "验证码错误！");
				request.getRequestDispatcher("/register.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("message", "请输入验证码！");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}