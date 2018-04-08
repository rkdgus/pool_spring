<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#content #insert_f{
		width:100%;
		border-top:2px solid #333333;
		padding:10px;
	}
	#content #insert_f table{
		width:95%;
		border:1px solid #d7d7d7;
	}
	#content #insert_f table td{
		padding:5px;
	}
	#content #insert_f table td input{
		border:1px solid #d7d7d7;
		width:90%;
	}
	#content #insert_f table td textarea{
		width:89%;
		height:200px;
		resize:none;
		border:1px solid #d7d7d7;
	}
	#content #insert_f table tr{
		border-bottom:1px solid #d7d7d7;
	}
	#content #insert_f table tr td:FIRST-CHILD{
		background: #ebebeb;
	}
	#content #insert_f table tr:LAST-CHILD  td:FIRST-CHILD{
		padding-left:180px;
		background: none;
	}
	#content #insert_f table tr:LAST-CHILD  td:FIRST-CHILD input{
		width:120px;
	}
	

</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
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
						<td><input type="text" name="cno"></td>	
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content"></textarea></td>	
					</tr>
					<tr>
						<td>이미지</td>
						<td><input type="button" value="이미지추가" class="btn_admin"
					data-toggle="modal" data-target="#modal" id="add">		
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="취소" id="cencelBtn">
					<input type="submit" value="전송">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
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