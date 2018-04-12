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
			
			<li>
				06시
				<ul id="t6">
					
				</ul>
			</li>
			<li>07시
				<ul id="t7">
					
				</ul>
			</li>
			<li>
				08시
				<ul id="t8">
					
				</ul>
			</li>
			<li>
				09시
				<ul id="t9">
					
				</ul>
			</li>
			<li>
				10시
				<ul id="t10">
					
				</ul>
			</li>
			<li>
				11시
				<ul id="t11">	
					
				</ul>
			</li>
			<li>
				13시
				<ul id="t13">
					
				</ul>
			</li>
			<li>
				14시
				<ul id="t14">
						
				</ul>
			</li>
			<li>
				15시
				<ul id="t15">
					
				</ul>
			</li>
			<li>
				16시
				<ul id="t16">
					
				</ul>
			</li>
			<li>
				17시
				<ul id="t17">
					
				</ul>
			</li>
			<li>
				19시
				<ul id="t19">
					
				</ul>
			</li>
			<li>
				20시
				<ul id="t20">
					
				</ul>
			</li>
			<li>
				21시
				<ul id="t21">
					
				</ul>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url:"sidebar",
				type : "post",
				dataType : "json",
				success : function(json) {
					if(json.length!=0){
						for(var i=0; i< json.length; i++){
							var a = $("<a>").attr("href","classboard?cno="+json[i].cno).text(json[i].cno+"반/"+json[i].level);
							var li = $("<li>").append(a);
							if(json[i].time=="06시 00분"){
								$("#t6").append(li);
							}else if(json[i].time=="07시 00분"){
								$("#t7").append(li);
							}else if(json[i].time=="08시 00분"){
								$("#t8").append(li);
							}else if(json[i].time=="09시 00분"){
								$("#t9").append(li);
							}else if(json[i].time=="10시 00분"){
								$("#t10").append(li);
							}else if(json[i].time=="11시 00분"){
								$("#t11").append(li);
							}else if(json[i].time=="13시 00분"){
								$("#t13").append(li);
							}else if(json[i].time=="14시 00분"){
								$("#t14").append(li);
							}else if(json[i].time=="15시 00분"){
								$("#t15").append(li);
							}else if(json[i].time=="16시 00분"){
								$("#t16").append(li);
							}else if(json[i].time=="17시 00분"){
								$("#t17").append(li);
							}else if(json[i].time=="19시 00분"){
								$("#t19").append(li);
							}else if(json[i].time=="20시 00분"){
								$("#t20").append(li);
							}else if(json[i].time=="21시 00분"){
								$("#t21").append(li);
							}
						}
					}
				}
			})
		})
	</script>
</body>
</html>