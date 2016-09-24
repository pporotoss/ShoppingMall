<%@page import="com.shoppingmall.product.model.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Product> list = (List)request.getAttribute("list");
	StringBuffer sb = new StringBuffer();
	if(list.size() != 0){
		sb.append("{");
			sb.append("\"productList\":[");
			for(int i = 0; i < list.size(); i++){
				Product product = list.get(i);
				sb.append("{");
					sb.append("\"product_name\":\""+product.getProduct_name()+"\"");
				if(i < list.size()-1){
					sb.append("},");
				}else{
					sb.append("}");
				}
			}
			sb.append("]");
		sb.append("}");
		out.print(sb.toString());
	}else{
		out.print("false");
	}
%>