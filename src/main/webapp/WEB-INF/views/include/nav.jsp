<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	top: 30px;          
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
	width: 80px;         
	text-align: center;            
	line-height: 14px; 
	border-right: 1px solid white;             
}

#wrap_login li:LAST-CHILD{
	border:none;
}
#wrap_login li a {
	font-size: 13px;
	color:white;
}
#wrap_login li a:hover{
	color:black;
	font-weight: bold;                          
}


nav {
	width: 950px;
	margin: 0 auto !important;
}

nav ul {
	list-style: none;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.6);                  
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
nav ul li a:hover {                
	color:#aaa;
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
				<a href="${pageContext.request.contextPath}/">
					<img src="${pageContext.request.contextPath}/resources/img/logoBlack.png" id="logo"> 
				</a>
				     
			</div>
			<ul>
				<c:if test="${(login.title =='회원' || login.title !='사장' )&& login != null}">
					<li><a href="${pageContext.request.contextPath}/login/logOut">로그아웃</a></li>
					<li><a href="#">마이페이지</a></li>
				</c:if>
				<c:if test="${login ==null }">
					<li><a href="${pageContext.request.contextPath}/login/login">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/join/joinStep1">회원가입</a></li>
					<li><a href="">ID/PW찾기</a></li>
				</c:if>
				<c:if test="${login.title =='사장' }">
					<li><a href="${pageContext.request.contextPath}/login/logOut">로그아웃</a></li>
					<li><a href="#">관리자모드</a></li>
				</c:if>
				
			</ul>
		</div>
		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/info/">수영장소개</a></li>
				<li><a href="">수업시간</a></li>
				<li><a href="">수영클리닉</a></li>
				<li><a href="${pageContext.request.contextPath}/gallery/">갤러리</a></li>
				<li><a href="${pageContext.request.contextPath}/classboard/classboard">반별게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/event/">소식</a></li>
				<li><a href="">문의</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>