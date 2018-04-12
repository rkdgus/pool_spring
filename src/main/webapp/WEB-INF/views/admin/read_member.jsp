<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>대구 아이티 수영장 - 관리자모드</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#content{
	overflow: hidden;
}
	#member_table th, #classList th{            
		background: #333333;
		color: #ccc;
              
	}    
	#member_table{
	float: left;
	width: 35%;
	font-size: 15px;
	border-collapse: collapse;
	margin-left:30px;                           
}

#member_table tr,#classList tr {
	line-height: 30px;          
	height: 30px;
	border: 1px solid #ccc;
}



#member_table td, #classList td {
	color: #9a9a9a;
	text-align: center;
}

#member_table th, #member_table td ,#classList td,#classList th
	{
	line-height: 30px;
	height: 30px;
}     
#classList{
	width:40%;
	float: left;
	margin-left:100px;
	font-size: 15px;
	border-collapse: collapse;
}
 #wrap_return{
 	width:100%;
 	margin-bottom:30px;                       
 }                          
 #wrap_return a{
 	padding: 5px;
	background: #175c85;
	color: white;
	font-weight: bold;
	text-decoration: none;
 	
 
 }
 #wrap_return a:hover{
	 background: #373e6a;
 }

</style>
<script type="text/javascript">
	
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
			<div id="wrap_return"><a href="${pageContext.request.contextPath }/admin/member${pageMaker.makeSearch(pageMaker.cri.page)}">돌아가기</a></div>          
			<table id="member_table">
					<tr>
						<th width="100">번호</th>
						<td>${vo.mno }</td>
					</tr>
					<tr>
						<th width="100">아이디</th>
						<td>${vo.id }</td>
					</tr>
					<tr>
						<th width="100">이름</th> 
						<td>${vo.name }</td>
					</tr>
					<tr>
						<th width="100">성별</th>
						<td>${vo.gender }</td>
					</tr>
					<tr>
						<th width="100">생년월일</th>
						<td>${vo.age }</td>
					</tr>
					<tr>
						<th width="100">전화번호</th>
						<td>${vo.tell }</td>
					</tr>
					<tr>
						<th width="100">이메일</th>
						<td>${vo.email }</td>
					</tr>
					<tr>
						<th width="100">등록날짜</th>
						<td><fmt:formatDate value="${vo.date }" pattern="yyyy.MM.dd HH:mm"/></td>
					</tr>
	                         
			</table>
			<table id="classList">
				<tr>
					<th>등록내역</th>
				</tr>
				<c:if test="${classes.size()==0 }">
					<tr>
						<td>등록내역없음 </td>
					</tr>
				</c:if>
				<c:if test="${classes.size()!=0 }">
					<c:forEach items="${classes }" var="item">
						<tr>
							<td>${item } </td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>