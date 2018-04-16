<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 : 마이페이지 : 비밀번호 변경  : 대구 아이티 수영장</title>
<style>
#pw_div {
	border: 1px solid #ccc;
	padding: 30px;
	margin-bottom: 20px;
}

#pw_div table {
	width: 100%;
	border-top: 2px solid #333333;
}

#pw_div table tr {
	border-bottom: 1px solid #d7d7d7;
	height: 25px;
	line-height: 25px;
}
#pw_div table tr td{
	padding:6px 0px 6px 10px;
	font-size: 13px;
	position: relative;
}
#pw_div table tr td input{
	width:200px;
	height:22px;
}
#pw_div table tr .title_td{
	width: 140px;
	background: #ebebeb;
}
#info{
	font-weight: bold;
	font-size: 13px;
	margin-bottom: 10px;
}
#btnGroup{
	margin-top:10px;
	text-align: center;
}
#btnGroup a{
	display: inline-block;
}
#pwImg{
		width: 25px;
		height:25px;
		cursor: pointer;
		margin-left: 5px;
		position: absolute;
		top:0px;
		left:215px;
	}
#pwInfo{
	background:white;
		border:1px solid #333333;
		padding:5px;
		font-size:13px;
		display: none;
		position: absolute;
		top:10px;
		left:245px;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		$(function() {
			$("#pwImg").hover(function() {
				$("#pwInfo").show();
			}, function() {
				$("#pwInfo").hide();
			})

			$("#changePw")
					.click(
							function(e) {
								e.preventDefault();

								if ($("pw").val() == ""
										|| $("#pw2").val() == "") {
									alert("비밀번호를 모두 입력해 주세요");
									return;
								}

								if ($("#pw").val() != $("#pw2").val()) {
									alert("비밀번호가 일치하지 않습니다\n 비밀번호 확인란을 확인해 주세요.");
									$("#pw2").val("").focus();
									return;
								}

								var reg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~@$!#%^&*])[A-Za-z\d~@$!#%^&*]{8,20}$/;

								if (!reg.test($("#pw").val())) {
									alert("비밀번호 형식이 일치하지 않습니다\n 형식을 확인해주세요");
									$("#pw").val("").focus();
									$("#pw2").val("");
									return;
								}
									
								if (confirm("비밀번호를 변경하시겠습니까?")) {
									alert("비밀번호가 변경되었습니다");
									$("#f").submit();
									return true;
								}
							})
		})
	</script>
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="updatePwTitle.jsp" />
			<div id="pw_div">
				<p id="info">새로운 비밀번호를 입력해 주세요</p>
				<table>
					<tr>
						<td class="title_td">새 비밀번호</td>
						<td>
							<form action="updatePw" method="post" id="f">
								<input type="password" id="pw" maxlength="20" name="pw">
								<input type="hidden" name="id" value="${login.id }">
							</form> <img
							src="${pageContext.request.contextPath }/resources/images/warning.png"
							id="pwImg">
							<div id="pwInfo">
								비밀번호는 8~20자 입니다<br> 비밀번호는 영문,숫자,특수문자()만 사용가능합니다.<br>
								비밀번호는 최소 한번의 영문,숫자,특수문자를 포함해야합니다.<br>
							</div>
						</td>
					</tr>
					<tr>
						<td class="title_td">비밀번호 확인</td>
						<td><input type="password" id="pw2" maxlength="20"></td>
					</tr>
				</table>
			</div>
			<div id="btnGroup">
				<a href="#" id="changePw"><img
					src="${pageContext.request.contextPath }/resources/images/btn_ok.gif"></a>
				<a href="updatePwStep1"><img
					src="${pageContext.request.contextPath }/resources/images/btn_cancel.gif"></a>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
