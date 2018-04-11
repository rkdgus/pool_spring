<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 관리자모드</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.teacherTable, .teacherTable th, .teacherTable td, .teacherTable tr {
	border: 1px solid #ccc;
	border-collapse: collapse;
}

.teacherTable {
	width: 100%;
	font-size: 15px;
	margin-top: 20px;
}

.teacherTable tr {
	height: 30px;
	border-bottom: 1px solid #ccc;
}

.teacherTr:hover {            
	background: #6799FF;
	color:white;                                                         
}
.teacherTr:hover td{                         
	color:white;                                                         
}
                
.teacherTable th {
	vertical-align: middle !important;
	background: #333333;
	color: #ccc;
	text-align: center;
}

.teacherTable td {
	color: #9a9a9a;
	text-align: center;
	height: 100px;
	vertical-align: middle !important;
}

td img{
	max-width:100%;
	max-height:100%;
}
</style>
<script type="text/javascript">
	$(function(){
		
		$(document).on("click",".teacherTr",function(){
			var no =$(this).find("td").eq(0).text();
			location.href="${pageContext.request.contextPath }/admin/teacher/read?no="+no;
		})
	})         
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<div id="header_title">
				<div id="main_title">강사관리</div>
			</div>

		

			<table class="teacherTable">
				<tr>
					<th width="50">번호</th>
					<th width="100">이름</th>
					<th width="180">전화</th>
					<th width="">직급</th>
					<th width="150">아이디</th>
					<th width="150">사진</th>                         
				</tr>
				<c:forEach items="${list }"  var="item">
					<tr class="teacherTr">
						<td>${item.tno }</td>
						<td>${item.name }</td>
						<td>${item.tell }</td>
						<td>${item.title }</td>
						<td>${item.id }</td>
						<td><img src="${pageContext.request.contextPath}/admin/displayFile?filename=${item.img_path}"></td>
					</tr>
				</c:forEach>


			</table>

		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>