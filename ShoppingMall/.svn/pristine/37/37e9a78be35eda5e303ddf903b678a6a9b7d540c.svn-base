package com.shoppingmall.product.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventProductDAOImpl implements EventProductDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(int product_id, int eventinfo_id) {
		EventProduct1 eventProduct = new EventProduct1();
		eventProduct.setProduct_idd(product_id);
		eventProduct.setEventinfo_id(eventinfo_id);
		sqlSessionTemplate.insert("EventProduct.insertEvent", eventProduct);
	}

	@Override
	public void delete(int product_id, int eventinfo_id) {
		EventProduct1 eventProduct = new EventProduct1();
		eventProduct.setProduct_idd(product_id);
		eventProduct.setEventinfo_id(eventinfo_id);
		
		sqlSessionTemplate.delete("EventProduct.eventDelete", eventProduct);
		
	}

	@Override
	public List select(int eventinfo_id) {
		
		List list = sqlSessionTemplate.selectList("EventProduct.selectEvent", eventinfo_id);
		
		return list;
	}

	@Override
	public EventProduct dupleSelect(int product_id, int eventinfo_id) {
		EventProduct1 eventProduct = new EventProduct1();
		eventProduct.setProduct_idd(product_id);
		eventProduct.setEventinfo_id(eventinfo_id);
		
		EventProduct event = sqlSessionTemplate.selectOne("EventProduct.dupleSelect", eventProduct);
		
		return event;
	}

}
