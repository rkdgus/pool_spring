<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 갤러리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/slick-theme.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/slick.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<style>
.slider div{
	height:500px;        
}
.slider div img{
	width:100%;           
	max-height:100%;
}
.slider-nav div{
	height:100px;
	overflow: hidden;        
}

.slider-nav div img{
	width:100%;
	  
}

</style>               
<script type="text/javascript">
$.noConflict();

var j = jQuery;
j(function() {
	slider();
	function slider() {
		j('.slider').slick({
			autoplay : true, //자동슬라이드
			slidesToShow : 1, //큰이미지 몇개 보여줄것인지
			slidesToScroll : 1,
			speed : 1000,
			autoplaySpeed : 3500,
			arrows : true,
			fade : false,
			dots : false
		});
		 j('.slider-nav').slick({
	          slidesToShow: 4, //작은이미지 몇개 보여줄것인지..
	          slidesToScroll: 1,
	          asNavFor: '.slider',           
	          focusOnSelect: true,
	       });
	}
})   
 </script> 
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<div id="header_title">
				<div id="main_title">내부사진</div>

				<p id="con_navi">

					<img
						src="${pageContext.request.contextPath }/resources/images/homeIcon.png"
						alt="홈"> home &gt; 갤러리 &gt; <span>내부사진</span>
				</p>
			</div>
			
			
			<div class="slider">
				<div><a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a1.jpg"></a>
					
				</div>
				<div><a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a2.jpg"></a></div>
				<div><a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a3.jpg"></a></div>
				<div><a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a4.jpg"></a></div>
				<div><a href=""><img
					src="${pageContext.request.contextPath}/resources/images/a5.jpg"></a></div>
			</div>
			
			<div class="slider-nav">
				<div><img
					src="${pageContext.request.contextPath}/resources/images/a1.jpg"></div>
				<div><img
					src="${pageContext.request.contextPath}/resources/images/a2.jpg"></div>
				<div><img
					src="${pageContext.request.contextPath}/resources/images/a3.jpg"></div>
				<div><img
					src="${pageContext.request.contextPath}/resources/images/a4.jpg"></div>
				<div><img
					src="${pageContext.request.contextPath}/resources/images/a5.jpg"></div>
			</div>
			
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>