<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	.myinfo{
		font-size: 14px !important;
	
	}
    </style>
	<div id="leftArea">
		<h2>마이페이지</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath }/mypage/attendance" id="attendance">출석현황</a></li>
			<li><a href="">수강내역</a></li>
			<li><a href="${pageContext.request.contextPath }/mypage/memberInfo">회원정보</a>
				<ul>
					<li><a href="${pageContext.request.contextPath }/mypage/updateMemberStep1" class="myinfo">개인정보 수정</a></li>
					<li><a href="${pageContext.request.contextPath }/mypage/updatePwStep1" class="myinfo">비밀번호 변경</a></li>
					<li><a href="" class="myinfo">탈퇴신청</a></li>
				</ul>
			</li>
			<li><a href="${pageContext.request.contextPath }/mypage/myPageQna?id=${login.id}">문의내역</a></li>
			

		</ul>
	</div>
