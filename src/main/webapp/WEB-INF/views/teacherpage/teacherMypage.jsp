<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 : 마이페이지 : 대구 아이티 수영장</title>
<style>
	#header_title{
		margin-bottom: 10px !important;
	}
	#main_page p{
		margin-bottom: 20px;
		font-weight: bold;
	}
	#t{
		margin-top:40px;
		border-top:2px solid #333333;
		border-bottom:2px solid #333333;
		width:100%;
	}
	#t tr{
		height:50px;
		line-height: 50px;
		background: #ebebeb;
	}
	#t tr td{
		padding:10px;
		text-align: center;
		font-size: 15px;
	}
	#t tr .td{
		width:60%;
		font-size: 20px;
		font-weight: bold;
	}

</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="contentTitle.jsp"/>
			<div id="main_page">
				<p>${login.name }님의 마이페이지 입니다</p>
				<table id="t">
					<tr>
						<td class="td">강사번호</td>
						<td>${login.tno }</td>
					</tr>
					<tr>
						<td class="td">아이디</td>
						<td>${login.id }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
