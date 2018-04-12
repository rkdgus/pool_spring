<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 : 마이페이지 : 문의내역 : 대구 아이티 수영장</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/mypage/mypageQna.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>

		var searchType="${pageMaker.cri.searchType}";
		
		$(function(){
		
			$("#sel").change(function(){
					
				location.href="${pageMaker.makeQuery(1)}&searchType="+$(this).val()+"&id=${id}";
			})
			$("#sel").val(searchType.split(".")[0]);
			
			$("#searchBtn").click(function(){
				if($("#search").val()==""){
					alert("검색어를 입력해주세요");
					return;
				}
				location.href="${pageMaker.makeQuery(1)}&searchType="+$("#sel").val()+".title&keyword="+$("#search").val()+"&id="+${id};
			})
			
			$(document).on("click",".list_tr",function(){
				var bno = $(this).find(".bno").text();
				location.href="mypageQnaRead${pageMaker.makeSearch(pageMaker.cri.page)}&id=${id}&bno="+bno;
			})
		})
	</script>
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="qnaTitle.jsp" />
			<div id="t_div">
				<select id="sel">
					<option value="">전체보기</option>
					<option value="answer">완료답변</option>
					<option value="noanswer">미답변</option>
				</select>
				<table id="t">
					<tr id="main_tr">
						<td id="main_bno">번호</td>
						<td id="main_qnatitle">제목</td>
						<td id="main_regdate">등록일</td>
						<td id="main_answer">답변</td>
					</tr>
					<c:if test="${list.size() == 0 }">
						<tr class=list_tr>
							<td colspan="4">문의 내역이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${list !=null }">
						<c:forEach items="${list }" var="list">
							<tr class="list_tr">
								<td class="bno">${list.bno }</td>
								<td>${list.title }</td>
								<c:if test="${list.replycheck==false }">
									<td>X</td>
								</c:if>
								<c:if test="${list.replycheck==true }">
									<td>O</td>
								</c:if>
								<fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"
									var="date" />
								<td>${date }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>

				<div id="paging">
					<c:if test="${pageMaker.prev}">
						<a
							href="myPageQna${pageMaker.makeSearch(pageMaker.startPage-1)}&id=${list.id}"><span
							class="paginBtn">&laquo;</span></a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<a href="myPageQna${pageMaker.makeSearch(idx)}&id=${id}"><span
							class="pageNum" ${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<a
							href="myPageQna${pageMaker.makeSearch(pageMaker.endPage+1)}&id=${id}"><span
							class="paginBtn">&raquo;</span></a>
					</c:if>
				</div>
			</div>

			<div id="search_div">
				 <input type="radio" value="title"
					class="input" name="searcht" checked="checked"> 제목 <img
					src="${pageContext.request.contextPath }/resources/img/search_img.png">
				<input type="text" id="search"> <img
					src="${pageContext.request.contextPath }/resources/img/btn_search.gif"
					id="searchBtn">
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
