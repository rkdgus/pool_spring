<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW찾기 : 대구 아이티 수영장</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	#join_content{
		text-align: center;
		width:70%;
		margin:0 auto;
		background: #eee;          
		margin-bottom:100px;
	}
	
	#join_content h1{
		font-size: 30px;
		padding:30px;
		
	}	
	#id{
		font-weight: bold;
		color:#ff0724;
		font-size: 50px;
	}
	#name{
		font-weight: bold;
		color:#083378;           
		font-size: 40px;
	}
	.btn{
		padding:10px;
		color:white;
		background: #970050;                           
		
	}
	#wrap_btn{
		
		width:100%;
		text-align: center;
		margin:0 auto;  
		         
	}
</style>
<script type="text/javascript">
	
		
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script
		src="${pageContext.request.contextPath }/resources/login/login.js"></script>
	<div id="container">
		<div id="loginForm">
			<div id="header_title">
				<div id="main_title">ID/PW찾기</div>

				<p id="con_navi">

					<img
						src="${pageContext.request.contextPath }/resources/images/homeIcon.png"
						alt="홈"> home &gt; 멤버십 &gt; <span>ID/PW찾기</span>
				</p>
			</div>
			<div id="join_content">
				<h1><span id="name">${vo.name }</span>님의 아이디는 <span id="id">${vo.id }</span> 입니다.</h1>
				
			</div>
			
			<div id="wrap_btn">
				<a href="${pageContext.request.contextPath }/login/login" class="btn">로그인</a>
				<a href="${pageContext.request.contextPath }/login/search"  class="btn">비밀번호찾기</a>
			</div>
			
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>