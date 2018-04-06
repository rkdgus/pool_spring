<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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
					<li><a href="">회원가입</a></li>
					<li><a href="">ID/PW찾기</a></li>
				</c:if>
				<c:if test="${login.title =='사장' }">
					<li><a href="${pageContext.request.contextPath}/login/logOut">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/">관리자모드</a></li>
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
				<li><a href="${pageContext.request.contextPath}/event/">공지</a></li>
				<li><a href="">문의</a></li>
			</ul>
		</nav>
	</div>
