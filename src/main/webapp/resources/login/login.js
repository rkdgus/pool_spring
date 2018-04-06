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
						if(result.length==0){
							alert("관리자가 아닙니다. 아이디를 확인해주세요.");
							$("#id").focus();
							$("#pw").val("");
						}else{
							alert("관리자다");
							checkTeacher();
						}
					
					}
				})
			}else{
				$.ajax({
					url:"/pool/login/memberId",
					type:"post",
					dataType:"text",
					data:{"id":$("#id").val()},
					success:function(result){
						console.log(result);
						if(result.length==0){
							alert("회원이 아닙니다. 아이디를 확인해주세요.");
							$("#id").focus();
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