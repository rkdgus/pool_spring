<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/reset.css">
<title>Insert title here</title>
<style>
	#container{
		min-height: 788px;
		padding:30px;
		overflow: hidden;
	}
	#container #content{
		width:730px;
		height:728px;
		
		float:right;
	}
	#container #content #classboard_table table{
		width:730px;
		border:1px solid black;
	}
	#container #content #classboard_table table tr{
		line-height:30px;
		height:30px;
	}
	#container #content #classboard_table table th,#container #content #classboard_table table td{
		border:1px solid black;
		line-height:30px;
		height:30px;
	}
</style>
</head>
<body>
	<jsp:include page="include/header.jsp"/>
	<div id="container">
		<jsp:include page="include/side.jsp" />
		<div id="content">
			<h3>클래스 게시판</h3>
			<div id="classboard_table">
				<table>
					<tr>
						<th width="50">1</th>
						<th width="460">1</th>
						<th width="80" >1</th>
						<th width="60">1</th>
						<th width="80">1</th>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>4</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>4</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>4</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="include/footer.jsp"/>
</body>
</html>