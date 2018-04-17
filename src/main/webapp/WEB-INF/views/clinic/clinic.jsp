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
	display: none;
	overflow: hidden;
	background: #f5f8fb;
	padding: 15px 0px;
}

.clinic_list_div img {
	float: left;
	padding:0px 34px;
}

.clinic_list_div p {
	padding-top:20px;
	float: left;
	font-size: 15px;
	width: 90%;
	padding-top: 10px;
	text-align: justify;
	line-height: 24px;
}

.clinic_list {
	padding: 10px;
}

.list_title {
	width: 100%;
	padding: 10px 0px;
	overflow: hidden;
	border-bottom: 1px solid #e2e2e2;
}

.list_title img {
	float: left;
}

.list_title p {
	float: left;
	padding-left: 10px;
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
				<li class="active_li"><a href="" data-type="freestyle">자유형</a></li>
				<li><a href="" data-type="backstroke">배영</a></li>
				<li><a href="" data-type="breaststroke">평영</a></li>
				<li><a href="" data-type="butterfly">접영</a></li>
				<li><a href="" data-type="startAndTrun">스타트 & 턴</a></li>
			</ul>
			<ul id="view_list">
			</ul>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script type="text/javascript">
		$(function(){
			typelist("freestyle");
			$(document).on("click",".list_title",function(){
				$("#view_list").find(".clinic_list_div").stop().not($(this).next()).slideUp();
				$(this).next().slideToggle();
			})
			$("#menu_tpye li a").click(function(e){
				e.preventDefault(); 
				var type = $(this).attr("data-type");
				$("#menu_tpye").find("li").removeClass("active_li");
				$(this).parent().addClass("active_li");
				typelist(type);
			})
		})
		
		function typelist(type){
			$.ajax({
				url:"list",
				data:{"type":type},
				type:"get",
				dataType:"json",
				success:function(json){
					$("#view_list").empty();
					if(json.length !=0){
						$("#view_list").empty();
						var img_q = "<img src='${pageContext.request.contextPath }/resources/img/clinic_ask.png'>";
						var img_a = "<img src='${pageContext.request.contextPath }/resources/img/clinic_answer.png'>";
						
						for(var i=0; i<json.length; i++){
							var li = $("<li>").addClass("clinic_list");
							var div_title = $("<div>").addClass("list_title");
							var p_title = $("<p>").text(json[i].clinic_title);
							div_title.append(img_q).append(p_title);
							
							var div_content = $("<div>").addClass("clinic_list_div");
							var p_content = $("<p>").html(json[i].clinic_content);
							div_content.append(img_a).append(p_content);
							if(json[i].clinic_path !="" && json[i].clinic_path !=null ){
								var imgArr = json[i].clinic_path.split(",");
								for(var j=0; j<imgArr.length; j++){
									var imgpath = "<img src='"+imgArr[j]+"'>";
									div_content.append(imgpath);
								}
							}
							li.append(div_title).append(div_content);
							$("#view_list").append(li);
						}	
					}
				}
			})
		}
	</script>
</body>
</html>