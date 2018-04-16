<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 : 마이페이지 : 개인정보 수정 : 대구 아이티 수영장</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#main_div #title_info {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 10px;
}

#main_div #change_t {
	width: 100%;
	border-top: 2px solid #333333;
	font-size: 13px;
}

#main_div #change_t tr {
	border-bottom: 1px solid #d7d7d7;
	height: 25px;
	line-height: 25px;
}

#main_div #title_info #mark {
	font-size: 12px;
}

#main_div #t tr {
	border-bottom: 1px solid #d7d7d7;
	height: 25px;
	line-height: 25px;
}
#main_div #t tr td{
	color:gray;
}
#main_div #t tr td, #main_div #change_t tr td {
	padding: 6px 0px 6px 10px;
}

#main_div #change_t tr td input {
	width: 100px;
}

#main_div #t .title_td {
	width: 120px;
	background: #ebebeb;
	color: black;
}

#main_div #change_t .title_td {
	width: 120px;
	background: #ebebeb;
	color: black;
	vertical-align: top;
}

#t {
	width: 100%;
	border-top: 2px solid #333333;
	font-size: 13px;
}

#changeInfo {
	margin-top: 20px;
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 10px;
}

#changeInfo #mark{
	font-size: 12px;
}
#btnGroup {
	margin-top: 10px;
	text-align: right;
}

#btnGroup a {
	display: inline-block;
}

#btnGroup a button {
	border: 1px solid #5c5c5c;
	background: #fff;
	font-size: 12px;
	outline: none;
	padding: 5px 10px;
	border-radius: 2px;
	color: black !important;
}

#btnGroup a button:HOVER {
	background: #ebebeb;
}

#img_td img {
	width: 140px;
	height: 140px;
}

#img_td  button {
	border: 1px solid #5c5c5c;
	background: #fff;
	font-size: 12px;
	outline: none;
	border-radius: 2px;
}

#img_td  button:HOVER {
	background: #ebebeb;
}

#img_btn {
	vertical-align: top;
}
#modal_table{
	margin:0 auto;           
}
#modal_table td img{
	max-width:100%;                     
	max-height:100%;
}
#leftArea {
	width: 178px !important;
}
           
.teacherTable {
	width: 48%;
	font-size: 15px;
	margin-top: 20px;       
	margin-left:10px; 
	       
}          

.teacherTable tr {
	height: 30px;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-left:1px solid #ccc;
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
#teacherImg{
	max-width:100%;
	max-height:100%;
	display: inline-block;
}	
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
	$(function(){
		var index = 1;
	                                 
		$(document)
		.on(
				"change",
				"#fileList",
				function() {
					$("#modal_table td").parent("tr").remove();
					var file = document.getElementById("fileList");

					var reader = new FileReader();
					reader.onload = function(e) {

						$("#modal_table")
								.append("<tr><td><img src='"+e.target.result+"' class='imgs'></td>");

					}
					reader.readAsDataURL(file.files[0]);

					reader.onloadend = function(e) {
						if (index >= file.files.length) {
							index = 1;
							return;
						}
						reader.readAsDataURL(file.files[index]);
						index += 1;
					}
				})
		$(document)
		.on("click","#upload",function(){
			var file = document.getElementById("fileList");
			var reader = new FileReader();
			reader.onload = function(e) {

				$("#teacherImg").attr("src",e.target.result);
				

			}
			reader.readAsDataURL(file.files[0]);

			reader.onloadend = function(e) {
				if (index >= file.files.length) {
					index = 1;
					return;
				}
				reader.readAsDataURL(file.files[index]);
				index += 1;
			}
		})
				
		$("#add").click(function() {
			$("#modal_table td").parent("tr").remove();
		})
		
		$("#updateBtn").click(function(){
			
			if($("#tell1").val()==""||$("#tell2").val()==""||$("#tell3").val()==""){
				alert("연락처를 모두 입력하세요");
				return;
			}
			
			var phone = $("#tell1").val()+"-"+$("#tell2").val()+"-"+$("#tell3").val();
			$("#tell").val(phone);
			$("#f").submit();
			alert("수정되었습니다");
			
		})
		                           
	               
	})    
	
	function fileUpload() {
		console.log("fileUpload");

		$("#fileList").trigger('click');

	}
	
	</script>
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="updateTitle.jsp" />
			<div id="main_div">

				<p id="title_info">
					<span id="mark">■</span>기본정보
				</p>
				<table id="t">
					<tr>
						<td class="title_td">강사번호</td>
						<td>${teacher.tno }</td>
					</tr>
					<tr>
						<td class="title_td">이름</td>
						<td>${teacher.name }</td>
					</tr>
					<tr>
						<td class="title_td">직급</td>
						<td>${teacher.title }</td>
					</tr>
				</table>


				<p id="changeInfo">
					<span id="mark">■</span>변경가능 정보
				</p>
				
			
					<table id="change_t">
					<tr>
						<td class="title_td">연락처</td>
						<td><input type="text" id="tell1"> - <input
							type="text" id="tell2"> - <input type="text" id="tell3">
						</td>
					</tr>
					<tr>
						<td class="title_td">이미지</td>
						<td id="img_td"><img src="${teacher.img_path }" id=teacherImg>
							<button id="img_btn" data-toggle="modal" data-target="#modal">이미지 변경</button></td>
					</tr>
					
					
				</table>
				<form id="f" action="updateTeacher" method="post" enctype="multipart/form-data" >
				 <input type="file" name="fileList"
							id="fileList" style="display: none;">   
				<input type="hidden" name="tell" id="tell">
				<input type="hidden" name="tno" value="${teacher.tno }">
				</form>
				
			</div>
			<div id="btnGroup">
				<a href="#" id="updateBtn"><button>수정</button></a> <a
					href="${pageContext.request.contextPath }/teacherpage/updateteacherStep1"><button>취소</button></a>
			</div>
		</div>
		<script>
			var tell = "${teacher.tell}";
			$("#tell1").val(tell.substring(0, tell.indexOf("-")));
			$("#tell2").val(
					tell
							.substring(tell.indexOf("-") + 1, tell
									.lastIndexOf("-")));
			$("#tell3").val(tell.substr(tell.lastIndexOf("-") + 1));
		</script>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">이미지 업로드</h4>
				</div>


				<div class="modal-body">

					<button onclick="fileUpload()" class="btn btn-primary">이미지추가</button>

						
						<table class="teacherTable" id="modal_table">
							<tr>
								<th>이미지</th>
							</tr>
						</table>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-success" value="업로드" id="upload" data-dismiss="modal">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>

		</div>
	</div>
	
</body>
</html>
