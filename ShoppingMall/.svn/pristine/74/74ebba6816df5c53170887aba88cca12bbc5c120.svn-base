package com.shoppingmall.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingmall.member.model.Member;
import com.shoppingmall.member.service.MemberService;

import common.exception.DidNotCheckLoginException;

@Controller
@RequestMapping("/shopJSP")
public class MemberController {
	String tag = this.getClass().getName();
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;

	@RequestMapping("/registForm.do")
	public String regist(Member member) {
		System.out.println(tag + "해해해" + member.getName());
		memberService.insert(member);

		return "shopJSP/loginForm";
	}

	@RequestMapping("/checkId.do")
	public ModelAndView checkId(Member member, HttpServletResponse httpServletResponse) {
		System.out.println("어이디는" + member.getId());
		List list = memberService.selectId(member);
		ModelAndView mav = new ModelAndView("shopJSP/checkLoginResult");
		mav.addObject("msg", "사용가능한 아이디입니다");
		mav.addObject("result", "true");

		return mav;
	}

	// 로그인 아이디 비밀번호 체크
	@RequestMapping("/loginCheck.do")
	public ModelAndView checkLogin(HttpSession session, Member member) {
		System.out.println(member.getId());
		memberService.checkLogin(member);
		ModelAndView mav = new ModelAndView("shopJSP/checkLoginResult");
		session.setAttribute("id", member.getId());
		mav.addObject("msg", "로그인 성공");
		mav.addObject("result", "true");

		return mav;
	}

	// 로그인 아이디 비밀번호가 틀렸을때
	@ExceptionHandler(DidNotCheckLoginException.class)
	public ModelAndView handle(DidNotCheckLoginException e) {
		ModelAndView mav = new ModelAndView("shopJSP/checkLoginResult");
		mav.addObject("msg", e.getMessage());
		mav.addObject("result", "false");

		return mav;
	}

	// 로그아웃됬을떄
	@RequestMapping("/loginOut.do")
	public String loginOut(HttpSession session) {
		session.setAttribute("id", null);
		return "shopJSP/index";
	}

	// 마이페이지 정보 가져오기
	@RequestMapping("/myPage.do")
	public ModelAndView selectOne(HttpSession session) {
		String id = (String) session.getAttribute("id");

		ModelAndView mav = new ModelAndView("shopJSP/myPage");
		Member member = memberService.selectOne(id);

		mav.addObject("member", member);

		return mav;
	}
}
