package com.shoppingmall.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.exception.DidNotCheckLoginException;

@Repository
public class MybatisMemberDAO implements MemberDAO {
	String tag = this.getClass().getName();

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(Member member) {
		// TODO Auto-generated method stub

		int result = sqlSessionTemplate.insert("Member.insert", member);
		System.out.println(tag + "마이바티스" + result);

	}

	@Override
	public List selectId(Member member) {

		List list = sqlSessionTemplate.selectList("Member.selectId", member);

		if (list.size() != 0) {
			throw new DidNotCheckLoginException("이미 아이디가 있습니다!");
		}
		return list;
	}

	@Override
	public int checkLogin(Member member) throws DidNotCheckLoginException {

		List list = sqlSessionTemplate.selectList("Member.checkLogin", member);
		System.out.println(tag + list.size());
		if (list.size() == 0) {
			throw new DidNotCheckLoginException("로그인 아이디 비밀번호를 확인하세요");
		}else{
			Member getMember=(Member)list.get(0);
			member.setId(getMember.getId());
		}

		return 0;
	}

	//내정보가져오기
	@Override
	public Member selectOne(String id) {
		System.out.println("id="+id);
		/*Member member=(Member)sqlSessionTemplate.selectMap("Member.selectOne", member1);*/
		Member member=sqlSessionTemplate.selectOne("Member.selectOne", id);
		return member;
	}

	@Override
	public List selectAll() {
		
		List list = sqlSessionTemplate.selectList("Member.selectAll");
		
		return list;
	}

}
