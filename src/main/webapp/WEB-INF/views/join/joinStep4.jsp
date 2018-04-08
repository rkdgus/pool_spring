<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 대구 아이티 수영장</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/join/joinStep4.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script src="${pageContext.request.contextPath }/resources/join/joinStep4.js"></script>	
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
						src="${pageContext.request.contextPath }/resources/images/guide_03.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_04_on.gif">
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
			<div id="join_content_t">
				<img
					src="${pageContext.request.contextPath }/resources/images/join4.png">
			</div>

			<div id="confirm">
				<table>
					<tr>
						<td class="td">회원번호</td>
						<td id="mno">${member.mno }</td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="td">아이디</td>
						<td><input type="text" id="id" placeholder="아이디(6~15,영어,숫자만 가능)" maxlength="15">
							<button id="idCheck">중복확인</button>
						</td>
					</tr>
					<tr>
						<td class="td">비밀번호 </td>
						<td id="pwtd"><input type="password" id="pw" maxlength="20"> <img src="${pageContext.request.contextPath }/resources/images/warning.png" id="pwImg">
							<div id="pwInfo">
								비밀번호는 8~20자 입니다<br>
								비밀번호는 영문,숫자,특수문자()만 사용가능합니다.<br>
								비밀번호는 최소 한번의 영문,숫자,특수문자를 포함해야합니다.<br>
							</div>
						</td>
					</tr>
					<tr>
						<td class="td">비밀번호 확인</td>
						<td><input type="password" id="pw2">
							<span id="err">비밀번호가 일치하지 않습니다</span>
							<span id="ok">비밀번호가 일치합니다</span>
						</td>
					</tr>
				</table>
				<table id="mem">
					<tr>
						<td class="td">이름</td>
						<td id="name">${member.name }</td>
					</tr>
					<tr>
						<td class="td">성별</td>
						<td id="gender">${member.gender }</td>
					</tr>
					<tr>
						<td class="td">생년월일</td>
						<td id="age">${member.age }</td>
					</tr>
					<tr>
						<td class="td">전화번호</td>
						<td id="tell">${member.tell }</td>
					</tr>
					<tr>
						<td class="td">이메일</td>
						<td id="email">${member.email }</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="joinbtnGroup">
			<a href="${pageContext.request.contextPath }/join/joinStep5" id="next"><img src="${pageContext.request.contextPath }/resources/images/btn_regist_general.gif"></a>
			<a href="${pageContext.request.contextPath }/login/login"><img src="${pageContext.request.contextPath }/resources/images/btn_cancel_s.gif"></a>
		
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>