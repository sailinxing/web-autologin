package com.lixinxin.service;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.lixinxin.Utils.C3P0Utils;
import com.lixinxin.domain.User;

public class LoginDao {

	public User login(String username, String password) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from users where username=? and password=?";
		User user = null;
		try {
			user = qr.query(sql, new BeanHandler<User>(User.class), username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

}
