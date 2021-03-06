package com.shoppingmall.product.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductSizeDAOImpl implements ProductSizeDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public void insert(ProductSize productSize) {
		sessionTemplate.insert("ProductSize.insert", productSize);
	}

	@Override
	public void update(ProductSize productSize) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int product_id) {
		
		sessionTemplate.delete("ProductSize.delete",product_id);
		
	}

}
