<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 회원정보 : 대구 아이티 수영장</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="memberInfoTitle.jsp"/>
			<table>
				<tr>
					<td></td>
				</tr>
			</table>
			<div id="btnGroup">
				<a href="#"><button>수정</button></a>
				<a href="#"><button>탈퇴신청</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>