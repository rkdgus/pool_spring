<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/common/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/common/common.css">
<title>대구 아이티 수영장 - 반별게시판</title>
<style>
#container #content #read_table table {
	width: 730px;
	font-size: 15px;
}

#container #content #read_table table tr {
	line-height: 30px;
	height: 30px;
	border-bottom: 1px solid #ccc;
}

#container #content #read_table table th, #container #content #read_table table td
	{
	padding: 5px 0px 5px 10px;
}

#container #content #read_table table th {
	border-top: 2px solid #333333;
	background: #ebebeb;
	color: #333333;
	text-align: left;
	font-weight: bold;
}

.align_right {
	text-align: right;
}

#btn_tr {
	border: none !important;
}

#btn_tr td a button {
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 2px;
}

.imgs {
	min-width: 200px;
	min-height: 100px;
	max-width: 100%;
	max-height: 500px;
}

#reply_title {
	border-top: 2px solid #333333;
	background: #ebebeb;
}

#read_count {
	font-weight: bold;
}

.hidden_btn {
	display: none;
}

.hidden_btn button {
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 2px;
	margin-right: 10px;
}

.align_right {
	text-align: right;
}

.updateImg {
	padding-right: 30px;
}

#reply_insert {
	margin: 30px auto;
	width: 550px;
	height: 30px;
}

#reply_insert textarea {
	width: 500px;
	height: 36px;
	resize: none;
	padding: 0;
	float: left;
	line-height: 36px;
}

#reply_insert img {
	float: left;
	cursor: pointer;
}
.reply_update_div{
	display: none;
}
.reply_replytext_update{
	padding:3px;
	width:80%;   
}
.reply_replytext_update_btn{
	background: #fff;
	border: 1px solid #ccc;
    border-radius: 2px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/common/reset.css">

</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<input type="hidden" id="loginId" value="${login.id }"> <input
				type="hidden" id="bno" value="${vo.bno }">
			
			<div id="read_table">
				<table>
					<tr>
						<th colspan="4">${vo.title }</th>
					</tr>
					<tr>
						<td colspan="2">작성자:${vo.id }</td>
						<td colspan="2" class="align_right"><fmt:formatDate
								value="${vo.regdate }" var="regdate" pattern="yyyy-MM-dd" />
							조회:${vo.readcnt } 등록일:${regdate }</td>
					</tr>
					<tr>
						<td colspan="4"><c:forEach var="img" items="${imgArr }">
								<img src="displayFile?filename=${img}" class="imgs">
							</c:forEach>
							<p class="read_content">${vo.content }</p></td>
					</tr>
					<tr id="btn_tr">
						<td colspan="4" class="align_right"><a
							href="classboard?cno=${vo.cno }"><button>목록</button></a> <a
							href="${pageContext.request.contextPath }/classboard/modify?bno=${vo.bno}" class="notauthority"><button>수정</button></a>
							<a href="#" class="notauthority"><button id="boardRemoveBtn">삭제</button></a></td>
					</tr>
					<tr>
						<td colspan="4">
							<div id="reply_insert">
								<textarea rows="" cols="" id="reply_content"></textarea>
								<img
									src="${pageContext.request.contextPath }/resources/img/reply_regist.gif"
									id="reply_insert_btn">
								<c:if test="${login.id ==null }">
									<script>
										$("#reply_content").attr("readonly","readonly");
										$("#reply_content").val(
												"로그인 후 사용 가능합니다.");
									</script>
								</c:if>
							</div>
						</td>
					</tr>
					<tr id="reply_title">
						<td colspan="4"><c:if test="${replyList ==null }">
								댓글 : <span id="read_count">0</span>건	
							</c:if> <c:if test="${replyList !=null }">
								댓글 : <span id="read_count">${replyList.size() }</span>건	
							</c:if></td>
					</tr>
					<c:if test="${replyList !=null }">
						<c:forEach var="reply" items="${replyList }">
							<tr class="reply_content">
								<td width="80">${reply.id }</td>
								<td width="460"><span class="replytext_update">${reply.replytext }</span>
									<div class="reply_update_div">
										<input type="text" class="reply_replytext_update">
										<input type="button" class="reply_replytext_update_btn" value="수정">
									</div>
								</td>
								<fmt:formatDate value="${reply.regdate }" var="regdate"
									pattern="yyyy-MM-dd" />
								<td width="110">${regdate }</td>
								<td width="80" class="align_right"><a href="#" class='aimg'>
										<img
										src="${pageContext.request.contextPath }/resources/img/selection-tool.png"
										class="updateImg">
								</a>
									<div class="hidden_btn">
										<button class='reply_update_btn' value="${reply.rno }">수정</button>
										<button class='reply_delete_btn' value="${reply.rno }">삭제</button>
									</div></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
		<c:if test="${login.title !='사장'&& vo.id!=login.id}">
				<script type="text/javascript">				
					$(".notauthority").css("display","none");
				</script>
			</c:if>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script>
		$(function() {
			$(document).on("click", ".aimg", function(e) {
				e.preventDefault();
			})
			$(document).on("click",".reply_replytext_update_btn",function(){
				if($(this).prev().val()==""){
					alert("수정글을 입력해주세요")
					return;
				}
				var replytext = $(this).prev().val();
				var rno = $(this).closest(".reply_content").find(".reply_update_btn").val();
				var bno = $("#bno").val();
				$.ajax({
					url : "updateReply",
					data : {
						"replytext" : replytext,
						"bno" : bno,
						"rno":rno
					},
					type : "post",
					dataType : "json",
					success : function(json) {
						readReply(json)
					}
				})
			})
			$(document).on("click", ".updateImg", function() {
				var id = $(this).closest(".reply_content").find("td").eq(0).text();
				$(".reply_replytext_update").val("");
				if($("#loginId").val() == id){
					if ($(this).parent().next().css("display") == "none") {
						$(this).parent().next().css("display", "block");
					} else {
						$(this).parent().next().css("display", "none");
						$(this).closest("tr").find(".reply_update_div").css("display","none");
					}	
				}else{
					alert("해당 권환이 없습니다.");
				}
			})
			$(document).on("click",".reply_update_btn",function(){
				$(".reply_replytext_update").val("");
				if($(this).closest("tr").find(".reply_update_div").css("display")=="none"){
					$(this).closest("tr").find(".reply_update_div").css("display","block");
					var text = $(this).closest("tr").find(".replytext_update").text();
					$(".reply_replytext_update").val(text);
				}else{
					$(this).closest("tr").find(".reply_update_div").css("display","none");
				}
				
			})
			$(document).on("click", ".reply_delete_btn", function() {
				
				if (confirm("댓글을 삭제하시겠습니까?")) {
					var rno = $(this).val();
					var bno = $("#bno").val();
					$.ajax({
						url : "deleteReply",
						data : {
							"rno" : rno,
							"bno" : bno
						},
						type : "get",
						dataType : "json",
						success : function(json) {
							readReply(json)
						}
					})
				}
				;
			})
			$("#boardRemoveBtn")
					.click(
							function() {
								if (confirm("게시글을 삭제하시겠습니까?")) {
									location.href = "${pageContext.request.contextPath }/classboard/remove?bno=${vo.bno }&cno=${vo.cno}";
								}
							})
			$("#reply_content")
					.click(
							function() {
								if ($(this).val() == "로그인 후 사용 가능합니다.") {
									location.href = "${pageContext.request.contextPath}/login/login";
								}

							})
			$("#reply_insert_btn")
					.click(
							function() {
								if ($("#loginId").val() == "") {
									location.href = "${pageContext.request.contextPath}/login/login";
								} else if ($("#reply_content").val() == "") {
									alert("내용을 입력해주세요");
									return;
								}
								var id = $("#loginId").val();
								var replytext = $("#reply_content").val();
								var bno = $("#bno").val();
								$.ajax({
									url : "insertReply",
									data : {
										"id" : id,
										"replytext" : replytext,
										"bno" : bno
									},
									type : "post",
									dataType : "json",
									success : function(json) {
										$("#reply_content").val("");
										readReply(json)
									}
								})

							})
		})
		function readReply(json) {
			console.log(json);
			$(".reply_content").remove();
			$("#read_count").text(json.length);
			if (json.length != 0) {
				for (var i = 0; i < json.length; i++) {
					var rno = json[i].rno;
					var tr = "<tr class='reply_content'>";
					var td_id = "<td width='80'>" + json[i].id + "</td>";
					var td_replytext = "<td width='460'><span class='replytext_update'>" + json[i].replytext
							+ "</span><div class='reply_update_div'><input type='text' class='reply_replytext_update'><input type='button' class='reply_replytext_update_btn' value='수정'></div></td>";
					var date = new Date(json[i].regdate);
					var dateStr = date.getFullYear() + "-"
							+ (date.getMonth() + 1) + "-" + date.getDate();
					var td_regdate = "<td width='110'>" + dateStr + "</td>";
					var td_btn = "<td width='80' class='align_right'><a href='#' class='aimg'> <img "+
								"src='${pageContext.request.contextPath }/resources/img/selection-tool.png'"+
								"class='updateImg'></a>"
							+ "<div class='hidden_btn'>"
							+ "<button class='reply_update_btn' value='"+rno+"'>수정</button><button class='reply_delete_btn' value='"+rno+"'>삭제</button></div></td></tr>";
					tr += td_id + td_replytext + td_regdate + td_btn;
					$("#read_table table").append(tr);
				}
			}
		}
	</script>
</body>
</html>