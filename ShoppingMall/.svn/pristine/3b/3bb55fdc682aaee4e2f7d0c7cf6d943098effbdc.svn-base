<%@page import="com.shoppingmall.member.model.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member=(Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/header.css" type="text/css">
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<!-- 해더끝 -->
	<div class="container">
		<jsp:include page="common/myPageSideMenu.jsp" />
		<!-- 사이드메뉴 끝 -->
		<div class="col-md-9 men-rig">
			<div style="border:1px solid silver;" align="center">
				<h3>MyPage</h3>
				<br>
				<h5>&nbsp;아이디 :&nbsp;<%=member.getId() %> 님 </h5>
				<h5>&nbsp;휴대폰 :&nbsp;<%=member.getPhone() %></h5>
				<h5>&nbsp;이메일 :&nbsp;<%=member.getEmail() %></h5>
				<h5>&nbsp;주 소 :&nbsp;<%=member.getAddr() %></h5>
				<h5>&nbsp;총 주문금액 :</h5>
				<h5>&nbsp;적립금 : &nbsp;<%=member.getPoint() %></h5>
			</div>
			<!-- 나에정보 끝 -->
			<br>
			<div style="border: 1px solid silver;" align="center">
				<h4>최근주문정보</h4>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>주문일자</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>주문상세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">주문내역이 없습니다</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<div style="border: 1px solid silver;" align="center">
				<h4>최근 등록 게시글</h4>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>최근 등록 게시글</th>
							<th>제목</th>
							<th>게시판</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">게시글이 없습니다</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>