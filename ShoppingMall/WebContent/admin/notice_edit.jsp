<%@page import="com.shoppingmall.admin.model.Notice"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Notice detail = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 페이지</title>
	<!-- CKEditor -->
	<script src="//cdn.ckeditor.com/4.5.9/standard/ckeditor.js"></script>
	<script>
		
		// 등록하기
		function regist(){
			editForm.action="/admin/editnotice.do";
			editForm.method="post";
			editForm.submit();
		}
		
	</script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<%@ include file="/include/adminTopNav.jsp"%>
	<!-- 좌측메뉴 -->
	<%@ include file="/include/adminSideNav.jsp" %>

	<!-- 본문영역 -->
	<div class="container">
		<form class="form-horizontal" role="form" name="editForm">
			<input type="hidden" name="notice_id" value="<%=detail.getNotice_id()%>">
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<h2 align="center">수정하기<br><br></h2>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">
					<input class="form-control" name="writer" type="text" value="<%=detail.getWriter()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">제 목 </label>
				<div class="col-sm-10">
					<input class="form-control" name="title" type="text" value="<%=detail.getTitle()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="20" id="detail1" name="content"><%=detail.getContent() %></textarea>
				</div>
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
			         <input type="button" class="btn btn-primary" value="수정" onClick="regist()">
			     </div>
			</div>
			<script>
				// CKEditor 적용하기!!
	           	CKEDITOR.replace( 'detail1' );
	         </script>
         </form>
	</div>
	
	<!-- 부트스트랩 관련 불러오기!! -->
	<%@ include file="/include/loadBootStrap.jsp"%>
</body>
</html>