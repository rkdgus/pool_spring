<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드 : 문의관리</title>
<style>
	#main_t{
		width:100%;
		border-top:2px solid #333333;
		border-bottom: 3px solid #333333 !important;
	}
	#main_tr{
		font-size: 14px;
		color:white;
		font-weight: bold;
		background: #333333;
		height:30px;
		line-height: 30px;
		text-align: center;
	}
	#main_t .tr{
		cursor: pointer;
		height:25px;
		line-height:25px;
		border-bottom: 1px solid #d7d7d7;
		padding:5px;
	}
	#main_t .tr:HOVER{
		background-color: #d7d7d7;
	}
	#main_t .td{
		font-size: 13px;
		text-align: center;
		
	}
	#main_tr .bno_title,.answer_title{
		width:60px;
	}
	#main_tr .regdate_title{
		width:120px;
	}
	#main_tr .writer_title{
		width:80px;
	}
	#main_t .title{
		text-align: left !important;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		$(function(){
			listAll();
		})
	
	</script>
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="contentTitle.jsp"/>
			<table id="main_t">
				<tr id="main_tr">
					<td class='bno_title'>번호</td>
					<td class="title_title">제목</td>
					<td class="writer_title">작성자</td>
					<td class="regdate_title">등록일</td>
					<td class="answer_title">답변</td>
				</tr>
				<c:forEach items="${qna }" var="list">
					<tr>
						<td class='td bno'>${qna.bno }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
	</div>
	
	<jsp:include page="../include/footer.jsp" />
</body>
</html>