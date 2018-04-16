<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 회원정보 : 대구 아이티 수영장</title>
<style>
	#t{
	 	width:100%;
	 	border-top: 2px solid #333333;
	 	font-size: 13px;
	}	
	#t tr{
		border-bottom: 1px solid #d7d7d7;
		height:25px;
		line-height: 25px;
	}
	#t tr td{
		padding:5px 10px;
		color:gray;
	}
	#t .t_title{
		width:120px;
		background: #ebebeb;
		color:black;
	}
	#btnGroup{
		text-align: right;
		margin-top: 20px;
	}
	#btnGroup a{
		display: inline-block;
	}
	#btnGroup a button{
	border:1px solid #5c5c5c;
		background: #fff;
		font-size: 12px;
		outline: none;
		padding:5px 10px;
		border-radius:2px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="memberInfoTitle.jsp"/>
			<table id="t">
				<tr>
					<td class="t_title">회원번호</td>
					<td>${member.mno}</td>
				</tr>
				<tr>
					<td class="t_title">이름</td>
					<td>${member.name }</td>
				</tr>
				<tr>
					<td class="t_title">성별</td>
					<td>${member.gender }</td>
				</tr>
				<tr>
					<td class="t_title">생년월일</td>
					<td>${member.age }</td>
				</tr>
				<tr>
					<td class="t_title">연락처</td>
					<td>${member.tell }</td>
				</tr>
				<tr>
					<td class="t_title">이메일</td>
					<td>${member.email }</td>
				</tr>
			</table>
			<div id="btnGroup">
				<a href="${pageContext.request.contextPath }/mypage/updateMemberStep1"><button>수정</button></a>
				<a href="${pageContext.request.contextPath }/mypage/cancelRegisterStep1"><button>탈퇴신청</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>