$(function(){
			$("#next").click(function(e){
			
				if($("#check1").prop("checked")&&$("#check2").prop("checked")){
					return true;
				}else{
					alert("약관에 모두 동의해 주세요.");
					e.preventDefault();
				}
			})
		})