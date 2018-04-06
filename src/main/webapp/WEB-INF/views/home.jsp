<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/reset.css?v=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/common.css?v=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
div#header {
	height: 800px;
	position: relative;
	z-index: 0;
	width: 100%;
	overflow: hidden;
	text-align: center;
}

#main_img {
	position: absolute;
	width: 1920px;
	left: 50%;
	margin-left: -960px !important;
}

#wrap_event {
	padding: 20px 0;
	width: 950px;
	margin: 0 auto;
	overflow: hidden;
}

#wrap_qna {
	position: absolute;
	bottom: 20px;
	width: 260px;
	float: left;
	border-radius: 4px;
	padding: 20px 0 20px 20px;
	background: rgba(20, 58, 81, 0.8);
	text-align: left !important;
	left: 50%;
	margin-left: 205px !important;
}

#wrap_qna h2 {
	display: inline-block;
	padding-bottom: 5px;
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 5px;
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 8px;
	border-bottom: 3px solid #6799FF;
	color: white;
}

#wrap_qna p {
	color: white;
}

#wrap_qna .tel {
	padding: 8px 0;
	font-size: 28px;
}

#wrap_qna .tel span {
	border-radius: 8px;
	background: #F29661;
	color: white;
	font-weight: bold;
	padding: 4px 6px;
	font-size: 16px;
}

#wrap_qna h3 {
	margin-top: 8px;
	background: gray;
	display: inline-block;
	padding: 2px;
	color: white;
}

#day {
	margin-top: 3px;
	font-size: 15px;
}

.event_ul {
	position: absolute;
	bottom: 20px;
	width: 300px;
	float: left;
	/* border: 1px solid #ddd; */
	border-radius: 4px;
	padding: 10px;
	background: rgba(250, 250, 250, 0.6);
	text-align: left !important;
	left: 50%;
	margin-left: -460px !important;
}

.event_ul h2 {
	display: inline-block;
	padding-bottom: 5px;
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 5px;
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 15px;
	border-bottom: 3px solid #6799FF;
}

.event_ul li {
	padding: 5px 0;
}

.event_ul li a {
	display: block;
	width: 100%;
	padding-left: 5px;
	color: black;
	font-size: 15px;
	width: 100%;
}

#wrap_gallery {
	position: relative;
	width: 100%;
	height: 1000px;
	overflow: hidden;
}

#wrap_gallery #img_back {
	position: absolute;
	width: 1920px;
	left: 50%;
	margin-left: -960px !important;
}

#wrap_gallery #title {
	position: absolute;
	top: 100px;
	left: 50%;
	margin-left: -550px !important;
}

#wrap_gallery #imgs {
	width: 950px; position : absolute;
	top: 400px;
	left: 50%;
	position: absolute; top : 400px; left : 50%;
	margin-left: -475px !important;
}

#wrap_gallery #imgs a {
	padding: 10px;
	width: 296px;
	height: 220px;
	display: inline-block;
	overflow: hidden;
	float: left;
}

#wrap_gallery #imgs img {
	width: 100%;
	height: 220px;
}

#wrap_bottom {
	width: 100%;
	background:
		url("${pageContext.request.contextPath}/resources/images/bg.png");
}

#wrap_btn {
	width: 950px;
	margin: 0 auto;
	padding: 30px 0;
	overflow: hidden;
}

#wrap_btn h2 {
	font-size: 22px;
	padding-bottom: 5px;
	border-bottom: 2px solid white;
	color: white;
	font-weight: bold;
}

#wrap_btn div {
	padding: 20px;;
	width: 250px;
	float: left;
}

#wrap_btn #click1 {
	background: #466f85;
}

#wrap_btn #click2 {
	margin: 0 40px;
	background: #175c85;
}

#wrap_btn #click3 {
	background: #373e6a;
}

#wrap_btn div p {
	color: white;
	margin-top: 20px;
	line-height: 20px;
}
</style>

</head>
<body>

	<div id="header">
		<jsp:include page="include/nav.jsp" />
		<img
			src="${pageContext.request.contextPath}/resources/images/main.jpg"
			id="main_img">
		<div class="event_ul">
			<h2>공지사항</h2>
			<ul>
				<li><a href="">4월 휴무안내<span>2018.04.01</span></a></li>
				<li><a href="">4월 휴무안내<span>2018.04.01</span></a></li>
				<li><a href="">4월 휴무안내<span>2018.04.01</span></a></li>
				<li><a href="">4월 휴무안내<span>2018.04.01</span></a></li>
				<li><a href="">4월 휴무안내<span>2018.04.01</span></a></li>
			</ul>
		</div>

		<div id="wrap_qna">
			<h2>문의 및 접수안내</h2>
			<p class="tel">
				<span>TEL</span> 053)000-0000
			</p>
			<p class="tel">
				<span>FAX</span> 053)000-0000
			</p>
			<h3>정기휴장일</h3>
			<p id="day">매월 1,3주 일요일(7,8월은 휴장없음)</p>
		</div>
	</div>




	<div id="wrap_gallery">

		<img
			src="${pageContext.request.contextPath}/resources/images/back1.jpg"
			id="img_back"> <img
			src="${pageContext.request.contextPath}/resources/images/title.png"
			id="title">
		<div id="imgs">
			<div>
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a1.jpg"></a>
			</div>
			<div>
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a2.jpg"></a>
			</div>
			<div>
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a3.jpg"></a>
			</div>
			<div>
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a4.jpg"></a>
			</div>
			<div>
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a5.jpg"></a>
			</div>
			<div>
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a6.jpg"></a>
			</div>
		</div>

	</div>
	<div id="wrap_bottom">
		<div id="wrap_btn">
			<div id="click1">
				<a href="">           
					<h2>오시는 길</h2>
					<p>대구아이티수영장 오시는길을 안내해드립니다.</p>
				</a>
			</div>

			<div id="click2">
				<a href="">
					<h2>온라인 문의</h2>
					<p>수강내용이나 시간등 궁금하신점을 온라인으로 문의하세요.</p>
				</a>
			</div>

			<div id="click3">
				<a href="">
					<h2>수영 클리닉</h2>
					<p>수영의 모든것! 온라인으로 수영레슨을 받아보세요.</p>

				</a>
			</div>
		</div>
	</div>

	<jsp:include page="include/footer.jsp" />

</body>
</html>