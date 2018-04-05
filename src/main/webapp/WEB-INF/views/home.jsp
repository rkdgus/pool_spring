<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div#header {
	height: 600px;
	position: relative;
	z-index: 0;
	width: 100%;
	/*  margin: 0 -460px;   */
	overflow: hidden;
	text-align: center;
}

#main_img {
	position: absolute;
	width: 1920px;
	left: 50%;
	margin-left: -960px !important;
}
#wrap_container{
	width:100%;
	
}
#wrap_event{
	padding:20px 0;
	width:950px;
	margin:0 auto;
	height:200px;
}
#event_ul{
	width:400px;
}
#event_ul h2{
display:inline-block;
padding-bottom:5px;
	font-size: 18px;
	font-weight: bold;
	margin-bottom:20px;
	border-bottom:2px solid blue; 
}
#event_ul li:FIRST-CHILD{
	border-top: 1px solid #ccc;
}
#event_ul li{
	border-bottom: 1px solid #ccc;
	padding:10px 0;
}
#event_ul li a{
	color:#666;
	font-size: 15px;
}
</style>
</head>
<body>

	<div id="header">
		<jsp:include page="include/nav.jsp" />
		<img
			src="${pageContext.request.contextPath}/resources/images/main.jpg"
			id="main_img">
	</div>

	<div id="wrap_container">
		<div id="wrap_event">
			<div id="event_ul">
				<h2>공지사항</h2>
				<ul>
					<li><a href="">ㅁㄴㅇㄹ</a></li>
					<li><a href="">ㅁㄴㅇㄹ</a></li>
					<li><a href="">ㅁㄴㅇㄹ</a></li>
					<li><a href="">ㅁㄴㅇㄹ</a></li>
					<li><a href="">ㅁㄴㅇㄹ</a></li>
				</ul>
			</div>
		</div>
	</div>

	<jsp:include page="include/footer.jsp" />

</body>
</html>