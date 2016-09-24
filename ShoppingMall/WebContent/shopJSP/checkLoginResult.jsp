<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String result = (String) request.getAttribute("result");
	StringBuffer sb = new StringBuffer();

	sb.append("{");
	sb.append("\"msg\":\"" + msg + "\",");
	sb.append("\"result\":\"" + result + "\"");
	sb.append("}");
	
	out.print(sb.toString());
%>
