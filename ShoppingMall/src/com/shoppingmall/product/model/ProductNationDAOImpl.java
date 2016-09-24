package com.shoppingmall.product.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductNationDAOImpl implements ProductNationDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public void insert(ProductNation productNation) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ProductNation productNation) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int product_id) {
		// TODO Auto-generated method stub
		
	}

}
