var index = 1;
		var filesArr = {};
		var previewIndex = 0;
		var deleteIndex = 0;
		var e = "";

		$(function() {

			$("#eselect").change(function() {
				$("#email2").val($(this).val());
			})
			$(document).on("click","#test",function(){
					$("#test").text(randomRequire());
			})
			$("#test").text(randomRequire());

			$("#fileUpload").click(function() {
				filesArr = {};
				previewIndex = 0;
				deleteIndex = 0;
				console.log("file선택");
				$("#fileList").trigger("click");
			})

			$("#allCheck").change(function() {
				if ($("#allCheck").is(":checked")) {
					$(".delcheck").attr("checked", "checked");
				} else {
					$(".delcheck").removeAttr("checked");
				}
			})

			$("#qnaInsert").click(function(e) {
				e.preventDefault();
				if ($("#title").val() == "") {
					alert("제목을 입력하세요.(필수 사항입니다) ");
					$("#title").focus();
					return;
				}
				if ($("#con").val() == "") {
					alert("내용을 입력하세요.(필수 사항입니다)");
					$("#con").focus();
					return;
				}

				if ($("#name").val() == "") {
					alert("이름을 입력하세요.(필수 사항입니다)");
					$("#name").focus();
					return;
				}

				if ($("#email1").val() == "" || $("#email2").val() == "") {
					alert("이메일을 올바르게 입력하세요(필수사항입니다)");
					$("#email1").focus();
					return;
				}

				if ($("#pw").val() == "") {
					alert("비밀번호를 입력해주세요(필수사항입니다)");
					$("#pw").focus();
					return;
				}

				if ($("#test2").val() == "") {
					alert("자동입력방지를 입력해 주세요(필수사항입니다)");
					$("#test2").focus();
					return;
				}

				if (!$("#check").is(":checked")) {
					alert("개인정보 수집 및 이용에 동의해 주세요.");
					$("#check").focus();
					return;
				}

				if ($("#test").text() != $("#test2").val()) {
					alert("자동입력 방지가 일치하지 않습니다.");
					$("#test").text(randomRequire());
					$("#test2").val("").focus();
					return;
				}

				submitBtn();
			})

			$(document)
					.on(
							"change",
							"#fileList",
							function() {

								$("#preview_t").find("tr").not("#basic")
										.remove();
								var file = document.getElementById("fileList");

								var reader = new FileReader();
								reader.onload = function(e) {
									var imgNum = previewIndex++;
									var f = file.files[index - 1];

									$("#preview_t")
											.append(
													"<tr><td><input type='checkbox' class='delcheck'></td>"
															+ "<td><img src='"+e.target.result+"' class='imgs'>"
															+"<span class='hiddenSpan'>"
															+ imgNum
															+ "</span>"
															+"</td></tr>");

									filesArr[imgNum] = f;
								};

								reader.readAsDataURL(file.files[0]);

								reader.onloadend = function(e) {
									if (index >= file.files.length) {
										index = 1;
										return;
									}
									reader.readAsDataURL(file.files[index]);
									index += 1;

								}
							})

		})
		$(document).on(
				"click",
				"#close",
				function() {
					console.log(filesArr);
					$("#count")
							.text(
									" " + Object.keys(filesArr).length
											+ "개가 선택 되었습니다.");
				})

		function submitBtn() {

			var formData = new FormData();

			for (var i = 0; i < Object.keys(filesArr).length + deleteIndex; i++) {

				formData.append("fileList", filesArr[i]);
			}
			var c = $("#con").val();
			var title = $("#title").val();
			var content = c.replace(/(?:\r\n|\r|\n)/g, '<br />');
			var email = $("#email1").val() + "@" + $("#email2").val();
			var pw = $("#pw").val();
			var id = $("#id").val();
			var writer = $("#name").val();
			formData.append("writer",writer);
			formData.append("id",id);
			formData.append("pw",pw);
			formData.append("email",email);
			formData.append("content",content);
			formData.append("title",title);
			$.ajax({
				url : "insert",
				data : formData,
				type : "post",
				processData : false,
				contentType : false,
				dataType : "text",
				success : function(result) {
					if(result == "success"){
						alert("상담이 접수 되었습니다.\n");
						location.href="qnaBoard";
					}else{
						alert("예상치 못한 오류가 발생하였습니다.");
					}
					
				}
			})
		}

		function fileDelete() {
			
			$(".delcheck").each(
					function(i, obj) {
						if ($(obj).is(":checked")) {
							var imgNum = $(obj).closest("tr").find(
									".hiddenSpan").text();
							console.log(imgNum);
							delete filesArr[imgNum];
							deleteIndex++;
							$(obj).closest("tr").remove();
						}
					})
			

			$("#allCheck").removeAttr("checked");
		}

		function randomRequire() {
			var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
			var string_length = 6;
			var randomstring = '';
			for (var i = 0; i < string_length; i++) {
				var rnum = Math.floor(Math.random() * chars.length);
				randomstring += chars.substring(rnum, rnum + 1);
			}
			return randomstring;
		}