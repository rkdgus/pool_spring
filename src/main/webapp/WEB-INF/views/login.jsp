<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/common.css">
<style>
	#header_title{
		height:43px;
		font-family:"맑은 고딕","Malgun Gothic","돋움","dotum";
		width:100%;
		border-bottom: 1px solid #e5e5e5;
		margin-bottom: 40px;
	}
	#main_title{
		float: left;
		font-size: 24px;
		font-weight: bold;
		line-height:1.7em;
		padding-bottom: 7px;
	}
	#con_navi{
		float: right;
		font-size: 13px;
		line-height:49px;
		color:#000;
		opacity:0.3;
		padding-bottom: 7px;
	}
</style>
</head>
<body>
	<jsp:include page="include/header.jsp"/>
	<div id="container">
		<jsp:include page="include/side.jsp"/>
		
		<div id="header_title">
		<div id="main_title">로그인</div>
		
		<p id="con_navi">
		
			<img src="${pageContext.request.contextPath }/resources/images/homeIcon.png" alt="홈">
				home &gt; 
				멤버십 &gt;
			<span>로그인</span>
		</p>
	</div>
	</div>
	
	<jsp:include page="include/footer.jsp"/>
</body>
</html>