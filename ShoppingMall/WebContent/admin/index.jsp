<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	if(msg != null){
		out.print("<script>alert('"+msg+"');</script>");
	}
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
	<title>쇼핑몰 관리</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script>
		function login(){
			form1.action="/admin/login.do";
			form1.submit();
		}
	</script>
</head>
<body>
	<form method="post" name="form1">
		<div class="container">
			<h2>쇼핑몰 관리</h2>
			<div class="form-group">
				<label for="usr">아이디 : </label> <input type="text" name="id" class="form-control" id="usr">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호: </label> <input type="password" name="pwd" class="form-control" id="pwd">
				<button class="btn btn-primary" onClick="login()">로그인</button>
			</div>
		</div>
	</form>
</body>
</html>
