<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 회원정보  :개인정보 수정:대구 아이티 수영장</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="updateTitle.jsp"/>
			<div>
				<p class="info_title"><span class="mark">■</span>기본정보</p>
				<table>
					<tr>
						<td>회원번호</td>
						<td>${login.mno }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${login.name }</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>${login.gender }</td>
					</tr>
				</table>
			</div>
			<div>
				<p class="info_title"><span class="mark">■</span>수정가 가능한 정보</p>
				<table>
					<tr>
						<td>연락처</td>
						<td>
							<input type="text" id="tell1"> 
							-
							<input type="text" id="tell2">
							-
							<input type="text" id="tell3">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" id="email1"> @ <input type="text" id="email2">
							<select id="sel">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hotmail.com">hotmail.com</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>