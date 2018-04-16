<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#main_t table, #preview_t {
	width: 100%;
	border-top: 2px solid #333333;
	border-bottom: 2px solid #333333;
}

#title_tr, #basic {
	background: #333333;
	height: 30px;
	line-height: 30px;
	color: white;
}

#title_tr td, #basic td {
	text-align: center;
}

#title_cno {
	width: 100px;
}

#title_level {
	width: 70px;
}

#title_classmate {
	width: 75px;
}

#title_day {
	width: 140px;
}

#title_reclass {
	width: 100px;
}

#noClass {
	font-size: 13px;
	text-align: center;
}

#main_t table .list, .m_list {
	height: 25px;
	line-height: 25px;
	text-align: center;
	font-size: 13px;
}

#main_t table .list_tr, #no_list, .m_list {
	border-bottom: #d7d7d7 1px solid;
	height: 25px;
	line-height: 25px;
	cursor: pointer;
}

#main_t table .list_tr:HOVER, #main_t table #no_list:HOVER, .m_list:HOVER
	{
	background-color: #d7d7d7;
}

#paging {
	margin-top: 20px;
	text-align: center;
	height: 30px;
}

.pageNum {
	width: 24px;
	height: 25px;
	line-height: 25px;
	color: black;
	display: inline-block;
	border: 1px solid #ccc;
	font-size: 14px;
}

.pageNum:HOVER {
	background: #ebebeb;
}

#active {
	background: rgb(235, 235, 235);
}

#preview {
	max-height: 200px;
	overflow: auto;
}
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="attendanceTitle.jsp" />
			<select id="sel">
				<option>현재현황</option>
				<option>이전정보</option>
			</select>
			<div id="main_t">
				<table id="t">
					<tr id="title_tr">
						<td id="title_cno">강의번호</td>
						<td id="title_time">강의시간</td>
						<td id="title_level">등급</td>
						<td id="title_classmate">총인원</td>
						<td id="title_day">개설날짜</td>
					</tr>
					<c:if test="${lists.size()==0 }">
						<tr id="no_list">
							<td colspan="6" id="noClass" class="list">강의내역이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${lists !=null }">
						<c:forEach items="${lists }" var="item">
							<tr class="list_tr">
								<td class="list cno">${item.cno }</td>
								<td class="list time">${item.time }</td>
								<td class="list level">${item.level }</td>
								<td class="list classmate">${item.classmate }</td>
								<fmt:formatDate value="${item.s_day }" pattern="yyyy-MM-dd"
									var="date" />
								<td class="list date">${date}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div id="paging">
				<c:if test="${pageMaker.prev}">
					<a href="teacherClass?page=${pageMaker.startPage-1 }"><span
						class="paginBtn">&laquo;</span></a>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<a href="teacherClass${pageMaker.makeQuery(idx) }"><span
						class="pageNum" ${pageMaker.cri.page == idx? 'id=active' : ''}>${idx }</span></a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a href="teacherClass?page=${pageMaker.endPage+1}"><span
						class="paginBtn">&raquo;</span></a>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>