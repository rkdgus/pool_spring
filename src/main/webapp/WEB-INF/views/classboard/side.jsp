<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<style>
	#classList ul{
		display: none;
	}
</style>

<script type="text/javascript">
	$(function(){
		$("#classList li").hover(function(){
			//$("#classList li ul").stop();
			$(this).find("ul").stop().slideDown();
			
		},function(){
			//$("#classList li ul").stop();
			$(this).find("ul").stop().slideUp();
			
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="leftArea">
		<h2>반별게시판</h2>
		<ul id="classList">
		<c:forEach var="item" items="${classList }">
			<li>
				06시
				<ul>
					<li>
					<c:if test="${item.time == '06시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>07시
				<ul>
					<li>
					<c:if test="${item.time == '07시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				08시
				<ul>
					<li>
					<c:if test="${item.time == '08시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				09시
				<ul>
					<li>
					<c:if test="${item.time == '09시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				10시
				<ul>
					<li>
					<c:if test="${item.time == '10시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				11시
				<ul>	
					<li>
					<c:if test="${item.time == '11시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				13시
				<ul>
					<li>
					<c:if test="${item.time == '13시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				14시
				<ul>
					<li>
					<c:if test="${item.time == '14시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>	
				</ul>
			</li>
			<li>
				15시
				<ul>
					<li>
					<c:if test="${item.time == '15시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>	
				</ul>
			</li>
			<li>
				16시
				<ul>
					<li>
					<c:if test="${item.time == '16시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>	
				</ul>
			</li>
			<li>
				17시
				<ul>
					<li>
					<c:if test="${item.time == '17시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				19시
				<ul>
					<li>
					<c:if test="${item.time == '19시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				20시
				<ul>
					<li>
					<c:if test="${item.time == '20시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li>
				21시
				<ul>
					<li>
					<c:if test="${item.time == '21시 00분' }">
						<a href="classboard?cno=${item.cno }">${item.cno }반/${item.level }</a>
					</c:if>
					</li>
				</ul>
			</li>
		</c:forEach>
		</ul>
	</div>
</body>
</html>