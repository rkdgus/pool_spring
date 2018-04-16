<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="teacherInfoTitle.jsp"/>
			
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>