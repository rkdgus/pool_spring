<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 대구 아이티 수영장</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/join/joinStep3.css">
<style>
	
	#next{
		margin-top:5px;
		height:30px;
		border: 2px solid #5c5c5c;
		background:#5c5c5c;
		border-radius:15px;
		outline:none;
		color:white;
		font-size: 13px;
		padding-left:15px;
		padding-right:15px;
		cursor: pointer;
		font-weight: 600;
	}
	#next:HOVER {
	background: black;
}
	
	
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
	var check=-1;
	$(function(){
		
		$("#next").click(function(e){
			
			if($("#mno").val()==""){
				alert("회원번호를 입력하세요!");
				$("#mno").focus();
				return;
			}else{
				$.ajax({
					url:"/pool/join/checkMno",
					type:"post",
					dataType:"json",
					data:{"mno":$("#mno").val()},
					success:function(result){
						
						console.log(result);
						if(result.mno==-1){
							alert("존재하지 않는 회원입니다. 회원번호를 확인해주세요.");
							check=-1;
						}else{
							alert("반갑습니다"+result.name+" 회원님");
							check=1;
							$("#name").val(result.name);
							$("#age").val(result.age);
							var p = result.tell;
							var e = result.email;
							$("#tell1").val(p.substr(0, p.indexOf("-")));
							$("#tell2").val(p.substring(p.indexOf("-")+1, p.lastIndexOf("-")));
							$("#tell3").val(p.substr(p.lastIndexOf("-")+1));
							
							$("#email1").val(e.substr(0, e.indexOf("@")));
							$("#email2").val(e.substr(e.indexOf("@")+1));
						}
					}
				})
			}
			
			
		})
		
		
		$("#nextJoin").click(function(e){
			e.preventDefault();
			
			if(check<0){
				alert("회원번호 확인을 해주세요");
			}else{
				location.href="${pageContext.request.contextPath }/join/joinStep4";
			}
		})
		
	
	})

</script>
	
	
	
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
						<td><input type="text" id="mno" placeholder="회원 번호"  class="tf">
							<button id="next">회원번호 확인</button>
						</td>
					</tr>
				</table>
				
				<table id="mem">
					<tr>
						<td class="td">이름</td>
						<td><input type="text" id="name" placeholder="이름" class="tf" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="td">생년월일</td>
						<td>
							<input type="text" id="age" class="tf" placeholder="생년월일" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class="td">전화번호</td>
						<td>
							<input type="tel" id="tell1" readonly="readonly"> -
							<input type="tel" id="tell2" readonly="readonly"> -
							<input type="tel" id="tell3" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class="td">이메일</td>
						<td>
							<input type="text" id="email1" class="tf" readonly="readonly">
							@
							<input type="text" id="email2" class="tf" readonly="readonly">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="joinbtnGroup">
			<a href="#" id="nextJoin"><img
				src="${pageContext.request.contextPath }/resources/images/btn_ok.gif"></a>
			<a href="${pageContext.request.contextPath }/login/login"><img
				src="${pageContext.request.contextPath }/resources/images/btn_cancel.gif"></a>
		</div>
		</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>