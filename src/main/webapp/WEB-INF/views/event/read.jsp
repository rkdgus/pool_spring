<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/common.css">
<title>대구 아이티 수영장 - 공지게시판</title>
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
	width:50%;
}

.updateImg {
	padding-right: 30px;
}
.wrap_content{
	display:block;
	width:100%;
	min-height:300px !important;                                                                     
}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/reset.css">

</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<div id="read_table">
				<table>
					<tr>
						<th colspan="4">${vo.title }</th>
					</tr>
					<tr>
						<td colspan="2">
							작성자: 관리자
						</td>
						<td colspan="2" class="align_right">
						<fmt:formatDate value="${vo.regdate }" var="regdate" pattern="yyyy-MM-dd"/>
							조회: ${vo.readcnt } 등록일: ${regdate }
						</td>
					</tr>
					<tr>
						<td colspan="4" class="wrap_content">

								<c:forEach var="img" items="${imgArr }">
									<img src="${img}" class="imgs">	
								</c:forEach>

							<p class="read_content">
								${vo.content }
							</p>
						</td>
					</tr>
					<tr id="btn_tr">
						<td colspan="4" class="align_right">
							<a href="${pageContext.request.contextPath}/event/${pageMaker.makeSearch(pageMaker.cri.page)}"><button>목록</button></a>
							<c:if test="${login.title=='사장' }">
								<a href="${pageContext.request.contextPath }/event/modify${pageMaker.makeSearch(pageMaker.cri.page)}&nno=${vo.nno}"><button>수정</button></a>
								<a href="#"><button id="boardRemoveBtn">삭제</button></a>
							</c:if>
							
						</td>
					</tr>
				</table>
			</div>                                      
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
<script>
	$(function(){
		$(".updateImg").parent().click(function(e){
			e.preventDefault();
		})
		$(".updateImg").click(function(){
			if($(this).parent().next().css("display")=="none"){
				$(this).parent().next().css("display","block");
			}else{
				$(this).parent().next().css("display","none");
			}
		})           
		$("#boardRemoveBtn").click(function(){
			if(confirm("게시글을 삭제하시겠습니까?")){
				location.href="${pageContext.request.contextPath }/event/delete?nno="+${vo.nno};        
			}
		})
	})
</script>	
</body>
</html>