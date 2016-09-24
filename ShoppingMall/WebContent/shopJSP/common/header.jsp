<%@ page contentType="text/html; charset=UTF-8"%>
<header>
	<%String id=(String)session.getAttribute("id"); %>
	<div align="right" class="jumbotron" style="padding: 0.5em 0.6em;">
		<ul class="list-inline">
		<%if(id==null){%>
			<li><a href="/shopJSP/loginForm.jsp"><span
					class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			<li><a href="/shopJSP/registForm.jsp"><span
					class="glyphicon glyphicon-user"></span> 회원가입</a></li>
			<%}else{%>
						<li><a href="#"><%=id%>님</a></li>
						<li><a href="/shopJSP/loginOut.do"><span
					class="glyphicon glyphicon-user"></span> 로그아웃</a></li> 
			<li><a href="/shopJSP/myPage.do"><span
					class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
					<%} %>
			<li><a href="/shop/cart.html"><span
					class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
		</ul>
	</div>
	<div class="jumbotron" style="padding: 0.5em 5em;">
		<div class="container text-center">
			<h4>Online Store</h4>
			<p>Mission, Vission & Values</p>
		</div>
	</div>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/shopJSP/index.jsp">온라인스토어 ></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/shopJSP/index.jsp">홈</a></li>
					<li><a href="/shopJSP/product.html">선물</a></li>
					<li><a href="/shopJSP/customerCenter.jsp">고객센터</a></li>
					<!-- <li><a href="#">콘돔</a></li>
					<li><a href="#">젤</a></li>
					<li><a href="#">이벤트</a></li>
					<li><a href="#">공지사항</a></li> -->
				</ul>
				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span
							class="glyphicon glyphicon-search">검색</span></a>
						<ul class="dropdown-menu">
							<input type="text" placeholder="Search Blog..">

						</ul></li>
				</ul>
			</div>
	</nav>
</header>