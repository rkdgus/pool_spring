<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 회원정보 :개인정보 수정:대구 아이티 수영장</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/mypage/updateMember.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		var check = 1;
		var orignalE = "${member.email}";
		$(function() {

			

			$("#sel").change(function() {
				$("#email2").val($(this).val());
				check = -1;
				$("#eCheck").text("중복확인");
			})

			$("#email1").keyup(function() {
				$("#eCheck").text("중복확인");
				check = -1;
			})

			$("#email2").keyup(function() {
				check = -1;
				$("#eCheck").text("중복확인");
			})

			$("#updateBtn").click(
					
					function() {
						var email = $("#email1").val() + "@" + $("#email2").val();
						
						if (email == orignalE) {
							check = 1;
						}

						if ($("#tell1").val() == "" || $("#tell2").val() == ""
								|| $("#tell3").val() == "") {
							alert("전화번호를 모두 입력해야합니다");
							$("#tell1").focus();
							return;
						}

						if ($("#email1").val() == ""
								|| $("#email2").val() == "") {
							alert("이메일은 모두 입력해야합니다");
							$("#email1").focus();
							return;
						}

						if (check < 0) {
							alert("이메일 중복을 확인해 주세요");
							return;
						}
						if (confirm("회원님의 정보를 수정하시겠습니까?")) {
							var email = $("#email1").val() + "@"
									+ $("#email2").val();
							var tell = $("#tell1").val() + "-"
									+ $("#tell2").val() + "-"
									+ $("#tell3").val();

							$.ajax({
								url : "update",
								type : "post",
								dataType : "text",
								data : {
									"email" : email,
									"tell" : tell,
									"id":"${member.id}"
								},
								success : function(result) {
									console.log(result);
									if(result=="success"){
										alert("개인정보가 수정되었습니다");
										location.href="updateMemberStep1";
										return;
									}
								}
							})
						}

					})

			$("#eCheck").click(function() {
				var email = $("#email1").val() + "@" + $("#email2").val();
				$.ajax({
					url : "checkEmail",
					type : "post",
					dataType : "text",
					data : {
						"email" : email
					},
					success : function(result) {
						console.log(result);
						if (result == "use") {
							alert("사용가능한 이메일 입니다");
							$("#eCheck").text("사용가능");
							check = 1;
							return;
						}
						if (result = "not use") {
							alert("중복된 이메일입니다 (사용 불가)");
							$("#eCheck").text("중복확인");
							check = -1;
							return;
						}
					}
				})

			})
		})
	</script>
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="updateTitle.jsp" />
			<div id="basic_t">
				<p class="info_title">
					<span class="mark">■</span>기본정보
				</p>
				<table>
					<tr>
						<td class="t_title">회원번호</td>
						<td>${member.mno }</td>
					</tr>
					<tr>
						<td class="t_title">이름</td>
						<td>${member.name }</td>
					</tr>
					<tr>
						<td class="t_title">성별</td>
						<td>${member.gender }</td>
					</tr>
				</table>
			</div>
			<div id="update_t">
				<p class="info_title">
					<span class="mark">■</span>수정가 가능한 정보
				</p>
				<table>
					<tr>
						<td class="t_title">연락처</td>
						<td><input type="text" id="tell1"> - <input
							type="text" id="tell2"> - <input type="text" id="tell3">
						</td>
					</tr>
					<tr>
						<td class="t_title">이메일</td>
						<td><input type="text" id="email1"> @ <input
							type="text" id="email2"> <select id="sel">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hotmail.com">hotmail.com</option>
						</select>
							<button id="eCheck">중복확인</button></td>
					</tr>
				</table>
				<c:if test="${member !=null }">
					<script>
						var tell = "${member.tell}";
						$("#tell1").val(tell.substring(0, tell.indexOf("-")));
						$("#tell2").val(
								tell.substring(tell.indexOf("-") + 1, tell
										.lastIndexOf("-")));
						$("#tell3").val(tell.substr(tell.lastIndexOf("-") + 1));

						var email = "${member.email}";

						$("#email1").val(email.substr(0, email.indexOf("@")));
						$("#email2").val(email.substr(email.indexOf("@") + 1));
					</script>
				</c:if>
			</div>
			<div id="btnGroup">
				<button id="updateBtn">수정</button>
				<a
					href="${pageContext.request.contextPath }/mypage/updateMemberStep1"><button>취소</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>