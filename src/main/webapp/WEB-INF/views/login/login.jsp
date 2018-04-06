<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 : 대구 아이티 수영장</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/loginHome.css">

</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<script src="${pageContext.request.contextPath }/resources/login/login.js"></script>
	<div id="container">
		<div id="loginForm">
			<jsp:include page="contentTitle.jsp"/>
			<div id="join_content">
				
				<div id="join_form">
				<img src="${pageContext.request.contextPath }/resources/images/jointitle.png">
					<form id="f" action="${pageContext.request.contextPath }/login/login"  method="post">
						<p>
							<label for="id">ID</label>
							<input type="text" placeholder="회원 아이디" id="id" name="id">
						</p>
						<p>
							<label for="pw">PASSWORD</label>
							<input type="password" id="pw" name="pw">
						</p>
						<div id="checkT">
							<input type="checkbox" id="teacher">
							<label>관리자</label>
						</div>
						<a href="#" id='loginBtn'><img src="${pageContext.request.contextPath }/resources/images/loginbtn.gif"></a>
					</form>
					<div id="join_info">
						<p>- 아이디 및 비밀번호는 영문 대소문자를 구별하오니 입력 시 주의하시기 바랍니다.</p>
						<p>- 원하시는 서비스를 이용하신 후 정보보호를 위해서 반드시 로그아웃 해주시기 바랍니다.</p>
						<p>- 비밀번호는 주기적으로 변경 관리하기 바라며 타인에게 노출되지 않도록 주의하시기 바랍니다.</p>
						<p>- 비회원일 경우, 일부 서비스가 제한됩니다.</p>
					</div>
					<div id="other_btn">
						<a href="#"><img src="${pageContext.request.contextPath }/resources/images/findMem.png"></a>
							&nbsp; &nbsp; &nbsp;
						<a href="#"><img src="${pageContext.request.contextPath }/resources/images/line.png"></a>
							&nbsp; &nbsp; &nbsp;
						<a href="${pageContext.request.contextPath }/join/joinStep1"><img src="${pageContext.request.contextPath }/resources/images/newJoin.png"></a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>