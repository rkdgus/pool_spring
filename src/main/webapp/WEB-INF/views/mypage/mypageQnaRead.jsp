<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 문의내역 : 대구 아이티 수영장</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/mypage/mypageQnaRead.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
		<script>
			$(function(){
				$('#list').click(function(){
					location.href="myPageQna${pageMaker.makeSearch(pageMaker.cri.page)}&id=${qna.id}";
				})
				
				$("#remove").click(function(){
					var bno = "${qna.bno}";
					if(confirm("문의하신 내용을 삭제 하시겠습니까?")){	
						$.ajax({
							url:"/pool/mypage/qnaRemove",
							type:"post",
							dataType:"text",
							data:{"bno":bno},
							success:function(result){
								console.log(result);
								if(result=="success"){
									alert("삭제되었습니다");
									location.href="myPageQna${pageMaker.makeSearch(pageMaker.cri.page)}&id=${qna.id}";
								}
							}
						}) 
					}
					
					return false;
				})
			})
		</script>
		<div id="container">
			<jsp:include page="side.jsp" />
			
			<div id="content">
				<jsp:include page="qnaTitle.jsp" />
				<div id="table_div">
					<table>
						<tr class="main_tr">
							<td>${qna.title }</td>
							<fmt:formatDate value="${qna.regdate }" pattern="yyyy-MM-dd" var="date"/>
							<td id="qnadate">${date }</td>
						</tr>
						<tr>
							<td colspan="2" id="qnaContent">
								
								<c:if test="${qna.imgpath !='null' || qna.imgpath != null}">
									<c:forEach items="${qna.imgpath }" var = "img">
										<img src="${img }"><br>
									</c:forEach>
									<br><br>
								</c:if>
							
							${qna.content }</td>
						</tr>
					</table>
					<div class="btnGroup">
						<a href="#"><button id="list">목록</button></a>
						<a href="#"><button id="remove">삭제</button></a>
					</div>
				</div>
				<c:if test="${qna.replycheck == true }">
					<div id="answer_div">
						<table>
							<tr class="main_tr">
								<td colspan="2">[문의하신 내용의 답변 입니다]</td>
							</tr>
							<tr id="main_answer_title">
								<td>관리자</td>
								<fmt:formatDate value="${qna.answerdate }" pattern="yyyy-MM-dd" var="answerdate"/>
								<td id="answerdate">${answerdate }</td>
							</tr>
							<tr>
								<td colspan="2" id="answerContet">${qna.answer }</td>
							</tr>
						</table>
						<div class="btnGroup">
							<a href="${pageContext.request.contextPath }/qna/qna"><button>추가문의</button></a>
						</div>
					</div>
				</c:if>
				
			</div>
		</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
