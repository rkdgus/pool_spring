<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 : 질문 및 답변 : 대구 아이티 수영장</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/qna/qnaReadSuccess.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
		<script>
			$(function(){
				$("#reply0").click(function(e){
					alert("답변이 없습니다.");
					e.preventDefault();
				})
				
				$("#remove").click(function(e){
					
					if(confirm("문의 내용을 삭제하시겠습니까?")){
							$.ajax({
								url : "qnaRemove",
								data : {"bno":"${qnaBoard.bno}"},
								type : "post",
								dataType : "text",
								success : function(result) {
									console.log(result);
									if(result =="success"){
										alert("문의내용을 삭제했습니다.");
										location.href="${pageContext.request.contextPath}/qna/qnaBoard?page=${page}";
									}else{
										alert("삭제 실패");
										return;
									}
								}
							})
					}
						e.preventDefault();
					
					
				})
			})
		</script>
		<div id="container">
			<jsp:include page="qnaside.jsp" />
			<div id="content">
				<jsp:include page="qnaBoardTitle.jsp" />
				<div>
					<table id="t">
					
						<tr id="title_tr">
							<c:if test="${qnaBoard.replycheck == false }">
								<td id="title">${qnaBoard.title }</td>
								<td class="reply"><a href="#" id="reply0">답변 0건</a></td>
							</c:if>
							<c:if test="${qnaBoard.replycheck == true }">
								<td id="title" colspan="2">${qnaBoard.title }</td>
								<td  class="reply"><a href="${pageContext.request.contextPath }/qna/replyContent?bno=${qnaBoard.bno}" id="reply1">답변 1건</a></td>
							</c:if>							
						</tr>
						<tr>
							<td id="writer" class="s_font">작성자 : ${qnaBoard.writer }</td>
							<fmt:formatDate value="${qnaBoard.regdate }" pattern="yyyy-MM-dd" var="date"/>
							<td id="regdate" class="s_font">등록일 : ${date }</td>
						</tr>
						<tr>
						
						
								<td class="text" colspan="2">
								<c:forEach items="${img }" var="img" >
									<img src="displayFile?filename=${img }"><br>
								</c:forEach>
								${qnaBoard.content }</td>
						
						</tr>
					</table>
					<div id="btnGroup">
						<a href="${pageContext.request.contextPath }/qna/qnaBoard?page=${page}"><button>목록</button></a>
						<a href="#" id="remove"><button>삭제</button></a>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
