package com.shoppingmall.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		
		List list = sqlSessionTemplate.selectList("Notice.selectAll");
		
		return list;
	}

	@Override
	public Notice selectOne(int notice_id) {
		
		Notice notice = sqlSessionTemplate.selectOne("Notice.selectOne", notice_id);
		
		return notice;
	}

	@Override
	public void insert(Notice notice) {
		
		sqlSessionTemplate.insert("Notice.insert", notice);
		
	}

	@Override
	public void delete(int notice_id) {
		
		sqlSessionTemplate.delete("Notice.delete", notice_id);
		
	}

	@Override
	public void update(Notice notice) {
		
		sqlSessionTemplate.update("Notice.update", notice);
	}

	@Override
	public void updateHit(int notice_id) {
		
		sqlSessionTemplate.update("Notice.updateHit", notice_id);
		
	}

}
