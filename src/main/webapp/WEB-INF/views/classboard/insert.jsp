<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>대구 아이티 수영장 - 반별게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#content #insert_f {
	width: 100%;
	border-top: 2px solid #333333;
}

#content #insert_f table {
	width: 100%;
	border: 1px solid #d7d7d7;
}

#content #insert_f table td {
	padding: 5px;
}

#content #insert_f table td input {
	border: 1px solid #d7d7d7;
	width: 95%;
}

#content #insert_f table td textarea {
	width: 89%;
	height: 200px;
	resize: none;
	border: 1px solid #d7d7d7;
}

#content #insert_f table tr {
	border-bottom: 1px solid #d7d7d7;
}

#content #insert_f table tr td:FIRST-CHILD {
	background: #ebebeb;
}

#content #insert_f table tr:LAST-CHILD  td:FIRST-CHILD {
	padding-left: 180px;
	background: none;
}

#content #insert_f table tr:LAST-CHILD td:FIRST-CHILD input {
	width: 120px;
}

.galleyTable, .galleyTable th, .galleyTable td, .galleyTable tr {
	border: 1px solid #ccc;
	border-collapse: collapse;
}

.galleyTable {
	width: 100%;
	font-size: 15px;
	margin-top: 20px;
}

.galleyTable tr {
	height: 30px;
	border-bottom: 1px solid #ccc;
}

.galleyTable th {
	vertical-align: middle !important;
	background: #333333;
	color: #ccc;
	text-align: center;
}

.galleyTable td {
	color: #9a9a9a;
	text-align: center;
	height: 100px;
	vertical-align: middle !important;
}

.imgs {
	max-width: 360px;
	max-height: 90px;
	text-align: center;
}

#leftArea {
	width: 178px !important;
}

#add {
	width:150px !important;
	margin-top: 5px;
	height: 30px;
	border: 1px solid #5c5c5c;
	background: #fff;
	border-radius: 2px;
	outline: none;
	font-size: 13px;
	padding-left: 15px;
	padding-right: 15px;
	cursor: pointer;
	font-weight: 600;
	color:black;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<form id="insert_f" action="insert" method="post">
				<table>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td>반</td>
						<td><select name="cno">
								<option>선택</option>
								<c:forEach var="item" items="${classList }">
									<option value="${item.cno }">${item.time }/
										${item.level }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<td>이미지</td>
						<td>
							<input type="button" value="이미지추가" class="btn_admin"
							data-toggle="modal" data-target="#modal" id="add">
							<span id="imgText"></span>
							<input type="hidden" name="imgpath">
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="취소"
							id="cencelBtn"> <input type="submit" value="전송">
						</td>
					</tr>
				</table>
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
					<button onclick="fileDelete()" class="btn btn-danger">이미지삭제</button>
					<input type="file" name="fileList" multiple="multiple"
						id="fileList" style="display: none;">
					<table class="galleyTable" id="modal_table">
						<tr>
							<th width="20"><input type="checkbox" id="allCheck"></th>
							<th width="">이름</th>
							<th width="360">이미지</th>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-success" value="업로드"
						onclick="submitBtn()">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="close">Close</button>
				</div>

			</div>

		</div>
	</div>
	<script type="text/javascript">
		var index = 1;
		$(function() {
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
											.append(
													"<tr><td><input type='checkbox' class='delcheck'></td>"
															+ "<td><input type='text' name='name'></td>"
															+ "<td><img src='"+e.target.result+"' class='imgs'></td>"
															+ "</tr>");

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
		})
		function fileUpload() {
			console.log("fileUpload");
			$("#fileList").trigger('click');

		}
		function submitBtn() {
			var formData = new FormData();
			var size = $("input[name='name']").length; 
			for(var i=0; i < size; i++){
				formData.append("fileList",$("input[name='fileList']")[0].files[i]);
				formData.append("name",$("input[name='name']").eq(i).val());
			}
			$.ajax({
				url:"upload",
				data:formData,
				type:"post",
				processData:false,
				contentType:false,
				dataType:"json",
				success:function(result){
					console.log(result);
					if(result.length !=0){
						$("#imgText").text(result.length+"개 선택하였습니다.");
						$("#close").trigger("click");
						
					}
					
				}
			})
		}
	</script>
</body>
</html>