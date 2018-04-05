<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<style>
	#classList ul{
		display: none;
	}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#classList li").hover(function(){
			$("#classList li").stop();
			$(this).find("ul").slideToggle();
			
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
				<ul>
					<li><a href="">1반</a></li>
					<li>1반</li>
					<li>1반</li>
					<li>1반</li>
				</ul>
			</li>
			<li>07시
				<ul>
					<li>1반</li>
					<li>1반</li>
					<li>1반</li>
					<li>1반</li>
				</ul>
			</li>
			<li>08시</li>
			<li>09시</li>
			<li>10시</li>
			<li>11시</li>
			<li>12시</li>
			<li>13시</li>
			<li>14시</li>
			<li>15시</li>
			<li>16시</li>
			<li>17시</li>
			<li>18시</li>
			<li>19시</li>
			<li>20시</li>
			<li>21시</li>
		</ul>
	</div>
</body>
</html>