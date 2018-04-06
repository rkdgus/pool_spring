<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container #content #read_table table{
		width:730px;
		font-size:15px;
		
	}
	#container #content #read_table table tr{
		line-height:30px;
		height:30px;
		border-bottom:1px solid #ccc;
	}
	#container #content #read_table table th,#container #content #read_table table td{
		padding:5px 0px 5px 10px;
	}
	#container #content #read_table table th{
		border-top:2px solid #333333;
		background: #ebebeb;
		color:#333333;
		text-align: left;
		font-weight:bold;
	}
	.align_right{
		text-align: right;
	}
	.read_content{
		
	}
	#btn_tr{
		border:none !important;
	}
	#btn_tr td a button{
		background: #fff;
		border:1px solid #ccc;
		border-radius:2px;
	}
	.imgs{
		min-width: 200px;
		min-height: 100px;
		max-width: 100%;
		max-height: 500px;
	}
	#reply_title{
		border-top:2px solid #333333;
		background: #ebebeb;
	}
	#read_count{
		font-weight: bold;
	}
	.hidden_btn{
		display: none;
	}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/common/reset.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div id="container">
		<jsp:include page="side.jsp" />
		
		<div id="content">
			<jsp:include page="contentTitle.jsp" />
			<div id="read_table">
				<table>
					<tr>
						<th colspan="4">[신규출시] 금융/캐피탈솔루션 출시</th>
					</tr>
					<tr>
						<td colspan="2">
							작성자:관리자
						</td>
						<td colspan="2" class="align_right">
							조회:20 등록일:2013-01-28
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<img src="${pageContext.request.contextPath }/resources/images/a1.jpg" class="imgs">
							<img src="${pageContext.request.contextPath }/resources/images/a1.jpg" class="imgs">
							<img src="${pageContext.request.contextPath }/resources/images/a1.jpg" class="imgs">
							<p class="read_content">
								안녕하세요.<br>
								안녕하세요.<br>
								안녕하세요.<br>
								안녕하세요.<br>
								안녕하세요.<br>
							</p>
						</td>
					</tr>
					<tr id="btn_tr">
						<td colspan="4" class="align_right">
							<a href=""><button>목록</button></a>
							<a href=""><button>수정</button></a>
							<a href=""><button>삭제</button></a>
						</td>
					</tr>
					<tr id="reply_title">
						<td colspan="4">
							댓글 : <span id="read_count">2</span>건
						</td>
					</tr>
					<tr class="reply_content">
						<td>
							김기리
						</td>
						<td>
							저에게 꼭 필요한 솔루션이네요~!
						</td>
						<td>
							2013-01-28
						</td>
						<td>
							<a href=""><img src="${pageContext.request.contextPath }/resources/img/selection-tool.png" id="asd"></a>
							<div class="hidden_btn">
								<button>수정</button>
								<button>삭제</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>