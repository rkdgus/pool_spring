<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 탈퇴 신청 : 대구 아이티 수영장</title>
<style>
	#info{
		border:1px solid #ccc;
		padding:30px;
		margin-bottom: 20px;
	}
	#info p{
		font-size: 14px;
		font-weight: bold;
		text-align: center;
		line-height: 20px;
	}
	#btnGroup{
		margin-top:10px;
		text-align: center;
	}
	#btnGroup a{
		display: inline-block;
	}
	#btnGroup a button{
	border:1px solid #5c5c5c;
		background: #fff;
		font-size: 12px;
		outline: none;
		padding:5px 10px;
		border-radius:2px;
	}
	#btnGroup a button:HOVER {
	background: #ebebeb;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		$(function(){
			$("#btn").click(function(e){
				e.preventDefault();
				if(confirm("탈퇴하시겠습니까?")){
					$.ajax({
						url:"/pool/mypage/cancelRegister",
						type:"post",
						dataType:"text",
						data:{"id":"${login.id}"},
						success:function(result){
							console.log(result);
							if(result=="success"){
								alert("탈퇴신청이 되었습니다");
								location.href="${pageContext.request.contextPath }/";
								return;
							}
						}
					}) 
					
				}
					
			})
		})
	</script>
		<div id="container">
			<jsp:include page="side.jsp"/>
			<div id="content">
				<jsp:include page="cancelRegisterTitle.jsp"/>
				<div id="info">
					<p>탈퇴신청을 하시면 대구 아이티 수영장 홈페이지 이용에 제한을 받습니다</p>
					<p>탈퇴하신 아이디로 재가입이 불가능 합니다</p>
					<p>지금까지 대구 아이티 수영장을 이용해 주셔서 감사합니다</p>
					<div id='btnGroup'>
						<a href="#" id="btn"><button>탈퇴</button></a>
					</div>
					
				</div>
			</div>
		</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>