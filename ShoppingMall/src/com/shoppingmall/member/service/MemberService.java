package com.shoppingmall.member.service;

import java.util.List;

import com.shoppingmall.member.model.Member;

public interface MemberService {
	public void insert(Member member);
	public List selectId(Member member);
	public int checkLogin(Member member);
	public Member selectOne(String id);
}
