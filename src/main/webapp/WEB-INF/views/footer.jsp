<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/reset.css">
<style>
	footer{
		background: #333333;
		width:100%;
		height:204px;
		padding:18px 0px 10px 0px;
	}
	footer ul{
		width:100%;
		padding-left: 15px;
	}
	footer ul li{
		float: right;
		width:80px;
		padding:5px 0px;
		text-align: center;
		border-left: 1px solid #9a9a9a;
		height:10px;
		line-height: 10px;
	}
	footer ul li a{
		text-decoration:none;
		color:#9a9a9a;
		font-size: 13px;
		font-weight: bold;
	}
	footer ul li:LAST-CHILD a{
		color:white;
	}
	footer ul li:LAST-CHILD{
		border: none;
	}
	#footer_body{
		width:950px;
		margin: 0 auto;
	}
	#footer_list{
		float: right;
		width:50%;
		margin-bottom: 15px;
	}
	#footer_info{
		color:#9a9a9a;
		clear: both;
		font-size: 13px;
		overflow: hidden;
	}
	#footer_info #info1{
		line-height: 25px;
		float: left;
	}
	#footer_info #info2{
		float:right;
		line-height: 30px;
		float: right;
	}
	#footer_info #info1 #title{
		font-size: 16px;
		font-weight: bold;
	}
	#logo{
		float: left;
		padding-right: 70px;
	}
	#info2 #tell_main{
		font-size: 16px;
		font-weight: bold;
	}
	
</style>
</head>
<body>
	<footer>
		<div id="footer_body">
			<div id="footer_list">
				<ul>
					<li><a href="#">문의하기</a></li>
					<li><a href="#">고객센터 </a></li>
					<li><a href="#">상담신청 </a></li>
					<li><a href="#">이용약관 </a></li>
					<li><a href="#">회사소개 </a></li>
				</ul>
				
			</div>
			<div id="footer_info">
				<div id="logo">
					<img src="${pageContext.request.contextPath}/resources/img/logoWhite.png">
				</div>
				<div id="info1">
					<p id="title">(주)대구 아이티 수영장</p>
					<p>주소 : 대구광역시 남구 2007-2 대구 아이티 수영장 </p>
					<p>설립일: 2018년 5월 3일 | 대표이사 : 정영화 | 개인정보책임자 : 김민수</p>
					<p>사업자등록번호 : 123-12-1234567</p>
					<p>Copyright ⓒ 2018 대구 아이티 수영장  All rights reserved.</p>
					<p>made by 이강현  하홍범  최다희</p>
				</div>
				<div id="info2">
					<p id="tell_main">대표전화 053-477-5580 </p>
					<p>평일 09:00~18:00/토 10:00~15:00/일,공휴일 휴무</p>
					<p>팩스 : 123-123-123</p>
					<p>이메일 : swimming@enjoyswim.com</p>
				</div>
			</div>
		</div>
		<div>
			
		</div>
	</footer>
</body>
</html>