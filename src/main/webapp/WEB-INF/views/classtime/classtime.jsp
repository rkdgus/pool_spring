<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div id="container">
			<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<h2><img src="${pageContext.request.contextPath }/resources/img/classtime.png">강습접수 기간 안내(선착순)</h2>
			<ul>
				<li>-인터넷접수:매월 15일~20일</li>
				<li>-방문접수:매월 20일~말일</li>
			</ul>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>