<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div id="leftArea">
		<h2>갤러리</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/gallery/?type=내부사진">내부사진</a></li>
			<li><a href="${pageContext.request.contextPath}/gallery/?type=외부사진">외부사진</a></li>
			<li><a href="${pageContext.request.contextPath}/gallery/?type=강습사진">강습사진</a></li>
			<li><a href="${pageContext.request.contextPath}/gallery/?type=인접시설물">인접시설물</a></li>
			

		</ul>
	</div>
</body>
</html>