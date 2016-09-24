package com.shoppingmall.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.shoppingmall.member.model.Member;
import com.shoppingmall.member.model.MemberDAO;

import common.exception.DidNotCheckLoginException;

@Service
public class MemberServiceImpl implements MemberService {
	String tag = this.getClass().getName();

	@Autowired
	@Qualifier("mybatisMemberDAO")
	private MemberDAO memberDAO;

	@Override
	public void insert(Member member) {
		// TODO Auto-generated method stub
		System.out.println(tag + "dd");
		memberDAO.insert(member);
	}

	@Override
	public List selectId(Member member) throws DidNotCheckLoginException{
		// TODO Auto-generated method stub
		List list = memberDAO.selectId(member);

		return list;
	}

	@Override
	public int checkLogin(Member member) throws DidNotCheckLoginException {
		int result = memberDAO.checkLogin(member);
		return result;
	}
	
	//내정보가져오기
	@Override
	public Member selectOne(String id) {
		Member member=memberDAO.selectOne(id);
		return member;
	}

}
