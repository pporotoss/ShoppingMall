package com.shoppingmall.product.model;

import java.util.List;

public interface EventProductDAO {
	
	public void insert(int product_id, int eventinfo_id);
	
	public void delete(int product_id, int eventinfo_id);
	
	public List select(int eventinfo_id);
	
	public EventProduct dupleSelect(int product_id, int eventinfo_id);
}
