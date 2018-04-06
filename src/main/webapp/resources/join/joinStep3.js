/**
 * 
 */

var check=-1;
	$(function(){
		
		$("#next").click(function(e){
			
			if($("#mno").val()==""){
				alert("회원번호를 입력하세요!");
				$("#mno").focus();
				return;
			}else{
				$.ajax({
					url:"/pool/join/checkMno",
					type:"post",
					dataType:"json",
					data:{"mno":$("#mno").val()},
					success:function(result){
						
						console.log(result);
						if(result.mno==-1){
							alert("존재하지 않는 회원입니다. 회원번호를 확인해주세요.");
							
							$("#name").val("");
							$("#age").val("");
							$("#tell1").val("");
							
							$("#tell2").val("");
							$("#tell3").val("");
							
							$("#email1").val("");
							$("#email2").val("");
							
							$("#men").removeAttr("checked");
							$("#women").removeAttr("checked");
							check=-1;
						}else{
							alert("반갑습니다"+result.name+" 회원님");
							check=1;
							
							$("#name").val(result.name);
							$("#age").val(result.age);
							
							var p = result.tell;
							var e = result.email;
							var g = result.gender;
							
							$("#tell1").val(p.substr(0, p.indexOf("-")));
							$("#tell2").val(p.substring(p.indexOf("-")+1, p.lastIndexOf("-")));
							$("#tell3").val(p.substr(p.lastIndexOf("-")+1));
							
							$("#email1").val(e.substr(0, e.indexOf("@")));
							$("#email2").val(e.substr(e.indexOf("@")+1));
							
							if(g=="남"){
								$("#men").attr("checked","checked");
							}else if(g=="여"){
								$("#women").attr("checked","checked");
							}
							
	
						}
					}
				})
			}
			
			
		})
		
		
		$("#nextJoin").click(function(e){
			e.preventDefault();
			
			if(check<0){
				alert("회원번호 확인을 해주세요");
			}else{
				location.href="joinStep4?mno="+$("#mno").val();
				//back버튼을 누르게 되면 alert로 취소할껀지 물어보고 취소하면 로그인 화면으로
			}
		})
		
	
	})
