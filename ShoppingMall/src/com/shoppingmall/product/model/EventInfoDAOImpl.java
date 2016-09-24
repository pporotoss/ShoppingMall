package com.shoppingmall.product.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventInfoDAOImpl implements EventInfoDAO{
	String TAG = this.getClass().getName();
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; 
	
	@Override
	public List selectAll() {
		
		List list = sqlSessionTemplate.selectList("EventInfo.eventList");
		
		return list;
	}

}
