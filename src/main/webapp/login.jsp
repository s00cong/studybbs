<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" 
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span> <!-- 작대기 세개 -->
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li ><a href="join.jsp">회원가입</a></li>
					</ul>
					
				</li>
			</ul>
		
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align:center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary from-control" value="로그인">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>

	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
<!-- 
	기본적으로 웹페이지 만들때 디자인 만들고 난 후 
	기능 구현 많이 함.
	더 빨리 만들기 위해 디자인 프레임워크인 부트스트랩 사용할것 
	link란 태그 써서 이페이지에 기본적으로 이런 스타일시트를 참조하겠다가는 뜻
	css: 디자인 담당
	js: 애니메이션을 담당
	nav : 하나의 웹사이트의 전반적인 구성을 담당
	<li class="active">: 단 한개의 홈페이지에만 들어갈수잇고, 현재 선택된 페이지란 뜻
	post : 정보를 숨기면서 보낼때 사용하는 method 즉 action="~~"에 적힌 페이지로 정보를 숨기면서 보낸다란 뜻
	text-align:center : 하나의 문장을 가운데 정렬한다는 뜻
	<input type="text" class="form-control" placeholder="아이디" name="userID">
		: 여기에서 name은 나중에 서버 프로그램을 작성할 때 중요한 요소

 -->