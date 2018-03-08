package com.lixinxin.service;

import com.lixinxin.dao.RegisterDao;
import com.lixinxin.domain.User;

public class RegisterService {

	public int register(User user) {
		RegisterDao dao=new RegisterDao();		
		int rows = dao.register(user);
		return rows;
	}	
}
