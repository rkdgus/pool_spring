<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 : 질문 및 답변 : 대구 아이티 수영장</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/qna/qnaRead.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		$(function(){
			$("#next").click(function(){
			
				$.ajax({
					url:"/pool/qna/checkPw?bno=${bno}",
					type:"post",
					dataType:"text",
					data:{"pw":$("#pw").val()},
					success:function(result){
						console.log(result);
						if(result=="fail"){
							alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인해 주세요.");
							$("#pw").val("").focus();
							return;
						}else{
							location.href="qnaReadSuccess?bno=${bno}";
						} 
							
						
					}
				})
			})
			
		})
	</script>
	<div id="container">
		<jsp:include page="qnaside.jsp" />
		<div id="content">
			<jsp:include page="qnaBoardTitle.jsp" />
			<div id="confirm">
			<p id="info">질문 내용은 비공개입니다. 비밀번호를 입력해주세요.</p>
				<table>
					<tr>
						<td id="pw_title">비밀번호</td>
						<td><input type="password" id="pw"></td>
					</tr>
				</table>
			</div>
			<div id="btnGroup">
				<a href="#" id="next"><img src="${pageContext.request.contextPath }/resources/images/btn_ok.gif"></a>
				<a href="${pageContext.request.contextPath }/qna/qnaBoard"><img src="${pageContext.request.contextPath }/resources/images/btn_cancel.gif"></a>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
