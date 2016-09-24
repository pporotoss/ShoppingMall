<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<style>
</style>
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<!-- 해더끝 -->
	<div class="container">
		<div align="center">
			<h3>고객 센터</h3>
		</div>
		<div>
			<img src="http://placehold.it/800x100?text=IMAGE" alt="Image"
				style="width: 100%; height: 100">
		</div>
	</div>
	<br>
	<div class="container">
		<jsp:include page="common/customerSideMenu.jsp"/>
		<div class="col-md-9">
			<br>
			<div>
				<div align="left">
					<h4>문의 게시판</h4>
				</div>
				<br>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr class="info">
								<th>번호</th>
								<th>상품</th>
								<th>내용</th>
								<th>아이디</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6">주문내역이 없습니다</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<div style="border: 1px solid silver"></div>
			<dl align="right">
				<dt>
					<input type="radio">이름 <input type="radio">제목 <input
						type="radio">내용 <input type="radio">상품 <input
						type="text" size="6">
					<button class="btn btn-default">검색</button>
				</dt>
				<br>
				<dd>
					<button class="btn btn-default">글쓰기</button>
				</dd>
			</dl>

		</div>
	</div>