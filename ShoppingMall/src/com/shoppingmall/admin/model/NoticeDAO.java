package com.shoppingmall.admin.model;

import java.util.List;

public interface NoticeDAO {
	
	// �Խù� ��ü ��������
	public List selectAll();
	
	// �Խù� �Ѱ� ��������
	public Notice selectOne(int notice_id);
	
	// �Խù� �Է��ϱ�
	public void insert(Notice notice);
	
	// �Խù� �����ϱ�
	public void delete(int notice_id);
	
	// �Խù� �����ϱ�
	public void update(Notice notice);
	
	// ��Ʈ�� ����
	public void updateHit(int notice_id);
}
