<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 소개</title>

<style>
#content .area {
	width: 100%;
	margin-bottom: 10px;
}

#content .area1 {
	width: 80%;
	margin-top: 30px;
}
#map {
	margin:0 auto;             
	width:85%;
	height: 400px;
	margin-bottom:20px;
}
.addr{
	display:block;
	margin:0 auto;  
	width:85%;
}
#teacherT{
	width:80%;
	margin:0 auto;              
}
#teacherT tr{
	
}

#teacherT td{

	width:50%;
	height:200px;
	vertical-align: middle;                         
	text-align: center;
}
#teacherT td img{
	max-width:100%;
	max-height:90%;
}
#teacherT td h2{
	font-size: 20px;
	font-weight: bold;
	
}
#teacherT td p{
	color:#777;
	text-align: left;
}
</style>
<script>
      function initMap() {
        var uluru = {lat: 35.853220, lng: 128.590917};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,              
          center: uluru                    
        });                                     
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
      
  
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7g9PrNXeK9QuDQk8fwbquP0e6yBWvGdA&callback=initMap">
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<div id="header_title">
				<div id="main_title">${title }</div>

				<p id="con_navi">

					<img
						src="${pageContext.request.contextPath }/resources/images/homeIcon.png"
						alt="홈"> home &gt; 수영장소개 &gt; <span>${title }</span>
				</p>
			</div>

			<c:if test="${title=='시설안내' }">
				<img
					src="${pageContext.request.contextPath }/resources/images/area1.jpg"
					alt="홈" class="area">
				<img
					src="${pageContext.request.contextPath }/resources/images/area2.jpg"
					alt="홈" class="area">
				<img
					src="${pageContext.request.contextPath }/resources/images/area3.JPG"
					alt="홈" class="area">
				<img
					src="${pageContext.request.contextPath }/resources/images/area4.JPG"
					alt="홈" class="area">
				<img
					src="${pageContext.request.contextPath }/resources/images/area5.JPG"
					alt="홈" class="area1">

			</c:if>
			<c:if test="${title=='강사소개' }">
				<table id="teacherT">
					<c:forEach items="${list }" var="item">
						<tr>
							<td>
								<img src="${pageContext.request.contextPath}/admin/displayFile?filename=${item.img_path}" id="teacherImg">
							</td>
							<td>
								<h2>${item.name}</h2>
								<br>
								<p>${item.info }</p>
							</td>
						</tr>
					</c:forEach>                   
				</table>                                   
				
				
			</c:if>
			
			<c:if test="${title=='오시는길' }">
				<div id="map"></div>
				<img
					src="${pageContext.request.contextPath }/resources/images/addr.jpg" class="addr">
			</c:if>

		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>