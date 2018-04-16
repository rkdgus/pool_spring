<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 : 마이페이지  : 대구 아이티 수영장</title>
<style>
#info{
	overflow: hidden;
}
	#t{
		float:left;
	 	width:75%;
	 	border-top: 2px solid #333333;
	 	font-size: 13px;
	}	
	#t tr{
		border-bottom: 1px solid #d7d7d7;
		height:25px;
		line-height: 25px;
	}
	#t tr td{
		padding:5px 10px;
		color:gray;
	}
	#t .t_title{
		width:120px;
		background: #ebebeb;
		color:black;
	}
	#btnGroup{
		text-align: right;
		margin-top: 20px;
	}
	#btnGroup a{
		display: inline-block;
	}
	#btnGroup a button{
	border:1px solid #5c5c5c;
		background: #fff;
		font-size: 12px;
		outline: none;
		padding:5px 10px;
		border-radius:2px;
	}
	#t_img{
		float:right;
		width:20%;
		min-height:142px;
		border: 2px solid #333333;
	}
	#t_img img{
		width:100%;
		height:142px;
	}
	#no_img{
		font-size: 13px;
		color:gray;
		text-align: center;
		margin-top: 40%;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp"/>
		<div id="content">
			<jsp:include page="teacherInfoTitle.jsp"/>
			<div id="info">
				<table id="t">
				<tr>
					<td class="t_title">강사번호</td>
					<td>${teacher.tno}</td>
				</tr>
				<tr>
					<td class="t_title">이름</td>
					<td>${teacher.name }</td>
				</tr>
				<tr>
					<td class="t_title">직급</td>
					<td>${teacher.title }</td>
				</tr>
				<tr>
					<td class="t_title">연락처</td>
					<td>${teacher.tell }</td>
				</tr>
			</table>
			<div id="t_img">
				<c:if test="${teacher.img_path ==null }">
					<p id="no_img">이미지 준비중</p>
				</c:if>
				<c:if test="${teacher.img_path !=null }">
					<img src="${teacher.img_path }">
				</c:if>
				
			</div>
			</div>
			
			<div id="btnGroup">
				<a href="${pageContext.request.contextPath }/teacherpage/updateteacherStep1"><button>수정</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
