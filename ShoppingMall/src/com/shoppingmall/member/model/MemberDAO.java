package com.shoppingmall.member.model;

import java.util.List;

public interface MemberDAO {
	public void insert(Member member);

	public List selectId(Member member);

	public int checkLogin(Member member);

	public Member selectOne(String id);
	
	public List selectAll();

}
