package com.shoppingmall.product.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubCategoryDAOImpl implements SubCategoryDAO{
	String TAG = this.getClass().getName();
	
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll(int topCategory_id) {
		
		List list = sessionTemplate.selectList("SubCategory.subCategoryList", topCategory_id);
		
		return list;
	}
}
