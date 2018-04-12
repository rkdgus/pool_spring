<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드 : 문의관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/qna/adminQna.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		$(function(){
			$(document).on("click",".tr",function(){
				var bno = $(this).find(".bno").text();
				location.href="qnaRead${pageMaker.makeQna(pageMaker.cri.page)}&bno="+bno;
			})
			
			$(document).on("click",".pageNum",function(){
				window.scrollBy(0,80);
			})
			window.scrollBy(0,80);
			
			$("#sel").change(function(){
				
					location.href="${pageMaker.makeQuery(1)}&searchType="+$(this).val();
			})
			
			$("#sel").val("${pageMaker.cri.searchType}");
			
		})
	</script>
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="contentTitle.jsp"/>
			<select id="sel">
				<option value="">전체보기</option>
				<option value="noanswer">미답변</option>
				<option value="answer">완료답변</option>
			</select>
			<table id="main_t">
				<tr id="main_tr">
					<td class='bno_title'>번호</td>
					<td class="title_title">제목</td>
					<td class="writer_title">작성자</td>
					<td class="regdate_title">등록일</td>
					<td class="answer_title">답변</td>
				</tr>
				<c:forEach items="${qna }" var="list">
					<tr class="tr">
						<td class="td bno">${list.bno}</td>
						<td class="td title">${list.title }</td>
						<td class="td writer">${list.writer }</td>
						<fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd" var="date"/>
						<td class="td regdate">${date }</td>
						<c:if test="${list.replycheck==false }">
							<td class="td answer">X</td>
						</c:if>
						<c:if test="${list.replycheck==true }">
							<td class="td answer">O</td>
						</c:if>
						
					</tr>
				</c:forEach>
			</table>
			
				<div id="paging">
				<c:if test="${pageMaker.prev}">
					<a href="qna?page=${pageMaker.startPage-1 }"><span
						class="paginBtn">&laquo;</span></a>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<a href="qna${pageMaker.makeQna(idx) }"><span class="pageNum"
						${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a href="qna?page=${pageMaker.endPage+1}"><span
						class="paginBtn">&raquo;</span></a>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>