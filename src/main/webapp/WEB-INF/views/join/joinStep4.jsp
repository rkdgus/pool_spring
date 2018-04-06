<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 대구 아이티 수영장</title>
<style>
table {
	width: 100%;
}

#join_content {
	margin-top: 30px;
}
#join_content_t{
	margin-bottom: 10px;
}
#idCheck{
	background: #fff;
	border:1px solid #ccc;
	border-radius:2px;
	outline: none;
	cursor: pointer;
}
#joinbtnGroup a{
	display: inline-block;
}

#join_content table{
	border-top: 2px solid #333333;
	width:100%;
}
#joinbtnGroup{
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
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
						<td><input type="text" id="id">
							<button id="idCheck">중복확인</button>
						</td>
					</tr>
					<tr>
						<td class="td">비밀번호</td>
						<td><input type="password" id="pw"></td>
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
						<td id="age"></td>
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
			<a href="#"><img src="${pageContext.request.contextPath }/resources/images/btn_regist_general.gif"></a>
			<a href="${pageContext.request.contextPath }/login/login"><img src="${pageContext.request.contextPath }/resources/images/btn_cancel_s.gif"></a>
		
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>