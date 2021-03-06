<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 관리자모드</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#container {
	min-height: 400px;
}

#container #content {
	width: 730px;
	float: right;
}

#container #content #classboard_table table {
	width: 730px;
	font-size: 15px;
}

#container #content #classboard_table table tr {
	line-height: 30px;
	height: 30px;
	border-bottom: 1px solid #ccc;
}

#container #content #classboard_table table th {
	background: #333333;
	color: #ccc;
}

#container #content #classboard_table table td {
	color: #9a9a9a;
	text-align: center;
}

#container #content #classboard_table table td.title {
	text-align: left;
}

#container #content #classboard_table table th, #container #content #classboard_table table td
	{
	line-height: 30px;
	height: 30px;
}

#container #content #classboard_table table #paging_tr {
	margin: 15px 0;
	height: 69px;
	line-height: 69px;
	border-top: 2px solid #333333;
	border-bottom: none;
}

#paging {
	height: 39px !important;
	line-height: 69px !important;
}

#container #content #classboard_table table #search_tr {
	margin: 15px 0;
	height: 40px;
	border-bottom: none;
	background: rgb(235, 235, 235);
	line-height: 40px;
}

#search_wrap {
	height: 40px;
	line-height: 40px;
}

#search_wrap label {
	font-size: 13px;
}

#search_wrap input[type='radio'] {
	line-height: 1px;
	margin-top: 5px;
	display: inline-block;
}

.pageNum {
	width: 24px;
	height: 25px;
	line-height: 25px;
	display: inline-block;
	border: 1px solid #ccc;
	cursor: pointer;
}

.paginBtn {
	width: 15px;
	line-height: 13px;
	height: 14px;
	display: inline-block;
	background: #ccc;
	color: #fff;
}

.search_img {
	vertical-align: middle;
	margin-left: 15px;
}

#insert_wrap {
	width: 100%;
	overflow: hidden;
}

#insert_wrap button {
	background: rgb(235, 235, 235);
	float: right;
	border: none;
	font-size: 13px;
	font-family: "맑은 고딕";
	color: #9a9a9a;
	padding: 3px 6px;
}

#content a {
	color: black;
	text-decoration: none;
}

span#active {
	background: rgb(235, 235, 235);
}

.memberTr:hover {
	background: #6799FF;
	color:white;  
}

.memberTr:hover td{
	color:white !important;             
}

</style>
<script type="text/javascript">
	$(function(){
		$(document).on("click",".memberTr",function(){
			var no =$(this).find("td").eq(0).text();
			location.href="${pageContext.request.contextPath }/admin/member/read${pageMaker.makeSearch(pageMaker.cri.page)}&mno="+no;
		})
		
		
		$("#submit_img").click(function(){
				var searchType = $("input[name='smode']:checked").val();
				var keyword = $("input[name='search']").val();
				if(keyword ==""){
					alert("키워드를 입력해주세요");
					return false;
				}else{
					location.href="${pageMaker.makeQuery(1)}&searchType="+searchType+"&keyword="+keyword;
				}
				return false;                  
			})
			
			
	})
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<div id="header_title">
				<div id="main_title">회원관리</div>
			</div>


			<div id="classboard_table">
				<table>
					<tr>
						<th width="50">번호</th>
						<th width="">아이디</th>
						<th width="">이름</th>                
						<th width="50">성별</th>
						<th width="">생년월일</th>
						<th width="">전화번호</th>
						<th width="">이메일</th>
						<th width="">등록날짜</th>                      
					</tr>
					<c:if test="${lists !=null }">
						<c:forEach var="item" items="${lists }">
						
							<tr class="memberTr">
								<td>${item.mno }</td>
								<td>${item.id }</td>
								<td>${item.name }</td>
								<td>${item.gender }</td>
								<td>${item.age }</td>
								<td>${item.tell }</td>
								<td>${item.email }</td>
								<td><fmt:formatDate value="${item.date }" pattern="yyyy.MM.dd HH:mm"/></td>
							</tr>
						</c:forEach>
					</c:if>                     
					<tr id="paging_tr">
						<td colspan="8">
							<div id="paging">
								<c:if test="${pageMaker.prev}">
									<a href="${pageMaker.makeSearch(pageMaker.startPage-1)}"><span
										class="paginBtn">&laquo;</span></a>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<a href="${pageMaker.makeSearch(idx)}"><span class="pageNum"
										${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<a href="${pageMaker.makeSearch(pageMaker.startPage+1)}"><span
										class="paginBtn">&raquo;</span></a>
								</c:if>                              
							</div>
						</td>
					</tr>
					<tr id="search_tr">
						<td colspan="8">                                           
							<form id="search_wrap">
								<input id="smode_subject" name="smode" type="radio"
									value="name" checked="checked"> <label
									for="smode_subject">이름</label> <input id="smode_author"
									name="smode" type="radio" value="id"> <label
									for="smode_author">아이디</label>

									<img src="${pageContext.request.contextPath}/resources/img/search_img.png" class="search_img" id="search_img">
									 <input type="text" name="search"> 
								<a href="" id="submit_img">
									<img src="${pageContext.request.contextPath}/resources/img/btn_search.gif" class="search_img">
								</a>            
							</form>
						</td>       
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>