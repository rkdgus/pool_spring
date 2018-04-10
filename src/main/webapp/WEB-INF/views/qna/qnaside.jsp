<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	#qna{
    		color:white !important;
    		background-color: #6799FF;
    	}
    	#leftArea{
		width:178px; !important;
	}
    </style>
	<div id="leftArea">
		<h2>문의하기</h2>
		<ul>	
			<li><a href="${pageContext.request.contextPath }/qna/qnaBoard">질문 및 답변</a></li>
			<li><a href="${pageContext.request.contextPath }/qna/qna">온라인 상담</a></li>
		
		</ul>
	</div>
