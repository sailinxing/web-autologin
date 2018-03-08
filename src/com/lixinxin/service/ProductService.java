package com.lixinxin.service;

import java.sql.SQLException;
import java.util.List;

import com.lixinxin.dao.ProductDao;
import com.lixinxin.domain.Product;

public class ProductService {

	public List<Product> findAllProducts() {
		ProductDao dao=new ProductDao();
		List<Product> listProduct=null;
		try {
			listProduct = dao.findAllProducts();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listProduct;
	}

}
