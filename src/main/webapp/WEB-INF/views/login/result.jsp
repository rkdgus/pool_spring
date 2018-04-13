<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<c:if test="${idvo !=null }">
					<h1><span id="name">${idvo.name }</span>님의 아이디는 <span id="id">${idvo.id }</span> 입니다.</h1>
				</c:if>
				
				<c:if test="${pwvo !=null }">
					<h1><span id="name">${pwvo.name }</span>님의 임시비밀번호를 본인 이메일로 발송 하였습니다.</h1>
					<p>임시비밀번호로 로그인 후 마이페이지에서 변경해 주세요.</p>
					<br>
				</c:if>
				<c:if test="${err ==1}">
					<h1><span id="name"></span>일치하는 회원 정보가 없습니다.<br> 다시 확인해주세요.</h1>
					
				</c:if>
			</div>
			
			<div id="wrap_btn">
				<c:if test="${idvo !=null }">
					<a href="${pageContext.request.contextPath }/login/login" class="btn">로그인</a>
					<a href="${pageContext.request.contextPath }/login/search"  class="btn">비밀번호찾기</a>
				</c:if>
				<c:if test="${pwvo !=null }">
					<a href="${pageContext.request.contextPath }/login/login" class="btn">로그인</a>
				</c:if>
				<c:if test="${err ==1}">
					<a href="${pageContext.request.contextPath }/login/search" class="btn">돌아가기</a>
					
				</c:if>                        
			</div>
			
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>