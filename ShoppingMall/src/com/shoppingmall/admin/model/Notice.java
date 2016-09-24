package com.shoppingmall.admin.model;

public class Notice {
	private int notice_id;
	private String writer;
	private String title;
	private String content;
	private String regdate;
	private int hit;
	
	public int getNotice_id() {
		return notice_id;
	}
	public String getWriter() {
		return writer;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getRegdate() {
		return regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
