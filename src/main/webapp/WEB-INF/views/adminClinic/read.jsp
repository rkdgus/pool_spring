<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 수영클리닉 관리</title>
<style>
#container #content #read_table table {
	width: 730px;
	font-size: 15px;
}

#container #content #read_table table tr {
	line-height: 30px;
	height: 30px;
	border-bottom: 1px solid #ccc;
}
table{
		font-size:13px !important;
	}
#container #content #read_table table th, #container #content #read_table table td
	{
	padding: 5px 0px 5px 10px;
}

#container #content #read_table table th {
	border-top: 2px solid #333333;
	background: #ebebeb;
	color: #333333;
	text-align: left;
	font-weight: bold;
}

.align_right {
	text-align: right;
}

#btn_tr {
	border: none !important;
}

#btn_tr td a button {
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 2px;
}

.imgs {
	display:block;
	min-width: 200px;
	min-height: 100px;
	max-width: 100%;
	max-height: 500px;
}

#reply_title {
	border-top: 2px solid #333333;
	background: #ebebeb;
}

#read_count {
	font-weight: bold;
}

.hidden_btn {
	display: none;
}

.hidden_btn button {
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 2px;
	margin-right: 10px;
}

.align_right {
	text-align: right;
}

.updateImg {
	padding-right: 30px;
}

#reply_insert {
	margin: 30px auto;
	width: 550px;
	height: 30px;
}

#reply_insert textarea {
	width: 500px;
	height: 36px;
	resize: none;
	padding: 0;
	float: left;
	line-height: 36px;
}

#reply_insert img {
	float: left;
	cursor: pointer;
}
.reply_update_div{
	display: none;
}
.reply_replytext_update{
	padding:3px;
	width:80%;   
}
.reply_replytext_update_btn{
	background: #fff;
	border: 1px solid #ccc;
    border-radius: 2px;
}
#title_header{
	overflow:hidden;
}
#clinic_type{
	padding-right:5px;
	float:right;
}
</style>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/common/reset.css">

</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="../admin/side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
		
			<div id="read_table">
				<table>
					<tr>
						<th colspan="4" id="title_header">${vo.clinic_title }<span id="clinic_type">타입 :
						<c:if test="${vo.clinic_type =='freestyle' }">
							자유형
						</c:if>
						<c:if test="${vo.clinic_type =='backstroke' }">
							배형
						</c:if>
						<c:if test="${vo.clinic_type =='breaststroke' }">
							평영
						</c:if>
						<c:if test="${vo.clinic_type =='butterfly' }">
							접영
						</c:if>
						<c:if test="${vo.clinic_type =='startAndTrun' }">
							스타트 & 턴
						</c:if>
						</span></th>
					</tr>
					<c:if test="${imgArr !=null }">
						<tr>
						<td colspan="4">
							<c:forEach var="img" items="${imgArr }">
								<img src="displayFile?filename=${img}" class="imgs">
							</c:forEach>
						</tr>	
					</c:if>
					<tr>
						<td colspan="4">
							<p class="read_content">${vo.clinic_content }</p>
						</td>
					</tr>
					<tr id="btn_tr">
						<td colspan="4" class="align_right"><a
							href="adminClinic${pageMaker.makeSearch(pageMaker.cri.page)}"><button>목록</button></a> <a
							href="${pageContext.request.contextPath }/adminClinic/modify${pageMaker.makeSearch(pageMaker.cri.page)}&no=${vo.clinic_no}" class="notauthority"><button>수정</button></a>
							<a href="#" class="notauthority"><button id="boardRemoveBtn">삭제</button></a></td>
					</tr>	
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script>
		$(function() {
			window.scrollBy(0,80);
			$(document).on("click", ".aimg", function(e) {
				e.preventDefault();
			})
			
			$("#boardRemoveBtn")
					.click(
							function() {
								if (confirm("게시글을 삭제하시겠습니까?")) {
									location.href = "${pageContext.request.contextPath }/adminClinic/remove?no=${vo.clinic_no}";
								}
							})
		})
	</script>
</body>
</html>