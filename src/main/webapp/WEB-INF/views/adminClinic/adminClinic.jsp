<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#main_t {
	width: 100%;
	border-top: 2px solid #333333;
	border-bottom: 3px solid #333333 !important;
}

#main_tr {
	font-size: 14px;
	color: white;
	font-weight: bold;
	background: #333333;
	height: 30px;
	line-height: 30px;
	text-align: center;
}

#main_t .tr {
	cursor: pointer;
	height: 25px;
	line-height: 25px;
	border-bottom: 1px solid #d7d7d7;
	padding: 5px;
}

#main_t .tr:HOVER {
	background-color: #d7d7d7;
}

#main_t .td {
	font-size: 13px;
	text-align: center;
}

#main_tr .bno_title {
	width: 60px;
}

#main_tr .writer_title {
	width: 80px;
}

#main_t .title {
	text-align: left !important;
}

#paging {
	margin-top: 20px;
	text-align: center;
	height: 30px;
}

.pageNum {
	width: 24px;
	height: 25px;
	line-height: 25px;
	color: black;
	display: inline-block;
	border: 1px solid #ccc;
	font-size: 14px;
}

.pageNum:HOVER {
	background: #ebebeb;
}

#active {
	background: rgb(235, 235, 235);
}

#header_title {
	margin-bottom: 20px;
}

#sel {
	width: 90px;
	height: 27px;
}
#insert_btn{
	border:1px solid #5c5c5c;
		background: #fff;
		font-size: 12px;
		outline: none;
		padding:5px 10px;
		border-radius:2px;
		margin-bottom: 5px;
}
#insert_btn:HOVER {
	background: #ebebeb;
}
</style>
<title>대구 아이티 수영장 - 수영클리닉 관리</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="../admin/side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<select id="sel">
				<option value="">전체보기</option>
				<option value="freestyle">자유형</option>
				<option value="backstroke">배영</option>
				<option value="breaststroke">평영</option>
				<option value="butterfly">접영</option>
				<option value="startAndTrun">스타트 & 턴</option>
			</select>
			<button id="insert_btn">클리닉 추가하기</button>
			<table id="main_t">
				<tr id="main_tr">
					<td class='bno_title'>번호</td>
					<td class="title_title">제목</td>
					<td class="writer_title">타입</td>
				</tr>
				<c:if test="${lists.size() !=0 }">
					<c:forEach var="item" items="${lists }">
						<tr class="tr">
							<td class="td bno">${item.clinic_no}</td>
							<td class="td title">${item.clinic_title }</td>
							<td class="td writer">${item.clinic_type }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div id="paging">
				<c:if test="${pageMaker.prev}">
					<a href="qna?page=${pageMaker.startPage-1 }"><span
						class="paginBtn">&laquo;</span></a>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<a href="qna${pageMaker.makeQna(idx) }"><span class="pageNum"
						${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a href="qna?page=${pageMaker.endPage+1}"><span
						class="paginBtn">&raquo;</span></a>
				</c:if>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(document).on("click", ".tr", function() {
				var no = $(this).find(".bno").text();
				location.href = "read?no="+no;
			})
			$("#insert_btn").click(function() {
				location.href = "insert";
			})
		})
	</script>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>