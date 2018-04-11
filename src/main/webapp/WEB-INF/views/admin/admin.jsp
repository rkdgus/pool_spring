<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 관리자모드</title>

<style>
	.box{
		width:170px;
		height:180px;
		display: inline-block;
		background: #175c85;
		color:white;
		font-weight: bold;
		font-size: 22px;
		text-align: center;
		margin:4px;
		line-height: 180px;                            
	}
	.box:hover{
		background: #373e6a;                          
	}
</style>               
</head>             
<body>
	<jsp:include page="../include/header.jsp"/>
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="contentTitle.jsp"/>
			
			<a href="${pageContext.request.contextPath }/admin/member" class="box">회원관리</a>
			<a href="${pageContext.request.contextPath }/admin/teacher" class="box">강사관리</a>
			<a href="" class="box">수영클리닉관리</a>
			<a href="${pageContext.request.contextPath }/admin/gallery" class="box">갤러리관리</a>
			<a href="" class="box">반별게시판관리</a>
			<a href="" class="box">공지관리</a>
			<a href="${pageContext.request.contextPath }/adminQna/qna" class="box">문의관리</a>

			
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>