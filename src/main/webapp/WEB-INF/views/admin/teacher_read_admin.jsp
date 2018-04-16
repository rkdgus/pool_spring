<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 관리자모드</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.teacherTable, .teacherTable th, .teacherTable td, .teacherTable tr {
	border: 1px solid #ccc;
	border-collapse: collapse;
}
#content{
	overflow: hidden;
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
#modal_table{
	margin:0 auto;           
}
#modal_table td img{
	max-width:100%;                     
	max-height:100%;
	
}
#add{                   
	vertical-align: middle !important;
	
}
.wrap_add{
	border-left:0px solid white !important;                                                    
}
.wrap_img{
	border-right:0px solid white !important;
}
#wrap_submit{

	clear:both;          
	display:block;
	width:100%;        
	text-align: center;      
}
#wrap_submit input{
	margin-top:30px;          
	width:200px;
	height:50px;
}
textarea{
	width:100% !important;                               
	height:100%;
}
.btn_admin{
	padding: 5px;
    background: #175c85;
    color: white;
    font-weight: bold;
    text-decoration: none;
    border: none;               
}
.btn_admin:hover{
	background: #373e6a;	
	text-decoration: none;           
	color: white;
}
#info_table{
	height:600px;
	float: left;  
}
#left_table{
float: left;  
}
</style>
<script type="text/javascript">
	$(function(){
		var index = 1;
		$("#sel").val("${vo.title }");
		
	/* 	$("#sel").change(function(){
			alert($(this).val());
			$("#selval").val($(this).val());
		}) */
		
		                                 
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
		
		                           
	               
	})    
	
	function fileUpload() {
		console.log("fileUpload");

		$("#fileList").trigger('click');

	}
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
			<a href="" class="btn_admin">리스트보기</a>
		<form action="read" method="post" enctype="multipart/form-data" id="f1">

			<table class="teacherTable" id="left_table">
				<tr>
					<th width="100">번호</th>
					<td colspan="2">${vo.tno }<input type="hidden" value="${vo.tno }" name="tno"/></td>
				</tr>
				<tr>
					<th width="100">이름</th>
					<td colspan="2">${vo.name }<input type="hidden" value="${vo.name }" name="name"/></td>
				</tr>
				<tr>
					<th width="100">아이디</th>
					<td colspan="2">${vo.id }<input type="hidden" value="${vo.id }" name="id"/></td>
				</tr>
				<tr>
					<th width="100">전화</th>
					<td colspan="2"><input type="tel" value="${vo.tell }" name="tell"/></td>
				</tr>
				<tr>
					<th width="100">직급</th>
					<td colspan="2">
						<select id="sel" name="title">
							<option>사원</option>                        
							<option>대리</option>	                              
							<option>과장</option>	
							<option>차장</option>	                 
							<option>부장</option>	
							<option>팀장</option>	
							<option>사장</option>
							<option>퇴사</option>							
						</select>
						<%-- <input type="hidden" value="${vo.title }" name="title" id="selval"/> --%>
					</td>
				</tr>
				<tr>
					<th width="100">사진</th>
					<td class="wrap_img">
						<img src="${vo.img_path}" id="teacherImg">
						<input type="file" name="fileList"
							id="fileList" style="display: none;">           
					</td> 
					<td width="50" class="wrap_add">
						<input data-toggle="modal" data-target="#modal" id="add" type="button" class="btn_admin" value="사진변경">
					</td>                                      
				</tr>
			</table>
			
			<table class="teacherTable" id="info_table">
				
				<tr>
					<th width="100">정보</th>
					<td><textarea rows="" cols="" name="info" id="info">${vo.info }</textarea></td>
				</tr>
				
			</table>
			<div id="wrap_submit">
				<input type="submit" value="수정" class="btn_admin">
			</div>
		
		</form>	

		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	
	
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">갤러리업로드</h4>
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