<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 : 온라인 상담 : 대구 아이티 수영장</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/qna/qna.css">
<style>
#preview {
	width: 100%;
	margin-top: 10px;
}

#preview_t {
	width: 100%;
}

#preview_t tr {
	height: 30px;
	border-bottom: 1px solid #ccc;
}

#preview_t th {
	vertical-align: middle !important;
	background: #333333;
	color: #ccc;
	text-align: center;
}

#preview_t, #preview_t th, #preview_t td, #preview_t tr {
	border: 1px solid #ccc;
	border-collapse: collapse;
}

#preview_t td {
	color: #9a9a9a;
	text-align: center;
	height: 100px;
	vertical-align: middle !important;
}

.imgs {
	max-width: 100%;
	max-height: 250px;
}
#count{
	font-size: 13px;
}
#eselect{
	width:100px;
	font-size: 13px;
	height:25px;
}
#eselect option{
	font-size: 13px;
}
input,textarea{
	font-size: 13px;
}
#pw_info{
	margin-top: 10px;
}
#qna_content h2{
	float: left;
}
#require{
	float: right;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		var index = 1;
		$(function() {
			$("#eselect").change(function(){
				$("#email2").val($(this).val());
			})
			$("#fileUpload").click(function() {
				$("#fileList").trigger("click");
			})

			$(document)
					.on(
							"change",
							"#fileList",
							function() {

								$("#preview_t").find("tr").not("#basic")
										.remove();
								var file = document.getElementById("fileList");

								var reader = new FileReader();
								reader.onload = function(e) {

									$("#preview_t")
											.append(
													"<tr><td><input type='checkbox' class='c'></td>"
															+ "<td><img src='"+e.target.result+"' class='imgs'></td>");
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

			var size = $(".c").length;
			$("#count").text(" "+size+"개가 선택 되었습니다.");
		})

		function submitBtn() {
			var formData = new FormData();
			var size = $(".c").length;
			
			for (var i = 0; i < size; i++) {
				formData.append("fileList",
						$("input[name='fileList']")[0].files[i]);
			}
			$.ajax({
				url : "/pool/qna/upload",
				data : formData,
				type : "post",
				processData : false,
				contentType : false,
				dataType : "json",
				success : function(result) {
					console.log(result);
				
				}
			})
		}
	</script>
	<div id="container">
		<jsp:include page="qnaside.jsp" />
		<div id="content">
			<jsp:include page="qnaContentTitle.jsp" />

			<div id="qna_page">
				<div id="qna_content">
					<h2>
						<span class="mark22">■</span> 문의 내용
					</h2>
					<p id="require"><img src="${pageContext.request.contextPath }/resources/images/tag_require.png"></p>
					<table>
						<tr>
							<td class="td">제목</td>
							<td><input type="text" id="title"></td>
						</tr>
						<tr>
							<td class="td">문의 내용</td>
							<td><textarea></textarea></td>
						</tr>
						<tr>
							<td class="td">첨부파일</td>
							<td><a href="#" data-target="#modal" data-toggle="modal"><button>파일
										선택</button></a><span id="count"></span></td>
						</tr>
					</table>
				</div>
				<div id="personInfo">
					<h2>
						<span class="mark22">■</span> 기본사항
					</h2>
					<table>
						<tr>
							<td class="td">이름</td>
							<td><input type="text" id="name"></td>
						</tr>
						<tr>
							<td class="td">이메일</td>
							<td><input type="text" id="email1">@<input
								type="text" id="email2">
								
								<select id="eselect">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="daum.net">daum.net</option>
								</select></td>
						</tr>

					</table>
				</div>
				<div id="pw_info">
					<h2>
						<span class="mark22">■</span> 비공개 설정
					</h2>
					
						<table>
						<tr>
							<td class="td">비밀번호 설정</td>
							<td><input type="password" id="pw"></td>
						</tr>
						<tr>
							<td class="td">자동입력 방지</td>
							<td><span id="test"></span><input type="text" id="test2"></td>
						</tr>

					</table>
				</div>
				
				<div id="check_info">
					<h2>
						<span class="mark22">■</span> 개인정보 수집 및 이용에 대한 안내
					</h2>
					<div id="check_content">
						'OOOOO'은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을
						준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고
						있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
					</div>
					<p>
						<input type="checkbox">위의 '<span class="f_bold">개인정보
							수집 및 이용</span>'에 동의합니다.
					</p>
				</div>
				
			</div>

			<input type="file" name="fileList" multiple="multiple" id="fileList"
				style="display: none;">
			<div id="btnGroup">
				<a href="#"><button>상담하기</button></a> <a
					href="${pageContext.request.contextPath }/"><button>취소하기</button></a>
			</div>

		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />

	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">첨부파일 업로드</h4>
				</div>


				<div class="modal-body">

					<button id="fileUpload" class="btn btn-primary">이미지추가</button>
					<button onclick="fileDelete()" class="btn btn-danger">이미지삭제</button>
					<input type="file" name="fileList" multiple="multiple"
						id="fileList" style="display: none;">
					<div id="preview">
						<table id="preview_t">
							<tr id="basic">
								<th width="20"><input type="checkbox" id="allCheck"></th>
								<th width="500">이미지</th>

							</tr>
						</table>
					</div>

				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-success" value="업로드"
						onclick="submitBtn()">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="close">닫기</button>
				</div>

			</div>

		</div>
	</div>
</body>
</html>