package com.shoppingmall.product.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductBrandDAOImpl implements ProductBrandDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public void insert(ProductBrand productBrand) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ProductBrand productBrand) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int productbrand_id) {
		// TODO Auto-generated method stub
		
	}


}
