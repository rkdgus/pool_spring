<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/common/reset.css">
<style>
#wrap_nav {
	z-index: 5;
	position: absolute;
	left: 50%;
	top: 50px;          
	margin-left: -470px;
}

#wrap_login {
	width: 950px;
	margin: 0 auto;
	overflow: hidden;
	margin-bottom:2px;        
}
               
#wrap_login ul {
	float: right;
	overflow: hidden;
	height: 14px;
	margin-top:60px;                        
}

#wrap_login li {
	float: left;
	width: 74px;         
	text-align: center;            
	line-height: 14px;            
}

#wrap_login li:FIRST-CHILD {
	width: 50px;
	border-right: 1px solid white;       
}

#wrap_login li:nth-child(2) {
	width: 65px;
	border-right: 1px solid white;
}            

#wrap_login li a {
	font-size: 13px;
	color:white;
}

nav {
	width: 950px;
	margin: 0 auto !important;
}

nav ul {
	list-style: none;
	width: 100%;
	background-color: rgba(93, 151, 199, 0.8);
	height: 60px;
}

nav ul li {
	float: left;
	width: 14%;
	text-align: center;
	line-height: 60px;
}

nav ul li:nth-child(1) {
	width: 180px;
}

nav ul li:nth-child(2) {
	width: 100px;
}

nav ul li:nth-child(3) {
	width: 180px;
}

nav ul li:nth-child(4) {
	width: 80px;
}

nav ul li:nth-child(5) {
	width: 180px;
}

nav ul li:nth-child(6) {
	width: 80px;
}

nav ul li:nth-child(7) {
	width: 150px;
}

nav ul li a {
	text-decoration: none;
	color: white;
	font-weight: bold;
}
#wrap_login #logo{
	width:80px;              
}
</style>
</head>
<body>
	<div id="wrap_nav">
		<div id="wrap_login">
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/logoBlack.png" id="logo">      
			</div>
			<ul>
				<li><a href="login/">로그인</a></li>
				<li><a href="">회원가입</a></li>
				<li><a href="">ID/PW찾기</a></li>
			</ul>
		</div>
		<nav>
			<ul>
				<li><a href="">수영장소개</a></li>
				<li><a href="">수업시간</a></li>
				<li><a href="">수영클리닉</a></li>
				<li><a href="">갤러리</a></li>
				<li><a href="">반별게시판</a></li>
				<li><a href="">소식</a></li>
				<li><a href="">문의</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>