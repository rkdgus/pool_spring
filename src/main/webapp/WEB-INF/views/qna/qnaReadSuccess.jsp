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
<style>
	#answer_div{
		margin-top: 20px;
	}
	#answer_div table{
		width:100%;
		border-bottom: 2px solid #333333;
		border-top: 2px solid #333333;
	}
	#answer_div table #answertr{
		background: #ebebeb;
		font-size: 13px;
		font-weight: bold;
	}
	#answer_div table #answertr #answerdate{
		width:140px;
	}
	#answercontent{
		font-size: 13px;
	}
	#answerBtn{
		text-align: right;
		margin-top: 10px;
	}
	#answerBtn button{
		border:1px solid #5c5c5c;
		background: #fff;
		font-size: 12px;
		outline: none;
		padding:5px 10px;
		border-radius:2px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
		<script>
			$(function(){
				$("#reply0").click(function(e){
					alert("답변이 없습니다.");
					e.preventDefault();
				})
				$("#reply1").click(function(e){
					alert("1건의 답변이 있습니다.");
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
										location.href="${pageContext.request.contextPath}/qna/qnaBoard${pageMaker.makeSearch(pageMaker.cri.page)}";
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
								<td id="title">${qnaBoard.title }</td>
								<td  class="reply"><a href="#" id="reply1">답변 1건</a></td>
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
						<a href="${pageContext.request.contextPath }/qna/qnaBoard${pageMaker.makeSearch(pageMaker.cri.page)}"><button>목록</button></a>
						<a href="#" id="remove"><button>삭제</button></a>
					</div>
				</div>
				<c:if test="${qnaBoard.replycheck == true }">
					<div id="answer_div">
						<table>
							<tr id="answertr">
								<td>[문의하신 질문에 대한 답변 입니다.]</td>
								<fmt:formatDate value="${qnaBoard.answerdate }" pattern="yyyy-MM-dd" var="date"/>
								<td id="answerdate">답변일 : ${date}</td>
							</tr>
							<tr>
								<td colspan="2" id="answercontent">${qnaBoard.answer }</td>
							</tr>
						</table>
					</div>
					<div id="answerBtn">
						<a href="${pageContext.request.contextPath }/qna/qna"><button>문의하기</button></a>
					</div>
				</c:if>
				
			</div>
		</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
