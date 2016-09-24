package com.shoppingmall.admin.model;

import java.util.List;

public interface NoticeDAO {
	
	// 게시물 전체 가져오기
	public List selectAll();
	
	// 게시물 한건 가져오기
	public Notice selectOne(int notice_id);
	
	// 게시물 입력하기
	public void insert(Notice notice);
	
	// 게시물 삭제하기
	public void delete(int notice_id);
	
	// 게시물 갱신하기
	public void update(Notice notice);
	
	// 히트수 증가
	public void updateHit(int notice_id);
}
