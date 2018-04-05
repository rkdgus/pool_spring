<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
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
		width: 1900px;   
		left:50%;
		margin-left:-950px !important;        
		
	}
</style>
</head>
<body>
<div id="header">
	<jsp:include page="nav.jsp"/>
	<img src="${pageContext.request.contextPath}/resources/images/back.jpg" id="main_img">
</div>
</body>
</html>