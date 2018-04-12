<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div id="leftArea">
		<h2>관리자모드</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath }/admin/member">회원관리</a></li>
			<li><a href="${pageContext.request.contextPath }/admin/teacher">강사관리</a></li>
			<li><a href="${pageContext.request.contextPath }/adminClinic/adminClinic">수영클리닉관리</a></li>
			<li><a href="${pageContext.request.contextPath }/admin/gallery">갤러리관리</a></li>
			<li><a href="${pageContext.request.contextPath }/classboard/classboard">반별게시판관리</a></li>
			<li><a href="${pageContext.request.contextPath }/event/">공지관리</a></li>
			<li><a href="${pageContext.request.contextPath }/adminQna/qna">문의관리</a></li>
		</ul>
	</div>
