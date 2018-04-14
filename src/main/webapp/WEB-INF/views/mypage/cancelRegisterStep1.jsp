<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 탈퇴 신청 : 대구 아이티 수영장</title>
<style>
			#check_div{
		border:1px solid #ccc;
		padding:30px;
		margin-bottom: 20px;
	}
	
	#check_div table{
		width:100%;
		border-top: 2px solid #333333;
	}
	#check_div p{
		font-weight: bold;
		font-size: 14px;
		margin-bottom: 10px;
	}
	#check_div table tr{
		border-bottom: 1px solid #d7d7d7;
		height:30px;
		line-height: 30px;
	}
	#check_div table tr td{
		padding-left: 10px;	
	}
	#check_div table #pw_title{
		width:140px;
		font-size: 13px;
		background: #ebebeb;
		padding:6px 0px 6px  20px;
	}
	#check_div table tr td #pw{
		width:200px;
		height:23px;
		line-height: 23px;
		
	}
	#btn{
		text-align: center;
	}
	#btn a{
		display: inline-block;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		$(function(){
			$("#next").click(function(e){
				
				$.ajax({
					url:"checkPw",
					type:"post",
					dataType:"text",
					data:{"id":"${login.id}",
							"pw":$("#pw").val()},
					success:function(result){
						console.log(result);
						if(result =="notMatch"){
							alert("비밀번호가 일치하지 않습니다 (비밀번호를 확인해 주세요)");
							$("#pw").val("").focus();
							return;
						}
						
						if(result =="match"){
							location.href="cancelRegister";
							return;
						}
					}
				}) 
				e.preventDefault();
			})
		})
	</script>
		<div id="container">
			<jsp:include page="side.jsp"/>
			<div id="content">
			<jsp:include page="cancelRegisterTitle.jsp"/>
				<div id="check_div">
				<p>개인정보 보호를 위해 비밀번호를 입력해 주세요</p>
					<table>
						<tr>
							<td id="pw_title">비밀번호</td>
							<td><input type="password" id="pw"></td>
						</tr>
					</table>
					
				</div>
				<div id="btn">
					<a href="#" id="next"><img src="${pageContext.request.contextPath }/resources/images/btn_ok.gif"></a>
				</div>
				
			</div>
			</div>
	
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
