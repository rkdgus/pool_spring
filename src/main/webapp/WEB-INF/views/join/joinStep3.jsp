<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 대구 아이티 수영장</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/join/joinStep3.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script src="${pageContext.request.contextPath }/resources/join/joinStep3.js"></script>	
		<div id="container">
			<jsp:include page="contentTitle.jsp" />
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
						src="${pageContext.request.contextPath }/resources/images/guide_03_on.gif">
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
						src="${pageContext.request.contextPath }/resources/images/guide_05.gif">
					</td>
					<td align="right"><img
						src="${pageContext.request.contextPath }/resources/images/bg03.gif">
					</td>
				</tr>
			</tbody>
		</table>
		<div id="join_content">
			<h2>회원가입 인증</h2>
			<h6>안전한 회원가입을 위하여 가입인증을 진행해 주십시오.</h6>
			<div id="confirm">
				<table>
					<tr>
						<td class="td">회원번호</td>
						<td><input type="text" id="mno" placeholder="회원 번호"  class="tf">
							<button id="next">회원번호 확인</button>
						</td>
					</tr>
				</table>
				
				<table id="mem">
					<tr>
						<td class="td">이름</td>
						<td><input type="text" id="name" placeholder="이름" class="tf" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="td">성별</td>
						<td>
							<input type="radio" id="men" name="gender" readonly="readonly"><span class="gender">남</span>
							<input type="radio" id="women" name="gender" readonly="readonly"><span class="gender">여</span>
						</td>
					</tr>
					<tr>
						<td class="td">생년월일</td>
						<td>
							<input type="text" id="age" class="tf" placeholder="생년월일" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class="td">전화번호</td>
						<td>
							<input type="tel" id="tell1" readonly="readonly"> -
							<input type="tel" id="tell2" readonly="readonly"> -
							<input type="tel" id="tell3" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class="td">이메일</td>
						<td>
							<input type="text" id="email1" class="tf" readonly="readonly">
							@
							<input type="text" id="email2" class="tf" readonly="readonly">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="joinbtnGroup">
			<a href="#" id="nextJoin"><img
				src="${pageContext.request.contextPath }/resources/images/btn_ok.gif"></a>
			<a href="${pageContext.request.contextPath }/login/login"><img
				src="${pageContext.request.contextPath }/resources/images/btn_cancel.gif"></a>
		</div>
		</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>