<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드 : 문의관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/qna/adminQnaRead.css">
<style>
	#header_title{
		margin-bottom: 20px !important;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
		<script>
		$(function(){
			$("#btnclick").click(function(){
				$("#input_t").toggle();
			})
		
			$("#answerBtn").click(function(){
				
				var a = $("#answer_content").val();
				
				if(a==""){
					alert("답변 내용을 입력하세요");
					return;
				}
				
				var answer = a.replace(/(?:\r\n|\r|\n)/g, '<br />');
				var bno ="${qna.bno}";
				
			 	$.ajax({
						url:"/pool/adminQna/qnaAnswer",
						type:"post",
						dataType:"text",
						data:{"answer":answer,
								"bno":bno},
						success:function(result){
							console.log(result);
							
							if(result=="success"){
								location.reload();
								$("#input_t").show();
							}
						}
					}) 
			})
			
			$("#btnRemove").click(function(){
				var bno ="${qna.bno}";
				
				if(confirm("문의 내역을 삭제 할까요?")){
					$.ajax({
						url:"/pool/adminQna/qnaRemove",
						type:"post",
						dataType:"text",
						data:{"bno":bno},
						success:function(result){
							console.log(result);
							if(result=="success"){
								alert("문의 내역을 삭제되었습니다.");
								location.href="qna${pageMaker.makeQna(pageMaker.cri.page)}";
							}
						}
					}) 
				}
				
			})
			
			$("#up").click(function(){
				window.scrollTo(0, 80);
			})
			window.scrollBy(0,80);
		})
	</script>
		<div id="container">
			<jsp:include page="side.jsp"/>
			<div id="content">
				<jsp:include page="contentTitle.jsp"/>
				<div id="show_t">
					<p id="main"><span id="mark">■</span>문의 내용</p>
					<table>
						<tr class="title_tr">
							<td colspan="2">${qna.title }</td>
						</tr>
						<tr id="title_tr2">
							<td>작성자 : ${qna.writer } | 이메일 : ${qna.email } 
							<c:if test="${qna.id ==null }">
							| 비회원
							</c:if>
							<c:if test="${qna.id !=null }">
							| 아이디 : ${qna.id }
							</c:if>
							</td>
							<fmt:formatDate value="${qna.regdate }" pattern="yyyy-MM-dd" var="date"/>
							<td id="date">등록일 : ${date }</td>
						</tr>
						<tr>
							<td colspan="2" id="qnaContent">
								<c:if test="${qna.imgpath !='null' }">
									<c:forEach items="${qna.imgpath }" var = "img">
										<img src="displayFile?filename=${img }"><br>
									</c:forEach>
								</c:if>
								<br><br>
								${qna.content }
							
							</td>
						</tr>
					</table>
					<div class="btnGroup">
						<button class="btn" id="btnclick">답변</button>
						<button class="btn" id="btnRemove">삭제</button>
						<a href="${pageContext.request.contextPath }/adminQna/qna${pageMaker.makeQna(pageMaker.cri.page)}"><button class="btn">목록</button></a>
						<button class="btn" id="up">위로</button>
					</div>
				</div>
				<div id="input_t">
					<table>
						<tr class="title_tr">
							<td>[답변]</td>
							<fmt:formatDate value="${qna.answerdate }" pattern="yyyy-MM-dd" var="answerDate"/>
							<td id="answerdate">${answerDate }</td>
						</tr>
						<tr>
							<c:if test="${qna.replycheck==false }">
									<td colspan="2">
										<form id="f">
											<textarea id="answer_content"></textarea>
										</form>
									</td>
							</c:if>
							
							<c:if test="${qna.replycheck==true }">
								<td id="answerSuccess" colspan="2">${qna.answer }</td>
							</c:if>
						
						</tr>
						
					</table>
					<div class="btnGroup">
							<c:if test="${qna.replycheck==false }">
								<button class="btn"  id="answerBtn">확인</button>
							</c:if>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../include/footer.jsp" />
	
</body>
</html>