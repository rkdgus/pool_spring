<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW찾기 : 대구 아이티 수영장</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
#title_img {
	margin: 0 auto;
	display: block;
	width: 720px;
	margin-bottom: 40px;
}

#search_id {
	float: left;
	width: 35%;
	background: rgb(235, 235, 235);
	position: relative;
	padding: 25px 15px 30px 15px;
	margin-left: 80px;
	font-size: 13px;
	font-weight: bold;
}

#search_pw {
	float: left;
	width: 35%;
	background: rgb(235, 235, 235);
	position: relative;
	padding: 27px 15px 30px 15px;
	margin-left: 50px;
	font-size: 13px;
	font-weight: bold;
}

#join_content label {
	width: 70px;
	display: inline-block;
}

#id_btn {
	position: absolute;
	top: 27px;
	right: 20px;
}

#pw_btn {
	position: absolute;
	top: 40px;
	right: 20px;
}

#join_content p {
	margin-top: 3px;
	color: #555;
}

.timg {
	position: absolute;
	top: -20px;
	left: 0;
}
</style>
<script type="text/javascript">
 	$(function(){
		$("#id_btn").click(function(){
			$("#idf").submit(); 
			return false;
			
		})                                                             
	}) 
		
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script
		src="${pageContext.request.contextPath }/resources/login/login.js"></script>
	<div id="container">
		<div id="loginForm">
			<div id="header_title">
				<div id="main_title">ID/PW찾기</div>

				<p id="con_navi">

					<img
						src="${pageContext.request.contextPath }/resources/images/homeIcon.png"
						alt="홈"> home &gt; 멤버십 &gt; <span>ID/PW찾기</span>
				</p>
			</div>
			<div id="join_content">
				<img
					src="${pageContext.request.contextPath }/resources/images/idpw.png"
					id="title_img">
				<div id="search_id">
					<img
						src="${pageContext.request.contextPath }/resources/images/title_id.png"
						class="timg">
					<form id="idf"
						action="${pageContext.request.contextPath }/login/search"
						method="post">
						<p>
							<label for="name1">NAME</label> <input type="text"
								 id="name1" name="name">
						</p>
						<p>
							<label for="email1">EMAIL</label> <input type="email" id="email1"
								name="email">
						</p>
						<a href="#" class='ok_btn' id="id_btn"><img
							src="${pageContext.request.contextPath }/resources/images/ok_btn.gif"></a>
					</form>

				</div>

				<div id="search_pw">             
					<img
						src="${pageContext.request.contextPath }/resources/images/title_pw.png"
						class="timg">
					<form id="pwf"
						action="${pageContext.request.contextPath }/login/login"
						method="post">
						<p>
							<label for="id2">ID</label> <input type="text"
								 id="id2" name="id">
						</p>
						<p>
							<label for="name2">NAME</label> <input type="text"
								 id="name2" name="name">
						</p>
						<p>
							<label for="email2">EMAIL</label> <input type="email" id="email2"
								name="email">
						</p>
						<a href="#" class='ok_btn' id="pw_btn"><img
							src="${pageContext.request.contextPath }/resources/images/ok_btn.gif"></a>
					</form>

				</div>


			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>