<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 대구 아이티 수영장</title>
<style>
	table{
		width:100%;
	}
	#step2Info{
		font-size: 12px;
		color:gray;
		line-height: 1.5em;
	}
	.title_img{
		margin-bottom: 10px;
		margin-top: 20px;
	}
	.step2_content{
		width:100%;
		height:270px;
		overflow: auto;
		background-color: #f0f0f0;
		border:1px solid #f0f0f0;
		
	}
	#joinbtnGroup{
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="contentTitle.jsp" />
		<table
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
						src="${pageContext.request.contextPath }/resources/images/guide_02_on.gif">
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
						src="${pageContext.request.contextPath }/resources/images/guide_05.gif">
					</td>
					<td align="right"><img
						src="${pageContext.request.contextPath }/resources/images/bg03.gif">
					</td>
				</tr>
			</tbody>
		</table>
		<div id="step2Info">
			<div id="step2_1">
				<div class="title_img">
					<img src="${pageContext.request.contextPath }/resources/images/join2.png">
				</div>
				<div class="step2_content">
					<span class="title">제1조 목적</span><br>
					이 약관은 OOOO(이하"회사"라 한다)이 운영하는 OOOOOOOO.com (이하"사이트"라 한다)에서 제공하는 문자메세지 전송 서비스(이하 "서비스"라 한다)의 이용조건 및 절차, 회사와 회원간의 권리, 의무, 기타 필요한 사항을 규정함을 목적으로 합니다.
					<br><br>
					<span class="title">제2조 약관의 효력 및 변경</span><br>
					1. 이 약관은 그 내용을 회사 사이트에 게시하여 이용회원에게 공지함으로써 효력을 발생합니다.<br>
					2. 회사는 관련법을 위배하지 않는 범위에서 이 약관을 정할 수 있으며 필요시 약관을 변경할 수 있습니다.<br>
					3. 회사가 약관을 변경할 경우에는 회사 사이트에 그 적용일자 7일 이전부터 적용일자 전일까지 공지하며, 제1항과 같은 방법으로 효력이 발생합니다. <br>
					4. 회원은 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 언제든지 탈퇴할 수 있습니다. 약관의 효력발생일 이후의 계속적인 서비스 이용은 약관의 변경사항에 동의한 것으로 간주합니다.<br><br>
					<span class="title">제3조 약관의 적용</span><br>
					1. 이 약관에서 정하지 않은 사항은 관계법규에 의하거나, 관계법규 등에도 정함이 없는 경우 일반적인 상관례에 따릅니다.<br><br>
					<span class="title">제4조 용어의 정의</span><br>
					1. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br>
					&nbsp;
					 ① 회원 : 본 약관에 동의하고 서비스 이용에 필요한 사용자 아이디와 사용자 비밀번호를 부여받아 회사가 운영하는 사이트에서 서비스를 이용하는 개인을 말합니다.<br>
					&nbsp;
					 ② 사용자 아이디 : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 지정하는 4~12자로 구성된 문자와 숫자의 조합을 말합니다.<br>
					&nbsp;
					 ③ 사용자 비밀번호 : 회원이 부여받은 사용자 아이디와 일치되는 회원임을 확인하고 회원의 비밀보호를 위해 정한 4~12자로 구성된 문자 또는 숫자의 조합을 말합니다.<br><br><br>
					
					<span class="title">[제2장 계약의 체결]</span><br><br>
					
					<span class="title">제5조 가입신청</span><br> 
					 1. 이용자는 회사가 정한 가입 양식에 따라 회원정보를 성실히 기입하고, 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청하며 회사는 이를 회사가 정한 실명확인절차를 거쳐 회원가입을 승낙하는 것을 원칙으로 합니다.
					 <br><br>
					 
					   
				</div>
			</div>
		</div>
		<div id="joinbtnGroup">
			<a href="${pageContext.request.contextPath }/join/joinStep3"><img
				src="${pageContext.request.contextPath }/resources/images/btn_ok.gif"></a>
			<a href="${pageContext.request.contextPath }/login/login"
				id="btnCancel"><img
				src="${pageContext.request.contextPath }/resources/images/btn_cancel.gif"></a>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>