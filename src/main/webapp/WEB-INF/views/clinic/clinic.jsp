<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.h2 {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 15px;
	color: #5f5f5f;
}

.h3 {
	font-size: 15px;
	font-weight: bold;
	color: #696969;
	vertical-align: baseline;
	white-space: normal;
	line-height: 25px;
}

.blue_color {
	color: blue;
}

#menu_tpye {
	width: 100%;
	height: 50px;
	overflow: hidden;
}

#menu_tpye li {
	float: left;
	line-height: 50px;
	font-size: 20px;
	width: 19.8%;
	text-align: center;
	border-left: 1px solid #e0e0e4;
	background: #f0f0f0;;
}

#menu_tpye li a {
	color: #5f5f5f;
}

.active_li {
	background: #27285b !important;
}

.active_li a {
	color: white !important;
}

#imgbox {
	height: 170px;
	width: 100%;
}

.clinic_list_div {
	overflow: hidden;
}

.clinic_list_div img {
	float: left;
}

.clinic_list_div p {
	padding-top:20px;
	float: left;
	width: 50%;
	font-size:15px;
}
.list_title{
	line-height: 36px;
}
.list_title
</style>
<title>대구 아이티 수영장 - 수영클리닉</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<h2 class="h2">(주)대구 아이티 수영장 정영화입니다.</h2>
			<h3 class="h3">
				수영은 오래기간 체계적으로 배우지 않으면 좋은 자세를 완성하기 매우 까다로운 종목입니다. 지난 20여년 동안 제가 직접
				수영을 지도하면서 확인한, <span class="blue_color">수영인들의 공통적으로 어려워하는 문제들</span>을
				추려서 차곡차곡 알려드립니다.
			</h3>
			<img
				src="${pageContext.request.contextPath }/resources/img/good2.png"
				id="imgbox">
			<ul id="menu_tpye">
				<li class="active_li"><a href="">자유형</a></li>
				<li><a href="">배영</a></li>
				<li><a href="">평영</a></li>
				<li><a href="">접영</a></li>
				<li><a href="">스타트 & 턴</a></li>
			</ul>
			<ul id="view_list">
				<li class="clinic_list">
					<img src="${pageContext.request.contextPath }/resources/img/clinic_ask.png">
					<p class="list_title">
						자유형
						할 떄 호흡이 너무 힘드네요, 사람도 몸으로 호흡할 수 있나요?
					</p>
					<div class="clinic_list_div">
						<img
							src="${pageContext.request.contextPath }/resources/img/clinic_answer.png">
						<p>
							수영을 처음 배우면서 가장 힘들고 어려워하는 부분이 바로 발차기입니다. 발차기 연습은 아무리해도 지나치지 않을 정도로
							중요하지만 올바른 느낌을 갖지 않으면 상-고급반에 올라가서도 저항을 많이 받는, 즉
							<불필요한> 발차기를 계속 하게 됩니다. 초급 수영자들의 발차기를 유심히 살펴보면, 대부분 허벅지에 힘을
							잔뜩 주어 무릎을 45도 이상 구부려서 힙겹고 가라앉는 발차기를 하고 있습니다. 무릎관절은 앞뒤로 90도 이상 접히게
							되어있지만, 수영을 할 때 무릎을 심하게 접으면 허벅지가 내려가고 종아리에 심한 저항을 받게 되어 발차기는 힘들
							수밖에 없습니다. 축구로 예를들면, 공을 찰 때 왼발은 공 옆에 디디고 오른발을 뒤로 젖혀 발등으로 슛을 하게
							됩니다. 이때 회전축은 골반이 되며 골반부터 발끝까지 점차적으로 공을 향해 앞으로 뻗어주게 됩니다. 골반을 축으로
							하여 힙과 허벅지를 뒤로 움직여 무릎을 살짝 구부려 공을 차게 되는 것입니다. 수영의 발차기도 같은 원리입니다.
							대부분의 초급 수영자들은 발차기를 할 때 양쪽 허벅지가 거의 붙어 있을 정도이며 종아리와 발목까지 힘이 들어가 있으니
							부드러운 발차기를 할 수 없게 됩니다. 힙과 허벅지로 리드를 해야만 발목에 힘이 빠지게 되고, 그로인해 부드러운
							발차기를 할 수 있습니다. 힙과 허벅지를 움직여, 발바닥, 발등으로 물을 밀어주는 느낌을 갖고 발차기를 하면 힘을
							들이지 않아도 가라앉지 않고 추진력을 얻을 수 있는겁니다. 
						</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>