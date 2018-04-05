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
		min-height: 400px;
	}
	#container #content{
		width:730px;
		height:728px;
		float:right;
	}
	#container #content #classboard_table table{
		width:730px;
		font-size:15px;
	}
	#container #content #classboard_table table tr{
		line-height:30px;
		height:30px;
		border-bottom:1px solid #ccc;
	}
	#container #content #classboard_table table th{
		background: #333333;
		color:#ccc;
	}
	#container #content #classboard_table table td{
		color:#9a9a9a;
		text-align: center;
	}
	#container #content #classboard_table table td.title{
		text-align:left;
	}
	#container #content #classboard_table table th,#container #content #classboard_table table td{
		line-height:30px;
		height:30px;
	}
	#container #content #classboard_table table #paging_tr{
		margin:15px 0;
		height:69px;
		line-height: 69px;	
		border-top:2px solid #333333;
		border-bottom:none;
	}
	#paging{
		height:39px !important;
		line-height: 69px !important;
	}
	#container #content #classboard_table table #search_tr{
		margin:15px 0;
		height:40px;
		border-bottom:none;
		background:rgb(235, 235, 235);
		line-height: 40px;	
	}
	#search_wrap{
		height:40px;
		line-height: 40px;
	}
	#search_wrap label{
		font-size:13px;
	}
	#search_wrap input[type='radio']{
		line-height: 1px;
	}
	.pageNum{
		width:24px;
		height:25px;
		line-height: 25px;
		display: inline-block;
		border:1px solid #ccc;
		cursor: pointer;
	}
	.paginBtn{
		width:15px;
		line-height: 13px;
		height:14px;
		display: inline-block;
		background: #ccc;
		color:#fff;
	}
	.search_img{
		vertical-align: middle;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<div id="classboard_table">
				<table>
					<tr>
						<th width="50">번호</th>
						<th width="460">제목</th>
						<th width="80" >작성자</th>
						<th width="60">조회수</th>
						<th width="80">작성일</th>
					</tr>
					<tr>
						<td>1</td>
						<td class="title">2</td>
						<td>3</td>
						<td>4</td>
						<td>4</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="title">2</td>
						<td>3</td>
						<td>4</td>
						<td>4</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="title">2</td>
						<td>3</td>
						<td>4</td>
						<td>4</td>
					</tr>
					<tr id="paging_tr">
						<td colspan="5">
							<div id="paging">
								<span class="paginBtn">&laquo;</span>
								<span class="pageNum">5</span>
								<span class="pageNum">5</span>
								<span class="pageNum">5</span>
								<span class="paginBtn">&raquo;</span>
							</div>
						</td>
					</tr>
					<tr id="search_tr">
						<td colspan="5">
							<form id="search_wrap">
								<input id="smode_subject" name="smode" type="radio" value="titleandcontent" checked="checked">
								<label for="smode_subject">제목+본문</label>
								<input id="smode_author" name="smode" type="radio" value="title">
								<label for="smode_author">제목</label>
								<input id="search_writer" type="radio" name="smode" value="writer">
								<label for="search_writer">작성자</label>
								<img src="${pageContext.request.contextPath}/resources/img/search_img.png" class="search_img">
								<input type="text" name="search">
								<img src="${pageContext.request.contextPath}/resources/img/btn_search.gif" class="search_img">
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>