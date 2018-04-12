<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 : 질문 및 답변 : 대구 아이티 수영장</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/qna/qnaBoard.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
		var check = "${pageMaker.cri.searchType}";
		var search = "${pageMaker.cri.keyword}";
		$(function() {
			
			$(document).on("click", ".data_tr", function() {
				var bno = $(this).find(".bno").text();
				location.href = "qnaRead${pageMaker.makeSearch(pageMaker.cri.page)}&bno=" + bno;
				
			})
			$("#searchBtn").click(function(){
				if($("#search").val()==""){
					alert("검색어를 입력해주세요");
					return;
				} 
				
				
			
				location.href="qnaBoard${pageMaker.makeQuery(1)}&searchType="+$(".input:checked").val()+"&keyword="+$("#search").val();
				
			})
			
			if(check!=""){
				$(".input").each(function(i,obj){
					if($(this).val()==check){
						$(this).attr("checked","checked");	
					}
				})
			}
			if(search !=""){
				$("#search").val(search);
			}
			
			$("#allBtn").click(function(){
				location.href="qnaBoard${pageMaker.makeQuery(1)}";
			})
					
		})
	</script>
	<div id="container">

		<jsp:include page="qnaside.jsp" />
		<div id="content">
			<jsp:include page="qnaBoardTitle.jsp" />
			<div id="list_content">
				<div id="btn_group">
					<button class="btn" id="allBtn">전체보기</button>
				</div>
				
				<table id="list">
					<tr id="first">
						<th class="th">번호</th>
						<th class="th">제목</th>
						<th class="th">작성자</th>
						<th class="th">등록일</th>
					</tr>
					<c:if test="${list !=null }">
						<c:forEach var="item" items="${list }">
							<tr data-bno='${item.bno }' class="data_tr">
								<td class="td bno">${item.bno }</td>
								<td class='td_title'>${item.title }</td>
								<td class="td">${item.writer }</td>
								<fmt:formatDate value="${item.regdate }" pattern="yyyy-MM-dd"
									var="date" />
								<td class="td">${date }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${list.size() ==0 }">
						<tr>
							<td colspan="4" id="nolist">질문이 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
			<div id="paging">
				<c:if test="${pageMaker.prev}">
					<a href="qnaBoard?page=${pageMaker.startPage-1 }"><span
						class="paginBtn">&laquo;</span></a>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<a href="qnaBoard${pageMaker.makeSearch(idx) }"><span class="pageNum"
						${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a href="qnaBoard?page=${pageMaker.endPage+1}"><span
						class="paginBtn">&raquo;</span></a>
				</c:if>
			</div>
		<div id="search_div">
			<input type="radio" checked="checked" value="writer" class="input" name="searcht"> 작성자 
			<input type="radio" value="title" class="input" name="searcht"> 제목
			<img src="${pageContext.request.contextPath }/resources/img/search_img.png">
			<input type="text" id="search">
			<img src="${pageContext.request.contextPath }/resources/img/btn_search.gif" id="searchBtn">
		</div>
		</div>
	</div>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>