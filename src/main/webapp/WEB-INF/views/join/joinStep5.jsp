<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 대구 아이티 수영장</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/join/joinStep5.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<table id="table_title"
			style='background:url("${pageContext.request.contextPath }/resources/images/bg02.gif") repeat-x;'>
			<tbody>
				<tr>
					<td align="left"><img
						src="${pageContext.request.contextPath }/resources/images/bg01.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_01.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_02.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_03.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_04.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_05_on.gif">
					</td>
					<td align="right"><img
						src="${pageContext.request.contextPath }/resources/images/bg03.gif">
					</td>
				</tr>
			</tbody>
		</table>
		<div id="join_content">
			<h2>회원가입 완료</h2>
			<h3>회원가입이 완료되었습니다. 로그인 후 홈페이지를 이용하실 수 있습니다.</h3>
			<div id="join_sccess">
				<div>
					<p>환영합니다. <span class="info" id="name">${member.name }</span> 회원님</p>
					<p>대구 아아티 수영장을 이용해 주셔서 감사합니다.</p>
					<p>로그인 하시면 즉시 대구 아이티 수영장 홈페이지를 이용하실 수 있습니다.</p>
				</div>
				<table>
					<tr>
						<td class="td">회원번호</td>
						<td id="mno" class="info">${member.mno}</td>
					</tr>
					<tr>
						<td class="td">회원 아이디</td>
						<td id="id" class="info">${member.id}</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="btn">
			<a href="${pageContext.request.contextPath }/login/login"><img src="${pageContext.request.contextPath }/resources/images/btn_ok.gif"></a>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
