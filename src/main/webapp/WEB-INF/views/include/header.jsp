<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	div#header{
		height:300px;
		position: relative;     
		z-index: 0;
		width: 100%;                      
		/*  margin: 0 -460px;   */                                 
		overflow: hidden;   
		text-align: center;        
	}  
	#main_img{
		position: absolute; 
		height:1018px;              
		width: 1920px;   
		left:50%;
		margin-left:-960px !important;        

	}
</style>
</head>
<body>
<div id="header">
	<jsp:include page="nav.jsp"/>
	<img src="${pageContext.request.contextPath}/resources/images/s6.jpg" id="main_img">
</div>          
</body>
</html>