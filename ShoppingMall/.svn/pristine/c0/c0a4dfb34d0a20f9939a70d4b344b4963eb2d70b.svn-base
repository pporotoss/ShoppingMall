package com.shoppingmall.product.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TopCategoryDAOImpl implements TopCategoryDAO{

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List selectAll() {
		
		List list = sessionTemplate.selectList("TopCategory.topCategoryList");
		
		return list;
	}

}
