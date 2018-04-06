<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 대구 아이티 수영장</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/join/joinStep1.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
		<div id="container">
			<jsp:include page="contentTitle.jsp"/>
			<table style='background:url("${pageContext.request.contextPath }/resources/images/bg02.gif") repeat-x;'>
				<tbody>
					<tr>
						<td align="left">
							<img src="${pageContext.request.contextPath }/resources/images/bg01.gif">
						</td>
						<td align="center">
							<img src="${pageContext.request.contextPath }/resources/images/guide_01_on.gif">
						</td>
						<td>
							<img src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
						</td>
						<td align="center">
							<img src="${pageContext.request.contextPath }/resources/images/guide_02.gif">
						</td>
						<td>
							<img src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
						</td>
						<td align="center">
							<img src="${pageContext.request.contextPath }/resources/images/guide_03.gif">
						</td>
						<td>
							<img src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
						</td>
						<td align="center">
							<img src="${pageContext.request.contextPath }/resources/images/guide_04.gif">
						</td>
						<td>
							<img src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
						</td>
						<td align="center">
							<img src="${pageContext.request.contextPath }/resources/images/guide_05.gif">
						</td>
						<td align="right">
							<img src="${pageContext.request.contextPath }/resources/images/bg03.gif">
						</td>
					</tr>
				</tbody>
			</table>
			<div id="step1Info">
				모든 회원가입은 무료이며, 회원가입을 하시면 다양한 서비스를 편리하게 이용하실 수 있습니다. <br>
				센터에서 회원등록을 하신 후 회원가입을 하실 수 있습니다.<br>
				자세한 문의 사항은 문의하기 또는 센터를 방문해 주세요.
			</div>
			<div id="joinbtnGroup">
				<a href="${pageContext.request.contextPath }/join/joinStep2"><img src="${pageContext.request.contextPath }/resources/images/memberBtn.gif"></a>
				<a href="${pageContext.request.contextPath }/login/login" id="btnCancel"><img src="${pageContext.request.contextPath }/resources/images/btn_cancel.gif"></a>
			</div>
		</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>