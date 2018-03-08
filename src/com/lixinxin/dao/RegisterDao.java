package com.lixinxin.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.lixinxin.Utils.C3P0Utils;
import com.lixinxin.domain.User;

public class RegisterDao {

	public int register(User user) {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into users(username,password,name,email,birthday,sex) values(?,?,?,?,?,?)";
		int rows = 0;
		try {
			rows = qr.update(sql, user.getUsername(), user.getPassword(), user.getName(), user.getEmail(),
					user.getBirthday(), user.getSex());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rows;
	}

}
