<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List list = (List) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
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
<jsp:include page="common/daumPostcode.jsp" />
<script language="JavaScript">
	var number = [ "010", "011", "016", "017" ];
	var email_domain = [ "naver.com", "gmail.com", "daum.com" ];
	var cellPhone, cellPhone2, cellPhone3;
	var birthday, year, month, work;
	var id, repwd;
	var email_id, domain_text, domain;
	var roadAddress, detailAddress;
	var year_value, month_value, work_value;
	var cellPhone_value;
	var flag = false;
	function init() {
		year = document.getElementById("year");
		month = document.getElementById("month");
		work = document.getElementById("work");
		cellPhone = document.getElementById("cellPhone");
		cellPhone2 = document.getElementById("cellPhone2");
		cellPhone3 = document.getElementById("cellPhone3");
		birthday = document.getElementById("birthday");
		id = document.getElementById("id");
		domain = document.getElementById("domain");
		email_id = document.getElementById("email_id");
		domain_text = document.getElementById("domain_text");
		repwd = document.getElementById("repwd");
		roadAddress = document.getElementById("roadAddress");
		detailAddress = document.getElementById("detailAddress");

		createBirthday();
		createCellPhone();
		createDomain();
	}

	function createBirthday() {
		for (var i = 1930; i < 2016; i++) {
			var option = document.createElement("option");
			option.value = i;
			option.text = i;
			year.add(option);
		}
		for (var i = 1; i <= 12; i++) {
			var option = document.createElement("option");
			if (i < 10) {
				option.value = "0" + i;
			} else {
				option.value = i;
			}
			option.text = i;
			month.add(option);
		}
		for (var i = 1; i <= 31; i++) {
			var option = document.createElement("option");
			if (i < 10) {
				option.value = "0" + i;
			} else {
				option.value = i;
			}
			option.text = i;
			work.add(option);
		}
	}

	function createCellPhone() {
		for (var i = 0; i < number.length; i++) {
			var option = document.createElement("option");
			option.value = number[i];
			option.text = number[i];
			cellPhone.add(option);
		}
	}
	function createDomain() {
		for (var i = 0; i < email_domain.length; i++) {
			var option = document.createElement("option");
			option.value = email_domain[i];
			option.text = email_domain[i];
			domain.add(option);
		}
	}
	function cellPhoneChange() {
		cellPhone_value = cellPhone.options[cellPhone.selectedIndex].value;
	}
	function mailChange() {
		var option_value = domain.options[domain.selectedIndex].value;
		domain_text.value = option_value;
	}
	function yearChange() {
		year_value = year.options[year.selectedIndex].value;
	}
	function monthChange() {
		month_value = month.options[month.selectedIndex].value;
	}
	function workChange() {
		work_value = work.options[work.selectedIndex].value;
	}
	function regist() {
		//아이디
		if (form1.id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}
		//비밀번호체크
		if (repwd.value.length < 6) {
			alert("비밀번호가 6자리 이상 입력하세요");
			return;
		} else if (form1.pwd.value != repwd.value) {
			alert(form1.pwd.value);
			alert(repwd.value);
			alert("비밀번호가 일치하지 않습니다");
			return;
		}
		//이름체크
		if (form1.name.value == "") {
			alert("이름을 입력하세요");
			return;
		}
		//성별체크
		if (form1.gender.value == "") {
			alert("성별을 체크하세요");
			return;
		}
		//생년월일 체크
		if (year.value == "") {
			alert("생년월일을 체크하세요");
			return;
		} else if (month.value == "") {
			alert("생년월일을 체크하세요");
			return;
		} else if (work.value == "") {
			alert("생년월일을 체크하세요");
			return;
		}
		//이메일 체크
		if (email_id.value == "") {
			alert("이메일을 작성해주세요");
			return;
		} else if (domain_text.value == "") {
			alert("이메일을 작성해주세여");
			return;
		}
		//휴대폰체크
		if (cellPhone.value == "") {
			alert("휴대폰을 입력하세요");
			return;
		}
		if (cellPhone2.value == "") {
			alert("휴대폰을 입력하세요");
			return;
		} else if (cellPhone3.value == "") {
			alert("휴대폰을 입력하세요");
			return;
		}
		//우편번호
		if (roadAddress.value == "") {
			alert("주소 입력하세요");
			return;
		}
		//아이디 중복체키
		if (flag==false) {
			alert("아이디 중복체크하세요");
			return;
		}

		/* telephone,point */
		form1.birthday.value = year_value + "/" + month_value + "/"
				+ work_value;
		form1.email.value = email_id.value + "@" + domain_text.value;
		form1.addr.value = roadAddress.value + "/" + detailAddress.value;
		form1.phone.value = cellPhone_value + "-" + cellPhone2.value + "-"
				+ cellPhone3.value;
		alert(form1.phone.value);
		alert(form1.addr.value);
		form1.action = "/shopJSP/registForm.do";
		form1.submit();
		alert("회원가입성공");

	}
	/* 	$(document).ready(function() {
	 $("bt_check").click(function() {
	 $.post("/shopJSP/checkId.do", {
	 id : id.value
	 }, function(data, status) {
	 alert(data);
	 });
	 });
	 }); */
	/* 아이디 중복체크 */
	var xhttp;
	function checkIdAjax() {
		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();
		} else {
			// code for IE6, IE5
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	function checkId() {
		//아이디 소문자로
		id.value.toLowerCase();

		checkIdAjax();
		xhttp.open("GET", "/shopJSP/checkId.do?id=" + id.value, true);

		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var data = xhttp.responseText;
				var obj = JSON.parse(data);
				alert(obj.msg);
				//아이디 사용 가능할떄
				if (obj.result == "true") {
					alert("flag="+flag);
					alert(obj.result);
					flag = true;
				}

			}
		};
		xhttp.send();
	}
	function changeId(){
		flag=false;
	}
</script>

</head>
<body onload="init()">
	<jsp:include page="common/header.jsp" />
	<!-- header 끝 -->
	<div class="container" align="left">
		<form class="form-inline" name="form1" method="post">
			<input type="hidden" name="birthday" value=""> <input
				type="hidden" name="email" value=""> <input type="hidden"
				name="addr" value=""> <input type="hidden" name="point"
				value="0"> <input type="hidden" name="telephone" value="0">
			<input type="hidden" name="phone" value="">
			<fieldset>
				<legend>회원가입 </legend>
				<!-- id -->
				<div class="form-group">
					<img src="/images/tick_red.png"> <label for="id">아이디:</label>
					<input type="text" class="form-control" id="id" name="id"
						placeholder="Enter id" onchange="changeId()">영문,숫자 사용 3~20 <input
						class="btn btn-default" type="button" value="중복체크"
						onclick="checkId()">
				</div>
				<br> <br>
				<!-- pwd -->
				<div class="form-group">
					<img src="/images/tick_red.png"> <label for="pwd">비밀번호:</label>
					<input type="password" class="form-control" id="pwd" value=""
						name="pwd" placeholder="Enter password"> 6자이상
				</div>
				<br> <br>
				<div class="form-group">
					<img src="/images/tick_red.png"> <label for="repwd">비밀번호확인:</label>
					<input type="password" class="form-control" id="repwd"
						placeholder="Enter password">
				</div>
				<br> <br>
				<!-- 이름 -->
				<div class="form-group">
					<img src="/images/tick_red.png"> <label for="name">이름:</label>
					<input type="text" class="form-control" id="name" name="name"
						placeholder="Enter name"> * 만 14세 미만은 회원가입 불가 <br> <br>
					<!-- 성별 -->
					<div class="form-group">
						<img src="/images/tick_red.png"> <label for="gender">성별:</label>
						<labelclass="radio-inline"> <input type="radio"
							name="gender" value="male">남</label> <label class="radio-inline"><input
							type="radio" name="gender" value="female">여</label>
					</div>
					<br> <br>
					<!-- 생년월일 -->
					<div class="form-group">
						<img src="/images/tick_red.png"> <label for="year">생년월일</label>
						<select class="form-control" id="year" onchange="yearChange()">
							<option value="">---선택---</option>
						</select>년 <select class="form-control" id="month" onchange="monthChange()">
							<option value="">---선택---</option>
						</select>월 <select class="form-control" id="work" onchange="workChange()">
							<option value="">---선택---</option>
						</select>일
					</div>
					<br> <br>
					<!-- 이메일 -->
					<div class="form-group">
						<img src="/images/tick_red.png"> <label for="mail">이메일:</label>
						<input type="text" class="form-control" id="email_id" value="">@<input
							type="text" class="form-control" id="domain_text" value=""
							placeholder="직접입력"> <select class="form-control"
							id="domain" onchange="mailChange()">
							<option>--선택하세요--</option>
						</select> <br>주문/배송관련,쇼핑정보 안내 메일을 수신하시겠습니가 ? <br> <label
							class="radio-inline"><input type="radio"
							name="memberletter" value="yes">예</label> <label
							class="radio-inline"><input type="radio"
							name="memberletter" value="no">아니오</label> <br> sms수신거부와
						상관없이 구매 관련 메세지 shop의 주요정책 관련 메시지등은 발송됩니다
					</div>
					<br> <br>
					<!--전화번호 -->
					<div class="form-group">
						&nbsp;&nbsp;&nbsp;&nbsp;<label for="homePhone">전화번호:</label> <input
							type="number" class="form-control" id="homePhone" size="5">-
						<input type="number" class="form-control" id="telephone" size="5">-
						<input type="number" class="form-control" id="telephone" size="5">
					</div>
					<br> <br>
					<!-- 휴대폰번호 -->
					<div class="form-group">
						<img src="/images/tick_red.png"> <label for="cellPhone">휴대전화:</label>
						<select class="form-control" id="cellPhone"
							onchange="cellPhoneChange()">
							<option value="">---선택하세요---</option>
						</select>- <input type="number" class="form-control" size="5" id="cellPhone2"
							value="">- <input type="number" class="form-control"
							size="5" id="cellPhone3" value="">
					</div>
					<br> <br>
					<!--다음 우편번호 -->
					<div class="form-group">
						<input type="text" class="form-control" id="postcode"
							placeholder="우편번호" name="zipcode" readonly> <input
							type="button" class="form-control" onclick="execDaumPostcode()"
							value="우편번호 찾기"><br> <input type="text"
							class="form-control" id="roadAddress" placeholder="도로명주소"
							readonly size="30" value=""> <input type="text"
							class="form-control" id="jibunAddress" placeholder="지번주소"
							readonly size="30"><input type="text"
							class="form-control" id="detailAddress" placeholder="상세주소"
							size="50"> <span id="guide" style="color: #999"></span>
					</div>
					<br> <br>
			</fieldset>
			<div class="form-group" align="center">
				<input class="btn btn-default" type="button" value="회원가입"
					onclick="regist()"> <input class="btn btn-default"
					type="button" value="취소">
			</div>
		</form>
	</div>

</body>
</html>