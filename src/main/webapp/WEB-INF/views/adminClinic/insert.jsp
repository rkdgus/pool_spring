<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>대구 아이티 수영장 - 수영클리닉 관리</title>
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

table {
	font-size: 13px !important;
}

#content #insert_f table td {
	padding: 5px;
}

#content #insert_f table td input {
	border: 1px solid #d7d7d7;
	width: 95%;
}

#content #insert_f table td:FIRST-CHILD {
	padding-left: 20px;
	width: 200px;
}

#content #insert_f table td textarea {
	width: 95%;
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

#btnWrap {
	background: none;
	border: none;
	margin-top: 10px;
	text-align: right;
}

#insert_select {
	width: 120px;
}

#btnWrap input {
	width: 130px;
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
	color: black;
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
	width: 120px !important;
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
	color: black;
}

.hiddenSpan {
	display: none;
}

#content h2 {
	font-weight: bold;
	font-size: 13px;
	margin-bottom: 8px;
}

#insert_f table {
	font-size: 13px !important;
}

#ver {
	vertical-align: top;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="../admin/side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<input type="hidden" value="${cno }" id="cno">
			<h2>
				<span class="mark22">■</span> 수영클리닉 관리 추가
			</h2>
			<form id="insert_f" action="insert" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="clinic_title"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td>
							<select id="sel">
								<option value="noSelect">선택</option>
								<option value="freestyle">자유형</option>
								<option value="backstroke">배영</option>
								<option value="breaststroke">평영</option>
								<option value="butterfly">접영</option>
								<option value="startAndTrun">스타트 & 턴</option>
							</select>
						</td>
					</tr>
					<tr>
						<td id="ver">내용</td>
						<td><textarea name="content" id="insert_content"></textarea></td>
					</tr>
					<tr>
						<td>이미지</td>
						<td><input type="button" value="이미지추가" class="btn_admin"
							data-toggle="modal" data-target="#modal" id="add"> <span
							id="count"></span></td>
					</tr>
				</table>
				<div id="btnWrap">
					<input type="button" value="취소" id="cencelBtn"> <input
						type="button" value="추가" onclick="submitBtn()">
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
					<button onclick="fileDelete()" class="btn btn-danger">이미지삭제</button>
					<input type="file" name="fileList" multiple="multiple"
						id="fileList" style="display: none;">
					<table class="galleyTable" id="modal_table">
						<tr>
							<th width="20"><input type="checkbox" id="allCheck"></th>
							<th width="360">이미지</th>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-success" value="업로드"
						onclick="modalset()">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="close">Close</button>
				</div>

			</div>

		</div>
	</div>
	<script type="text/javascript">
		var index = 1;
		var filesArr = {};
		var previewIndex = 0;
		var deleteIndex = 0;
		window.scrollBy(0, 80);
		$(function() {
			$(document).on(
					"click",
					"#close",
					function() {
						$("#count").text(
								" " + Object.keys(filesArr).length
										+ "개가 선택 되었습니다.");
					})
			$("#allCheck").change(function() {
				if ($("#allCheck").is(":checked")) {
					$(".delcheck").attr("checked", "checked");
				} else {
					$(".delcheck").removeAttr("checked");
				}
			})
			$("#cencelBtn").click(function() {
				if (confirm("글 작성을 취소하시겠습니까?")) {
					var cno = $("#cno").val();
					location.href = "adminClinic";
				}
			})
			$(document)
					.on(
							"change",
							"#fileList",
							function() {
								$("#modal_table td").parent("tr").remove();
								var file = document.getElementById("fileList");
								var reader = new FileReader();

								reader.onload = function(e) {
									var imgNum = previewIndex++;
									var f = file.files[index - 1];

									$("#modal_table")
											.append(
													"<tr><td><input type='checkbox' class='delcheck'></td>"
															+ "<td><img src='"+e.target.result+"' class='imgs'><span class='hiddenSpan'>"
															+ imgNum
															+ "</span></td>"
															+ "</tr>");

									filesArr[imgNum] = f;
								};
								reader.readAsDataURL(file.files[0]);

								reader.onloadend = function(e) {
									if (index >= file.files.length) {
										index = 1;
										return;
									}
									reader.readAsDataURL(file.files[index]);
									index += 1;
								}
							});
		})
		function fileUpload() {
			console.log("fileUpload");
			filesArr = {};
			$("#fileList").trigger('click');
		}

		function submitBtn() {
			var formData = new FormData();

			for (var i = 0; i < Object.keys(filesArr).length + deleteIndex; i++) {
				formData.append("fileList", filesArr[i]);
				formData.append("name", $("input[name='name']").eq(i).val());
			}
			
			var clinic_type = $("#sel").val();
			var clinic_title = $("#clinic_title").val();
			var c = $("#insert_content").val();
			var clinic_content = c.replace(/(?:\r\n|\r|\n)/g, '<br />');

			if (clinic_type == "noSelect") {
				alert("타입을 선택해주세요");
				return false;
			} else if (clinic_title == "") {
				alert("제목을 입력해주세요");
				return false;
			} else if (clinic_content == "") {
				alert("내용을 입력해주세요");
				return false;
			}

			formData.append("clinic_type", clinic_type);
			formData.append("clinic_title", clinic_title);
			formData.append("clinic_content", clinic_content);
			$.ajax({
				url : "insert",
				data : formData,
				type : "post",
				processData : false,
				contentType : false,
				dataType : "text",
				success : function(result) {
					alert("글 작성에 성공하였습니다.");
					location.href = "adminClinic";
				}
			})
		}
		function fileDelete() {
			$(".delcheck").each(
					function(i, obj) {
						if ($(obj).is(":checked")) {
							var imgNum = $(obj).closest("tr").find(
									".hiddenSpan").text();
							console.log(imgNum);
							delete filesArr[imgNum];
							deleteIndex++;
							$(obj).closest("tr").remove();
						}
					})
		}
		function modalset() {
			$("#close").trigger("click");
		}
	</script>
</body>
</html>