<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2{
		font-size:16px !important;
		margin-bottom:25px !important;    
		font-weight: bold !important;
	}  
	#list_ul{
		margin-bottom:25px !important;  
	} 
	#list_ul li{
		padding-left:30px;
		font-size:13px !important; 
	}
	.classtime_table{
		width:725px; 
		text-align: center;
		font-size:13px;
	}
	.classtime_table tr{
		padding:10px 0;
		height:45px;   
	}
	.classtime_table tr:FIRST-CHILD{
		border-top: 2px solid #333333;
	}
	.classtime_table tr th{
		background-color: #f3f3f3;
		font-weight: bold !important;
	}
	.classtime_table tr th, .classtime_table tr td{
		vertical-align: middle;
		border-left: 1px solid #e0e0e0;
    	border-bottom: 1px solid #b3b3b3; 
	}
	#h3_span{
		font-size:13px;
		margin-top:10px;
		margin-bottom:20px;
		font-weight: bold;
	}
	.red_color{color:red}
	.blue_color{color:blue}
	.td_class{   
		text-align: justify;
		padding-left:3px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div id="container">
			<jsp:include page="side.jsp" />
		<div id="content">   
			<jsp:include page="contentTitle.jsp" />  
			<h2><img src="${pageContext.request.contextPath }/resources/img/classtime.png"> 수강접수 기간 안내(선착순)</h2>
			<ul id="list_ul">
				<li>-인터넷접수:매월 15일~20일</li>
				<li>-방문접수:매월 20일~말일</li>
			</ul>
			<h2><img src="${pageContext.request.contextPath }/resources/img/classtime.png"> 수강시간</h2>
			<table class="classtime_table">
				<tr>
					<th width="78">요일</th>
					<th width="188">수강반</th>
					<th width="278">수강시간</th> 
					<th width="98">수강료</th>
					<th width="78">비고</th>
				</tr>
				<tr>
					<th rowspan="13">평일반</th>
					<td rowspan="3">새벽반</td>
					<td >06:00 ~ 07:00</td>
					<td rowspan="13">50,000원</td>   
					<td rowspan="13">주 5회</td>
				</tr>
				<tr>
					<td >07:00 ~ 08:00</td>
				</tr>
				<tr>   
					<td >08:00 ~ 09:00</td>
				</tr>
				<tr>
					<td rowspan="3">오전반</td>
					<td >09:00 ~ 10:00</td>
				</tr>
				<tr> 
					<td >10:00 ~ 11:00</td>
				</tr>
				<tr>
					<td >11:00 ~ 12:00</td>
				</tr>
				<tr>
					<td rowspan="4">오후반 </td> 
					<td >13:00 ~ 14:00</td>
				</tr>
				<tr>
					<td >14:00 ~ 15:00</td>
				</tr>
				<tr>
					<td >15:00 ~ 16:00</td>
				</tr>
				<tr>
					<td >17:00 ~ 18:00</td>
				</tr>
				<tr>
					<td rowspan="3">저녘반</td>
					<td >19:00 ~ 20:00</td>
				</tr>
				<tr>
					<td >20:00 ~ 21:00</td>
				</tr>
				<tr>
					<td >21:00 ~ 22:00</td>
				</tr>
				<tr>
					<th>주말반</th>
					<td>자유수영</td> 
					<td>06:00 ~ 22:00</td>
					<td>2,200원</td>
					<td></td> 
				</tr>
			</table>
			<h3 id="h3_span">
				<span class="red_color">※ 주의 : </span><span class="blue_color">강습반은 월별로 달리 편성될 수 있으므로 </span>
				<span class="red_color">해당 월의 강습편성 내역</span><span class="blue_color">을 반드시</span>
				<span class="red_color">『공지사항』에서 확인하시기 바랍니다</span>
			</h3>
			<h2><img src="${pageContext.request.contextPath }/resources/img/classtime.png"> 수영과정별 수강내용</h2>
			<table class="classtime_table">
				<tr>
					<th width="100">수강반</th>
					<th width="120">소요시간</th>
					<th width="250">수영과정별</th>
					<th width="250">지도내용</th>
				</tr>
				<tr>
					<th>초급</th>
					<td>1개월</td>
					<td>초보자 및 1개월 강습자</td>
					<td>기초호흡, 발차기, 자유형 완성</td>
				</tr>
				<tr>
					<th>중급</th>
					<td>1~2개월</td>
					<td>자유형 15M 이상, 배영킥 20M 이상</td>
					<td>자유형 복습, 배영 완성</td>
				</tr>
				<tr>
					<th>고급</th>
					<td>2~3개월</td>
					<td>자유형 배영, 평영 15M 이상</td>
					<td>자유형, 배영 복습, 평영 완성</td>
				</tr>
				<tr>
					<th>상급</th>
					<td>3~4개월</td>
					<td class="td_class">자유형, 배영, 평영 25M 이상, 접영 15M이상</td>
					<td>자유형, 배영, 평영 복습, 접영 완성</td>
				</tr>
				<tr>
					<th>연수</th>
					<td>10개월 ~ 1년</td>
					<td class="td_class">자유형, 배영, 평영, 접영 50M, 자유형, 평영 100M</td>
					<td class="td_class">자유형, 평영, 접영, 지구력 배양, 기본 배영, 트루젠 I-M, 턴, 스타트(중급)</td>
				</tr>
				
			</table>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>