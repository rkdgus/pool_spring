<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

#main_t table, #preview_t {
	width: 100%;
	border-top: 2px solid #333333;
	border-bottom: 2px solid #333333;
}

#title_tr, #basic {
	background: #333333;
	height: 30px;
	line-height: 30px;
	color: white;
}

#title_tr td, #basic td {
	text-align: center;
}

#title_cno {
	width: 100px;
}

#title_level {
	width: 70px;
}

#title_classmate {
	width: 75px;
}

#title_day {
	width: 140px;
}

#title_reclass {
	width: 100px;
}

#noClass {
	font-size: 13px;
	text-align: center;
}

#main_t table .list, .m_list {
	height: 25px;
	line-height: 25px;
	text-align: center;
	font-size: 13px;
}

#main_t table .list_tr, #no_list, .m_list {
	border-bottom: #d7d7d7 1px solid;
	height: 25px;
	line-height: 25px;
	cursor: pointer;
}

#main_t table .list_tr:HOVER, #main_t table #no_list:HOVER, .m_list:HOVER
	{
	background-color: #d7d7d7;
}



td.checktd{
	text-align: center;
	font-size:14px;
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

#preview {
	max-height: 200px;
	overflow: auto;
}

#main_t table .list, .m_list {
	height: 25px;
	line-height: 25px;
	text-align: center;
	font-size: 13px;
}
#basic td{   
	width:30px;
	border-right:1px solid #fff;
}

#main_t table .list_tr, #no_list, .m_list {
	border-bottom: #d7d7d7 1px solid;
	height: 25px;
	line-height: 25px;
	cursor: pointer;
}

#main_t table .list_tr:HOVER, #main_t table #no_list:HOVER, .m_list:HOVER
	{
	background-color: #d7d7d7;
}
#trname{
	width:100px !important;
}
.trname{
	font-weight: bold;
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="attendanceTitle.jsp" />
			<select id="sel">
				<option value="to">현재현황</option>
				<option value="not">이전정보</option>
			</select>
			<div id="main_t">
				<table id="t">
					<tr id="title_tr">
						<td id="title_cno">강의번호</td>
						<td id="title_time">강의시간</td>
						<td id="title_level">등급</td>
						<td id="title_classmate">총인원</td>
						<td id="title_day">개설날짜</td>
					</tr>
					<c:if test="${lists.size()==0 }">
						<tr id="no_list">
							<td colspan="6" id="noClass" class="list">강의내역이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${lists !=null }">
						<c:forEach items="${lists }" var="item">
							<tr class="list_tr">
								<td class="list cno">${item.cno }</td>
								<td class="list time">${item.time }</td>
								<td class="list level">${item.level }</td>
								<td class="list classmate">${item.classmate }</td>
								<fmt:formatDate value="${item.s_day }" pattern="yyyy-MM-dd"
									var="date" />
								<td class="list date">${date}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div id="paging">
				<c:if test="${pageMaker.prev}">
					<a href="adminClinics?page=${pageMaker.startPage-1 }"><span
						class="paginBtn">&laquo;</span></a>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<a href="adminClinic${pageMaker.makeQuery(idx) }"><span
						class="pageNum" ${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a href="adminClinic?page=${pageMaker.endPage+1}"><span
						class="paginBtn">&raquo;</span></a>
				</c:if>
			</div>
			<a href="#" data-target="#modal" data-toggle="modal" 
				style='display: none;'><button id="stdList" class="btn btn-info btn-lg">클릭</button></a>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수강학생 리스트</h4>
					<h3 id="class_info"></h3>
				</div>
				<div class="modal-body">
					<div id="preview">
						<table id="preview_t">
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
	<script type="text/javascript">
		$(function() {
			$("#sel").change(function(){

				$.ajax({
					url:"list",
					type:"get",
					data:{"search":$(this).val(),"tno":"${login.tno}"},
					dataType : "json",
					success : function(json) {
						console.log(json);
						$("#t").find("tr").not("#title_tr").remove();
						if(json.length ==0){
							var tr = "<tr id='no_list'><td colspan='6' id='noClass' class='list'>강의내역이 없습니다</td></tr>"
						}else{
							for(var i=0; i< json.length; i++){
								var tr = "<tr class='list_tr'>";
								var td_cno = "<td class='list cno'>"+json[i].cno+"</td>";
								var td_time ="<td class='list time'>"+json[i].time +"</td>"; 
								var td_level = "<td class='list level'>"+json[i].level+"</td>";
								var td_classmate = "<td class='list classmate'>"+json[i].classmate +"</td>"; 
								var date = new Date(json[i].s_day);
		                        var dateStr = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
								var td_date ="<td class='list date'>"+dateStr+"</td>";
								tr += td_cno +td_time +td_level +td_classmate +td_date + "</tr>";
								$("#t").append(tr);
							}
						}
					}
				})
			})
			$(document).on("click",".list_tr",function(){
				var cno = $(this).find(".cno").text();

				$.ajax({
					url : "read",
					type : "get",
					data : {
						"cno" : cno
					},
					dataType : "json",
					success : function(json) {
						
						console.log(json);
						$("#preview_t").find("tr").remove(); 
						
						if(Object.keys(json).length >1){
							$("#stdList").trigger("click");
							var data = "<tr id='basic'>";
							data +="<td id='trname'>이름</td>"
							for(var i=0; i<json.days.length; i++){
								data += "<td>"+json.days[i]+"</td>";
							}
							data +="<tr>";
							for(var i=1; i<Object.keys(json).length; i++){
								var key = "list"+i;
								data +="<tr>";
								data +="<td class='trname'>"+json[key][0]+"</td>";
								for(var j = 1; j < json[key].length; j++){
									if(json[key][j] ==null){
										data += "<td class='checktd'>X</td>";
											
									}else{
										
										data += "<td class='checktd'>O</td>";
									}

								}
								data +="</tr>";
								
							}
							$("#preview_t").append(data);
						}else{
							alert("수강된 학생이 없습니다.");
						}

					}
				})
			})
		})		
	</script>
</body>
</html>