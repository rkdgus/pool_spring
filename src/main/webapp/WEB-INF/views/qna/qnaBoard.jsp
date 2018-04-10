<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 : 질문 및 답변 : 대구 아이티 수영장</title>
<style>
	#list{
		width:100%;
		border-bottom: 2px solid #333333;
	}
	#list #first{
		background:#333333;
		height:30px;
		line-height: 30px;
	}
	#list tr{
		border-bottom: #d7d7d7 1px solid;
		height:25px;
		line-height:25px;
		cursor: pointer;
	}
	#list tr:HOVER{
		background-color: #d7d7d7;
	}
	#list .th{
		font-size: 14px;
		color:white;
		font-weight: bold;
	}
	#list .th:nth-child(1){
		width:60px;
	}
	.th:nth-child(3){
		width:70px;
	}
	.th:nth-child(5),.th:nth-child(4){
		width:80px;
	}
	.td_title{
		text-align: left;
		font-size: 12px;
	}
	#list .td{
		text-align: center;
		font-size: 12px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="qnaside.jsp" />
		<div id="content">
			<jsp:include page="qnaBoardTitle.jsp" />
			<div id="list_content">
				<table id="list">
					<tr id="first">
						<th class="th">번호</th>
						<th class="th">제목</th>
						<th class="th">작성자</th>
						<th class="th">등록일</th>
					</tr>
					<c:if test="${list !=null }">
						<c:forEach var="item" items="${list }">
							<tr data-bno='${item.bno }'>
								<td class="td">${item.bno }</td>
								<td class='td_title'>${item.title }</td>
								<td class="td">${item.writer }</td>
								<fmt:formatDate value="${item.regdate }" pattern="yyyy-MM-dd" var="date"/>
								<td class="td">${date }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${list==null }">
						<tr>
							<td colspan="5">질문이 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>