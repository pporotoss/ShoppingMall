package com.shoppingmall.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Admin select(Admin admin) {
		
		return sqlSessionTemplate.selectOne("Admin.selectOne", admin);
	}

}
