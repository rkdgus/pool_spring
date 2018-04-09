<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 관리자모드</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#wrap_admin_btn .btn_admin {
	padding: 5px;
	background: #175c85;
	color: white;
	font-weight: bold;
	text-decoration: none;
}

#wrap_admin_btn .btn_admin:hover {
	background: #373e6a;
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
	max-width: 250px;
	max-height: 90px;
}

#leftArea {
	width: 178px !important;
}

.galleyTable td img{         
	max-height:100px;       
}

</style>
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
												"<tr><td><input type='checkbox' class='modal_check'></td>"
														+ "<td><input type='text' class='name'></td>"
														+ "<td><img src='"+e.target.result+"' class='imgs'></td>"
														+ "<td><select class='sel'><option>내부</option><option>외부</option><option>강습사진</option><option>주변사진</option></select></td></tr>");

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

		$("#f1").submit(function() {
			var nameArr = [];
			var typeArr = [];

			$(".name").each(function(i, obj) {
				nameArr.push($(this).val());
			});
			$(".sel").each(function(i, obj) {
				typeArr.push($(this).find("option:selected").index());
			});

			$("#nameArr").val(nameArr);
			$("#typeArr").val(typeArr);
		})
		           
		$("#modal_table #allCheck").change(function() {
			var checked =$(this).is(":checked");
			if(checked){
				console.log(checked);
				$(".modal_check").prop("checked",true);
			}else{
				console.log(checked);
				$(".modal_check").prop("checked",false);
			} 
		})                                    
		
		$(".galleyTable #allChecked").change(function() {
			var checked =$(".galleyTable #allChecked").is(":checked");
			if(checked){               
				console.log(checked);
				$(".galleyTable .check").prop("checked",true);
			}else{
				console.log(checked);
				$(".galleyTable .check").prop("checked",false);
			} 
		})
		
		
		$("#del").click(function(){
			
			var con = confirm("정말 삭제 하시겠습니까?");
			if(con==false){
				return false;                    
			}
			var arr = []; 
			
				$(".galleyTable .check").each(function(i, obj) {
					if($(obj).is(":checked")){
						arr.push($(this).parent().parent().find(".num").val());
					}
				})
				
			
			if(arr.length==0){
				alert("선택한 이미지가 없습니다.");
				return false;
			}              
			location.href="${pageContext.request.contextPath}/admin/gallery/delete/"+arr;          
			
			return false;
		})
		
		
	})

	function fileUpload() {
		console.log("fileUpload");

		$("#fileList").trigger('click');

	}

	function submitBtn() {
		$("#f1").submit();
	}
	

	
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<div id="header_title">
				<div id="main_title">갤러리관리</div>
			</div>

			<div id="wrap_admin_btn">
				<a href="" class="btn_admin" id="del">선택삭제</a> <a href="" class="btn_admin"
					data-toggle="modal" data-target="#modal" id="add">이미지추가</a>
			</div>

			<table class="galleyTable">
				<tr>
					<th width="20"><input type="checkbox" id="allChecked"></th>
					<th width="100">번호</th>
					<th width="100">이름</th>
					<th width="">이미지</th>
					<th width="150">타입</th>
				</tr>
				<c:forEach items="${list}" var="imgs">
					<tr>
						<td><input type="checkbox" class="check"></td>
						<td>${imgs.gallery_num}<input type="hidden" class="num" name="no" value="${imgs.gallery_num}"></td>
						<td>${imgs.gallery_name}</td>
						<td><img src="displayFile?filename=${imgs.gallery_path}"></td>
						<td>${imgs.gallery_type}</td>
					</tr>
				</c:forEach>

			</table>

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
					<form method="post" action="gallery" enctype="multipart/form-data"
						id="f1">
						<input type="file" name="fileList" multiple="multiple"
							id="fileList" style="display: none;"> <input
							type="hidden" name='name' id="nameArr"> <input
							type="hidden" name='type' id="typeArr">
						<table class="galleyTable" id="modal_table">
							<tr>
								<th width="20"><input type="checkbox" id="allCheck"></th>
								<th width="">이름</th>
								<th width="250">이미지</th>
								<th width="110">타입</th>
							</tr>


						</table>
					</form>


				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-success" value="업로드"
						onclick="submitBtn()">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>

		</div>
	</div>
</body>
</html>