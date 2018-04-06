<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 대구 아이티 수영장</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/join/joinStep3.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#year").append("<option>선택</option>");
		$("#month").append("<option>선택</option>");
		$("#date").append("<option>선택</option>");
		for(var i=2018;i>1950;i--){
			$("#year").append("<option>"+i+"</option>");
		}
		
		for(var i=1;i<13;i++){
			if(i<10){
				$("#month").append("<option>0"+i+"</option>");
			}else{
				$("#month").append("<option>"+i+"</option>");
			}
		}
		
		for(var i=1;i<32;i++){
			
			if(i<10){
				$("#date").append("<option>0"+i+"</option>");
			}else{
				$("#date").append("<option>"+i+"</option>");
			}
			
		}
		
		$("#e").change(function(){
			$("#email2").val($(this).val());
		})
		
		$("#next").click(function(){
			return false;
			$.ajax({
				url:"/pool/join/checkMno",
				type:"post",
				dataType:"text",
				data:{"mno":$("#mno").val()},
				success:function(result){
					console.log(result);
					if(result=="fail"){
						alert("회원이 아닙니다. 회원번호를 확인해주세요.");
					}else{
						alert("회원이 입니다.");
					}
				}
			})
		})
	})
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
		<div id="container">
			<jsp:include page="contentTitle.jsp" />
			<table id="table_title"
			style='background:url("${pageContext.request.contextPath }/resources/images/bg02.gif") repeat-x;'>
			<tbody>
				<tr>
					<td align="left"><img
						src="${pageContext.request.contextPath }/resources/images/bg01.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_01.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_02.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_03_on.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_04.gif">
					</td>
					<td><img
						src="${pageContext.request.contextPath }/resources/images/j_arrow.gif">
					</td>
					<td align="center"><img
						src="${pageContext.request.contextPath }/resources/images/guide_05.gif">
					</td>
					<td align="right"><img
						src="${pageContext.request.contextPath }/resources/images/bg03.gif">
					</td>
				</tr>
			</tbody>
		</table>
		<div id="join_content">
			<h2>회원가입 인증</h2>
			<h6>안전한 회원가입을 위하여 가입인증을 진행해 주십시오.</h6>
			<div id="confirm">
				<table>
					<tr>
						<td class="td">회원번호</td>
						<td><input type="text" id="mno" placeholder="회원 번호"  class="tf"></td>
					</tr>
				</table>
				
				<table>
					<tr>
						<td class="td">이름</td>
						<td><input type="text" id="name" placeholder="이름" class="tf"></td>
					</tr>
					<tr>
						<td class="td">생년월일</td>
						<td>
							<select id="year"></select>
							<select id="month"></select>
							<select id="date"></select>
						</td>
					</tr>
					<tr>
						<td class="td">전화번호</td>
						<td>
							<input type="tel" id="tell1"> -
							<input type="tel" id="tell2"> -
							<input type="tel" id="tell3">
						</td>
					</tr>
					<tr>
						<td class="td">이메일</td>
						<td>
							<input type="text" id="email1" class="tf">
							@
							<input type="text" id="email2" class="tf">
							<select id="e">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="daum.net">daum.net</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="joinbtnGroup">
			<a href="#" id="next"><img
				src="${pageContext.request.contextPath }/resources/images/btn_ok.gif"></a>
			<a href="${pageContext.request.contextPath }/login/login"><img
				src="${pageContext.request.contextPath }/resources/images/btn_cancel.gif"></a>
		</div>
		</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>