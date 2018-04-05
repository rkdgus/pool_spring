<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="include/header.jsp"/>
	<div id="container">
		<div id="header_title">
		<div>로그인</div>
		
		<p class="con_navi">
		
			<img src="${pageContext.request.contextPath }/resources/images/homeIcon.png" alt="홈">
				home &gt; 
				멤버십 &gt;
			<span>로그인</span>
		
		</p>
	</div>
	</div>
	
	<jsp:include page="include/footer.jsp"/>
</body>
</html>