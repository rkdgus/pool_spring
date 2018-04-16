<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#attendance {
	color: white !important;
	background: #6799FF;
}
#wrap_calender{
   
   width:100%;
   height:86%;
   text-align: center;
}

#wrap_year_btn{
   width:100%;
   height:11%;
   text-align: center;
}
#wrap_year_btn h2{
   display: inline-block;
   margin:0 10px;
   padding:0;
   font-size: 25px;
}

#wrap_calender table{
   margin:0 auto;
   
   border-collapse: collapse;   
   
   width:95%;
   height:100%;
   
   
}
#wrap_calender table td{
   border-bottom:1px solid #ddd;
   padding:0;
}
#wrap_calender table th{
   border-bottom:1px solid #ddd;
   height:23px;
}
#wrap_calender table a{
   display:inline-block;
   width:100%;
   height:100%;
   margin:0;
   padding:0;
   position:relative;
}


.week, .sun, .sat{
   position: absolute;
   top:0;
   right:2px;
   font-size: 14px;
}
.week{
   color:#4c4c4c;
}
.sun, .sunName{
   color:#ff4d4d;
}
.sat, .satName{
   color:#5b5bff;
}
.holiday{
   color:#ff4d4d !important;
}
.oSpan{
   margin:0;
   padding:0;
   position:absolute !important;
   top:40% !important;
   right:0 !important;
   width:100%;
   height:23px;
   background: #ffe8e8;
   display: none;
   overflow:auto;
}
.oSpan li{
   display:inline-block;
   width:100%;
   font-size: 8px;
   overflow:hidden;
   white-space:nowrap;
   text-overflow:ellipsis;
   right:0;
}
.events{
   color:#777;
}
.to_day{
   background: #ffff77;
}

#add_month,#prev_month{
   width:30px !important;
   display: inline-block;
   height:30px;
   padding:0;
   margin:0;
   text-align: center;
   background: white;
}
#wrap_year_btn button img{
   width:20px;
   margin-top:2.5px;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<script>
	var day_id = "";
	   var newDay =new Date();
	   var year = newDay.getFullYear();
	   var month = Number(newDay.getMonth()+1);
	   var day =newDay.getDate();
	   
	   $(function(){
		   calendarUpload();
		   $("#prev_month").click(function(){
		      month--;
		      calendarUpload();
		      
		   })
		   
		   $("#add_month").click(function(){
		      month++;
		      calendarUpload();
		   })
	   })
	   
	   function calendarUpload(){
	         
	         $("#wrap_calender").empty();
	         
	         var last = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
	         //윤년 : 4년 주기이고 100년 주기는 제외 또는 400년 주기
	         if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
	            last[1] = 29;
	         }

	         if(month>12){
	            year++;
	            month=1;
	         }else if(month<1){
	            year--;
	            month=12;
	         }
	         
	         var lastDate = last[month - 1];//이번달 마지막 날짜
	         var firstDate = new Date(year, month - 1, 1);//2017.8.1
	         
	         $("#calender h2").html(firstDate.getFullYear()+"년<span id='firstMonth'>"+Number(firstDate.getMonth()+1)+"</span>월");
	         
	         var theDay = firstDate.getDay();//빈공간의 갯수
	         var row = Math.ceil((lastDate+theDay)/ 7);

	         var calendar = "<table>";
	         calendar += "<tr>";
	         calendar += "<th class='sunName'>일</th>";
	         calendar += "<th>월</th>";
	         calendar += "<th>화</th>";
	         calendar += "<th>수</th>";
	         calendar += "<th>목</th>";
	         calendar += "<th>금</th>";
	         calendar += "<th class='satName'>토</th>";
	         calendar += "</tr>";
	         
	         var newDay2 = new Date();
	         var n2Y=newDay2.getFullYear();
	         var n2M=newDay2.getMonth();
	         var n2D=newDay2.getDate();
	         
	         
	         var dNum = 1;//화면에 표시될 날짜
	         for (var i = 1; i <= row; i++) {
	            calendar += "<tr>";
	            
	            for (var k = 1; k <= 7; k++) {//한주
	               
	               if (i == 1 && k<=theDay||dNum >lastDate) {//빈공간처리
	                  calendar += "<td>&nbsp;</td>";
	               } else if(k==1) {//숫자표시
	                  calendar += "<td class='show_num'><a href='#' ><span class='sun'>" + dNum + "</span><ul class='oSpan'></ul></a></td>";
	                  dNum++;
	               } else if(k==7){
	                  calendar += "<td class='show_num'><a href='#' ><span class='sat'>" + dNum + "</span><ul class='oSpan'></ul></a></td>";
	                  dNum++;
	               }else{
	                  calendar += "<td class='show_num'><a href='#'><span class='week'>" + dNum + "</span><ul class='oSpan'></ul></a></td>";
	                  dNum++;
	               }
	            }
	            calendar += "</tr>";
	         }
	         calendar += "</table>";
	         $("#wrap_calender").append(calendar);
	         
	        /// selectEvent();
	         
	         if($("#calender h2").text()==n2Y+"년"+Number(n2M+1)+"월"){      
	            $(".show_num").eq(Number(n2D-1)).addClass("to_day");
	            $(".show_num").eq(Number(n2D-1)).addClass("click_day");
	         }
	             
	         
	         $("#event_day").text(n2Y+"년"+Number(n2M+1)+"월"+n2D+"일");
	         
	         $(".week").parent().parent().css("border-left","1px solid #FBF5FF");
	         $(".week").parent().parent().css("border-right","1px solid #FBF5FF");
	         
	     
	   }
	   

	   function resetToDay(){
	      newDay =new Date();
	      year = newDay.getFullYear();
	      month = Number(newDay.getMonth()+1);
	      day =newDay.getDate();
	      calendarUpload();
	   }
	   
	</script>
	<div id="container">
		<jsp:include page="side.jsp" />
		<div id="content">
			<jsp:include page="attendanceTitle.jsp" />
			<div id="mypage_content">
				<div id="calender">
					<div id="wrap_year_btn">
						<button id='prev_month'>
							<img src='img/play2.png'>
						</button>

						<h2></h2>

						<button id='add_month'>
							<img src='img/play.png'>
						</button>
					</div>
					<div id="wrap_calender"></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>