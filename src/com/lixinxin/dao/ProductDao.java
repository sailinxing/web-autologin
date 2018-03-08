package com.lixinxin.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.lixinxin.Utils.C3P0Utils;
import com.lixinxin.domain.Product;


public class ProductDao {

	public List<Product> findAllProducts() throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from product";
		List<Product> listProduct = qr.query(sql, new BeanListHandler<Product>(Product.class));
		return listProduct;
	}



}
