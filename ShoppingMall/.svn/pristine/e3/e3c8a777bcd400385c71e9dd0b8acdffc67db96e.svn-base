package com.shoppingmall.product.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insert(Product product) {
		int key = 0; 
		
		sqlSessionTemplate.insert("Product.insert", product);
		
		key = product.getProduct_id();
		
		return key;
	}

	@Override
	public List selectAll() {
		
		List list = sqlSessionTemplate.selectList("Product.selectAll");
		
		return list;
	}

	@Override
	public int update(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int product_id) {
		
		sqlSessionTemplate.delete("Product.delete",product_id);
		
		return 0;
	}


	@Override
	public Product select(int product_id) {
		
		Product product = (Product)sqlSessionTemplate.selectOne("Product.selectOne", product_id);
		
		return product;
	}

}
