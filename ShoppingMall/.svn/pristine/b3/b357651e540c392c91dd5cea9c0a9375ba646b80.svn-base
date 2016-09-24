package com.shoppingmall.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shoppingmall.admin.model.Admin;
import com.shoppingmall.admin.model.Notice;
import com.shoppingmall.product.model.Product;
public interface AdminService {
	// 로그인
	public void login(Admin admin, HttpSession session);
	
	// 로그아웃
	public void logout(HttpSession session);
	
	// 상품등록 페이지 자료 가져오기
	public Map registProduct();
	
	// 상품등록하기
	public void insert(Product product, String[] panelsize_id, HttpServletRequest request);
	
	public List getSubCategory(int topCategory_id);
	
	// 상품 리스트 가져오기
	public List selectAll();
	
	// 이벤트 이름 리스트 가져오기
	public List eventAll();
	
	// 상품 삭제하기
	public void productDelete(String[] product_id, String[] filename, HttpServletRequest request);
	
	// 이벤트 등록
	public void eventRegist(String[] product_id, String eventinfo_id);
	
	// 이벤트 정렬
	public List eventSelect(int eventinfo_id);
	
	// 이벤트 삭제
	public void eventDelete(String[] product_id, int eventinfo_id);
	
	// 이벤트 중복검사
	public List duplicateEvent(String[] product_id, int eventinfo_id);
	
	// 전체 멤버 불러오기!!
	public List allMember();
	
	// 공지사항 입력하기
	public void noticeWrite(Notice notice);
	
	// 공지사항 수정하기
	public void noticeUpdate(Notice notice);
	
	// 공지사항 전체 가져오기
	public List noticeAll();
		
	// 공지사항 한건 가져오기
	public Notice noticeOne(int notice_id);
	
	// 공지사항 삭제하기
	public void noticeDelete(int notice_id);
		
	
}
