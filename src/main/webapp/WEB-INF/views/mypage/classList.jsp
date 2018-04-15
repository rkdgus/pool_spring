<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 수강내역 : 대구 아이티 수영장</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#leftArea {
	width: 178px !important;
}
#t, #preview_t {
	width: 100%;
	border-top: 2px solid #333333;
	border-bottom: 2px solid #333333;
}

#title_tr,#basic {
	background: #333333;
	height: 30px;
	line-height: 30px;
	color: white;
}

#title_tr td ,#basic td, .data_list td{
	text-align: center;
}

#title_tr td#title_cno, #title_level, #title_tno {
	width: 90px;
}

#title_tr td#title_day {
	width: 150px;
}

.list_tr, #no_list_tr,.data_list td {
	border-bottom: #d7d7d7 1px solid;
	cursor: pointer;
}

.list_tr:HOVER, #no_list_tr:HOVER, .data_list:HOVER {
	background-color: #d7d7d7;
}

.list_tr td, #no_list_tr td,.data_list td {
	height: 25px;
	line-height: 25px;
	text-align: center;
	font-size: 13px;
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
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		$(function() {
			$(document).on("click", ".list_tr", function() {
				var tno = $(this).find(".tno").text();
				
				
				$.ajax({
					url:"teacherInfo",
					type:"post",
					dataType:"json",
					data:{"tno":tno},
					success:function(result){
					 	console.log(result);
					 
					 		
					 		$("#teacherInfo").trigger("click");
					  	
					 		$("#preview_t").find("tr").not("#basic").remove(); 
					 		var data = "";
					 		data+="<tr class='data_list'><td>"+result.tno+"</td><td>"+result.name+"</td><td>"+result.tell+"</td></tr>";
					 		$("#preview_t").append(data);
					 	}
					
				})
				
			})
		})
	</script>
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="classListTitle.jsp" />
			<div id="main_div">
				<table id="t">
					<tr id="title_tr">
						<td id="title_cno">반번호</td>
						<td id="title_tno">강사번호</td>
						<td id="title_titme">시간</td>
						<td id="title_level">등급</td>
						<td id="title_day">개설날짜</td>
					</tr>
					<c:if test="${list.size()==0 }">
						<tr id="no_list_tr">
							<td colspan="5">수강내역이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${list !=null }">
						<c:forEach items="${list }" var="item">
							<tr class="list_tr">
								<td class="cno">${item.cno }</td>
								<td class="tno">${item.tno }</td>
								<td class="time">${item.time }</td>
								<td class="level">${item.level }</td>
								<fmt:formatDate value="${item.s_day }" pattern="yyyy-MM-dd"
									var="date" />
								<td class="date">${date }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>

				<div id="paging">
					<c:if test="${pageMaker.prev}">
						<a href="classList?page=${pageMaker.startPage-1 }"><span
							class="paginBtn">&laquo;</span></a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<a href="classList${pageMaker.makeQuery(idx) }"><span
							class="pageNum" ${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<a href="classList?page=${pageMaker.endPage+1}"><span
							class="paginBtn">&raquo;</span></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<a href="#" data-target="#modal" data-toggle="modal" style='display: none;'><button id="teacherInfo">클릭</button></a>
	<jsp:include page="../include/footer.jsp" />
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강사님 정보</h4>
					<h3 id="class_info"></h3>
				</div>
				<div class="modal-body">
					<div id="preview">
						<table id="preview_t">
							<tr id="basic">
								<td>강사번호</td>
								<td>이름</td>
								<td>연락처</td>
							</tr>
						</table>
					</div>

				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-success" data-dismiss="modal"
						value="확인" id="close">
				</div>

			</div>

		</div>
	</div>

</body>
</html>
