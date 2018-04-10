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
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
	<script src="${pageContext.request.contextPath }/resources/qna/qna.js"></script>
	
	<div id="container">
		<jsp:include page="qnaside.jsp" />
		<div id="content">
			<jsp:include page="qnaContentTitle.jsp" />
			<form action="${pageContext.request.contextPath }/qna/qnaContent" method="post" id="f">
				<div id="qna_page">
					<div id="qna_content">
						<h2>
							<span class="mark22">■</span> 문의 내용
						</h2>
						<p id="require">
							<img
								src="${pageContext.request.contextPath }/resources/images/tag_require.png">
						</p>
						<table>
							<tr>
								<td class="td"><img
									src="${pageContext.request.contextPath }/resources/images/arrow.gif">
									제목</td>
								<td><input type="text" id="title" name="title"></td>
							</tr>
							<tr>
								<td class="td"><img
									src="${pageContext.request.contextPath }/resources/images/arrow.gif">
									문의 내용</td>
								<td><textarea id="con"></textarea></td>
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
								<td class="td"><img
									src="${pageContext.request.contextPath }/resources/images/arrow.gif">
									이름</td>
								<td><input type="text" id="name" name="writer"></td>
							</tr>
							<tr>
								<td class="td"><img
									src="${pageContext.request.contextPath }/resources/images/arrow.gif">
									이메일</td>
								<td><input type="text" id="email1" name="email1">@<input
									type="text" id="email2" name="email2"> <select id="eselect">
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
								<td class="td"><img
									src="${pageContext.request.contextPath }/resources/images/arrow.gif">
									비밀번호 설정</td>
								<td><input type="password" id="pw" name="pw"></td>
							</tr>
							<tr>
								<td class="td"><img
									src="${pageContext.request.contextPath }/resources/images/arrow.gif">
									자동입력 방지</td>
								<td><i><span id="test"></span></i> <input type="text"
									id="test2"></td>
							</tr>

						</table>
					</div>

					<div id="check_info">
						<h2>
							<span class="mark22">■</span> 개인정보 수집 및 이용에 대한 안내
						</h2>
						<div id="check_content">
							'대구 아이티 수영장'은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에
							관한 법률을 준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와
							방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
							<br>
							<br> ο 본 방침은 : 2018 년 05 월 04 일 부터 시행됩니다.<br>
							<br>
							<br> <span class="f_bold">◆ 수집하는 개인정보의 항목</span><br>
							회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br> ο
							수집항목 : 이름, 아이디, 비밀번호, 자택 전화번호, 휴대전화번호, 이메일, 서비스이용기록, 쿠키, 접속IP정보<br>
							ο 개인정보 수집방법 : 홈페이지(회원가입, 고객게시판 등), 제휴사로부터의 제공<br>
							<br>
							<br> <span class="f_bold">◆ 개인정보의 수집 및 이용목적</span><br>
							회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br> ο 서비스 제공에 관한 계약 이행 및 서비스
							제공에 따른 요금정산<br> &nbsp;콘텐츠 제공, 구매 및 요금 결제, 요금추심<br> ο 회원
							관리<br> &nbsp;회원제 서비스 이용에 따른 본인확인, 불량회원의 부정 이용 방지와 비인가 사용 방지,
							가입 의사 확인,<br> &nbsp; 불만처리 등 민원처리, 고지사항 전달<br> ο 마케팅 및
							광고에 활용<br> &nbsp;신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달<br>
							<br>
							<br> <span class="f_bold">◆ 개인정보의 보유 및 이용기간</span><br>
							회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.<br> 단,
							관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령이 정한 일정한 기간 동안 회원정보를 보관합니다.<br>
						</div>
						<p>
							<input type="checkbox" id="check">위의 '<span class="f_bold">개인정보
								수집 및 이용</span>'에 동의합니다.
						</p>
					</div>

				</div>
				<input type="hidden" name="imgpath" id="imgpath">
				<input type="hidden" name="email" id="email">
				<input type="hidden" name="content" id="c1">
			</form>
			<input type="file" name="fileList" multiple="multiple" id="fileList"
				style="display: none;">
			<div id="btnGroup">
				<a href="#"><button id="qnaInsert">상담하기</button></a> <a
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
					<input type="submit" class="btn btn-success"  data-dismiss="modal" value="확인" id="close">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal"
						id="cancelBtn">취소</button> -->
				</div>

			</div>

		</div>
	</div>
</body>
</html>