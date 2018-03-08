package com.lixinxin.service;

import com.lixinxin.domain.User;

public class LoginService {

	public User login(String username, String password) {
		LoginDao dao=new LoginDao();
		User user = dao.login(username,password);
		return user;
	}

}
