<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 : 강의내역 : 대구 아이티 수영장</title>
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
	#main_t table,#preview_t{
		width:100%;
		border-top: 2px solid #333333;
		border-bottom: 2px solid #333333;
	}
	#title_tr, #basic{
		background: #333333;
		height: 30px;
		line-height: 30px;
		color:white;	
	}
	#title_tr td,#basic td{
		text-align: center;
	}
	#title_cno{
		width:100px;
	}
	#title_level{
		width:70px;
	}
	#title_classmate{
		width:75px;
	}
	#title_day{
		width:140px;
	}
	#title_reclass{
		width:100px;
	}
	#noClass{
		font-size: 13px;
		text-align: center;
	}
	#main_t table .list, .m_list{
		height:25px;
		line-height: 25px;
		text-align: center;
		font-size: 13px;
	}
	#main_t table .list_tr, #no_list, .m_list{
	border-bottom: #d7d7d7 1px solid;
	height: 25px;
	line-height: 25px;
	cursor: pointer;
	}
	#main_t table .list_tr:HOVER, #main_t table #no_list:HOVER , .m_list:HOVER{
	background-color: #d7d7d7;
	}
		#paging{
	margin-top:20px;
	text-align: center;
	height:30px;
	
}

.pageNum{
	width:24px;
	height:25px;
	line-height:25px;
	color:black;
	display: inline-block;
	border:1px solid #ccc;
	font-size: 14px;
}
.pageNum:HOVER {
	background: #ebebeb;
}
#active{
	background: rgb(235, 235, 235);
}
#preview{
	max-height: 200px;
	overflow: auto;
}
.modal-title{
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		$(function(){
			$(document).on("click",".list_tr",function(){
				var cno = $(this).find(".cno").text();
				 var time = $(this).find(".time").text();
				var level = $(this).find(".level").text();
				var classmate = $(this).find(".classmate").text();
				var date = $(this).find(".date").text(); 
				
				$.ajax({
					url:"registerStudent",
					type:"post",
					dataType:"json",
					data:{"cno":cno},
					success:function(result){
					 	console.log(result);
					 	if(result.length==0){
					 		alert("수강한 학생이 없습니다");
					 		return;
					 	}else{
					 		
					 		$("#stdList").trigger("click");
					  	$("#class_info").html(cno+" : "+time + " : "+level+" : "+date +" : "+"인원  - "+(result.length)+"/"+classmate); 
					 		$("#preview_t").find("tr").not("#basic").remove(); 
					 		var data = "";
					 		for(var i=0;i<result.length;i++){
					 			data+="<tr class='m_list'><td>"+result[i].mno+"</td>";
					 			data+="<td>"+result[i].name+"</td>";
					 			data+="<td>"+result[i].gender+"</td>";
					 			data+="<td>"+result[i].age+"</td>";
					 			data+="<td>"+result[i].tell+"</td></tr>";
					 		} 
					 		$("#preview_t").append(data);
					 		
					 	}
					}
				})
			})
		})
	</script>
		<div id="container">
			<jsp:include page="side.jsp"/>
			<div id="content">
				<jsp:include page="classTitle.jsp"/>
				<div id="main_t">
					<table id="t">
						<tr id="title_tr">
							<td id="title_cno">강의번호</td>
							<td id="title_time">강의시간</td>
							<td id="title_level">등급</td>
							<td id="title_classmate">총인원</td>
							<td id="title_day">개설날짜</td>
							<td id="title_reclass">재개설</td>
						</tr>
						<c:if test="${list.size()==0 }">
							<tr id="no_list">
								<td colspan="6" id="noClass" class="list">강의내역이 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${list !=null }">
							<c:forEach items="${list }" var="item">
								<tr class="list_tr">
									<td class="list cno">${item.cno }</td>
									<td class="list time">${item.time }</td>
									<td class="list level">${item.level }</td>
									<td class="list classmate">${item.classmate }</td>
									<fmt:formatDate value="${item.s_day }" pattern="yyyy-MM-dd" var="date" />
									<td class="list date">${date}</td>
									<c:if test="${item.reclass ==false }">
										<td class="list">X</td>
									</c:if>
									<c:if test="${item.reclass ==true }">
										<td class="list">O</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div id="paging">
				<c:if test="${pageMaker.prev}">
					<a href="teacherClass?page=${pageMaker.startPage-1 }"><span
						class="paginBtn">&laquo;</span></a>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<a href="teacherClass${pageMaker.makeQuery(idx) }"><span class="pageNum"
						${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a href="teacherClass?page=${pageMaker.endPage+1}"><span
						class="paginBtn">&raquo;</span></a>
				</c:if>
			</div>
			</div>
		</div>
		<a href="#" data-target="#modal" data-toggle="modal" style='display: none;'><button id="stdList">클릭</button></a>
	<jsp:include page="../include/footer.jsp" />
	
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수강학생 리스트</h4>
					<h3 id="class_info"></h3>
				</div>
				<div class="modal-body">
					<div id="preview">
						<table id="preview_t">
							<tr id="basic">
								<td>학생번호</td>
								<td>이름</td>
								<td>성별</td>
								<td>생년월일</td>
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
