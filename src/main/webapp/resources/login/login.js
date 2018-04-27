$(function(){
	$("#loginBtn").click(function(e){
		e.preventDefault();
		if($("#teacher").is(":checked")){
			$.ajax({
				url:"teacherId",
				type:"post",
				dataType:"text",
				data:{"id":$("#id").val()},
				success:function(result){
					console.log(result);
					if(result.tno==-1){
						alert("입력하신 관리자 아이디,비밀번호 중 일치하지 않은 정보가 있습니다.");
						$("#id").focus();
						$("#pw").val("");
					}else if(result.title=="퇴사"){
						alert("퇴사 강사입니다. 로그인 하실 수 없습니다.");
						$("#id").focus();
						$("#pw").val("");
					}else{
						checkTeacher();
					}
				
				}
			})
		}else{
			$.ajax({
				url:"memberId",
				type:"post",
				dataType:"json",
				data:{"id":$("#id").val()},
				success:function(result){
					console.log(result);
					if(result.mno ==-1)
						{
						alert("입력하신 회원 아이디,비밀번호 중 일치하지 않은 정보가 있습니다.");
						$("#id").focus();
						$("#pw").val("");
						return;
					}else if(result.isleave==true){
							alert("탈퇴회원입니다. 로그인할 수 없습니다.");
							$("#id").val("").focus();
							$("#pw").val("");
					}else{
						
						checkMember();
					} 
				}
			})
		}
	})	
})
function checkMember(){
	
	$.ajax({
		url:"member",
		type:"post",
		dataType:"text",
		data:{"id":$("#id").val(),
				"pw":$("#pw").val()},
		success:function(result){
			console.log(result);
			if(result.length==0){
				alert("입력하신 회원 아이디,비밀번호 중 일치하지 않은 정보가 있습니다.");
				$("#pw").val("");
				$("#pw").focus();
			}else{
				$("#f").append("<input type='hidden' name='title' value='회원'>");
				$("#f").submit();
			}
		}
	})

}

function checkTeacher(){
	
	$.ajax({
		url:"teacher",
		type:"post",
		dataType:"text",
		data:{"id":$("#id").val(),
				"pw":$("#pw").val()},
		success:function(result){
			console.log(result);
			if(result.length==0){
				alert("입력하신 관리자 아이디,비밀번호 중 일치하지 않은 정보가 있습니다.");
				$("#pw").val("");
				$("#pw").focus();
			}else{
				$("#f").append("<input type='hidden' name='title' value='관리자'>");
				$("#f").submit();
			}
		}
	})
}