/**
 * 
 */
var id = -1;
		var pwconfirm =-1;
		var pw=-1;
		
		$(function(){
			
			$("#pwImg").hover(function(e) {
				$("#pwInfo").show();
			}, function(e) {
				$("#pwInfo").hide();
			})
			
			$("#id").keyup(function(){
				id = -1;
				$("#idCheck").text("중복확인");
			})
			
			$("#idCheck").click(function(){
				var reg =/^(?=.*[a-zA-Z])[A-Za-z\d]{6,15}$/;
				
				if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					return;
				}
				if($("#id").val().length<6){
					alert("아이디는 최소 6자리 이상입니다.");
					return;
				}
				
				if(!reg.test($("#id").val())){
					alert('아이디는 6~15자\n 영문,숫자만 가능합니다');
					return;
				}
				$.ajax({
					url:"/pool/join/idCheck",
					type:"post",
					dataType:"text",
					data:{"id":$("#id").val(),
							"mno":$("#mno").text()},
					success:function(result){
						console.log(result);
						if(result=="already"){
							alert("이미 회원가입이 되어 있습니다.\n 홈페이지를 바로 이용하실 수 있습니다.");
							id=-1;
						}else if(result=="success"){
							id=1;
							alert("사용가능한 아이디 입니다.");
							$("#idCheck").text("사용가능");
						}else{
							alert("이미 사용중인 아이디 입니다.");
							id=-1;
						}
					}
				})
			})
			
			$("#next").click(function(e){
				e.preventDefault();
				
				var reg =/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~@$!#%^&*])[A-Za-z\d~@$!#%^&*]{8,20}$/;
				if(reg.test($("#pw").val())){
					pw=1;
				}else{
					pw=-1;
				}
				
				if(id<0){
					alert("아이디 중복확인을 해주세요.");
					$("#id").focus();
					return;
				}
				
				if(pw<0){
					alert("사용불가능한 비밀번호 입니다.\n비밀번호 안내문을 참고해 주세요.");
					$("#pw").focus();
					return;
				}
				
				if(pwconfirm<0||($("#pw2").val()!=$("#pw").val())){
					alert("비밀번호가 일치하지 않습니다\n 비밀번호 확인란을 확인해 주세요.");
					$("#pw2").focus();
					return;
				}
				if(id>0&&pw>0&&pwconfirm>0){
					$.ajax({
						url:"/pool/join/updateIdPw",
						type:"post",
						dataType:"text",
						data:{"id":$("#id").val(),
								"mno":$("#mno").text(),
								"pw":$("#pw").val()},
						success:function(result){
							console.log(result);
							if(result=="success"){
								alert("회원가입 되었습니다.");
								location.href="joinStep5?mno="+$("#mno").text();
							}else{
								alert("회원가입 실패");
							}
						}
					})
				}
				
			})
			
			$("#pw").keyup(function(){
				if($("#pw").val()!= $("#pw2").val()){
					pwconfirm=-1;
					$("#err").css("display","inline");
					$('#ok').css("display","none");
				}else{
					pwconfirm=1;
					$("#ok").css("display","inline");
					$('#err').css("display","none");
				}
			})
			
			$("#pw2").keyup(function(){
				if($("#pw").val()!= $("#pw2").val()){
					pwconfirm=-1;
					$("#err").css("display","inline");
					$('#ok').css("display","none");
				}else{
					pwconfirm=1;
					$("#ok").css("display","inline");
					$('#err').css("display","none");
				}
			})
			
		})
	