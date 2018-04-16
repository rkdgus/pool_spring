<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	.myinfo{
		font-size: 14px !important;
	
	}
	#class{
		cursor: default !important;
	}
	#class:HOVER {
	color: #34AAD5 !important;
	background: none !important;
}
    </style>
	<div id="leftArea">
		<h2>마이페이지</h2>
		<ul>
		<li><a href="#" id="class">강의정보</a>
			<ul>
				<li><a href="${pageContext.request.contextPath }/teacherpage/attendance?tno=${login.tno}" id="attendance" class="myinfo">출석현황</a></li>
				<li><a href="${pageContext.request.contextPath }/teacherpage/teacherClass?tno=${login.tno}" class="myinfo">강의내역</a></li>
			</ul>
		</li>
			
			<li><a href="${pageContext.request.contextPath }/teacherpage/teacherInfo?tno=${login.tno}">강사정보</a>
				<ul>
					<li><a href="${pageContext.request.contextPath }/teacherpage/updateteacherStep1" class="myinfo">개인정보 수정</a></li>
					<li><a href="${pageContext.request.contextPath }/teacherpage/updatePwStep1" class="myinfo">비밀번호 변경</a></li>
				</ul>
			</li>
		</ul>
	</div>
