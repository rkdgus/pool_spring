$(function(){
	$("#loginBtn").click(function(e){
		e.preventDefault();
		if($("#teacher").is(":checked")){
			$.ajax({
				url:"/pool/login/teacherId",
				type:"post",
				dataType:"text",
				data:{"id":$("#id").val()},
				success:function(result){
					console.log(result);
					if(result.tno==-1){
						alert("관리자가 아닙니다. 아이디를 확인해주세요.");
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
				url:"/pool/login/memberId",
				type:"post",
				dataType:"json",
				data:{"id":$("#id").val()},
				success:function(result){
					console.log(result);
					if(result.mno ==-1)
						{
						alert("회원이 아닙니다. 아이디를 확인해주세요.");
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
		url:"/pool/login/member",
		type:"post",
		dataType:"text",
		data:{"id":$("#id").val(),
				"pw":$("#pw").val()},
		success:function(result){
			console.log(result);
			if(result.length==0){
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
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
		url:"/pool/login/teacher",
		type:"post",
		dataType:"text",
		data:{"id":$("#id").val(),
				"pw":$("#pw").val()},
		success:function(result){
			console.log(result);
			if(result.length==0){
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
				$("#pw").val("");
				$("#pw").focus();
			}else{
				$("#f").append("<input type='hidden' name='title' value='관리자'>");
				$("#f").submit();
			}
		}
	})
}