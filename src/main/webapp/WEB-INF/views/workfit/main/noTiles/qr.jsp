<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR인증</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
        <meta content="Coderthemes" name="author">
        <!-- App favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/logo/workfitLogo.png">

        <!-- App css -->
        <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath }/resources/assets/css/app-modern.min.css" rel="stylesheet" type="text/css" id="light-style">
        <link href="${pageContext.request.contextPath }/resources/assets/css/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" disabled="disabled">
		
		<!-- 애니메이션 css -->
		<link href="/resources/assets/css/dashAni.css" rel="stylesheet" type="text/css">


<style>		
.blackBtn{
	background-color:black; color:white; border-radius:27px;
}

input:focus{
	outline:none;	
}

input::placeholder{
	color: #9da9b0;
}

input:focus::placeholder {
  color: transparent;
}

</style>		
</head>
<script>

function fn_verify(){
// 	console.log($("#simpleinput").val());
	var nums = $("#simpleinput").val();
	
	var encodedKey = '${resultMap.encodedKey}';
// 	console.log(encodedKey);
// 	console.log(nums);
	
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	
	$.ajax({
		type : "post",
		url : "/otp/verify",
		data : JSON.stringify({"encodedKey" : encodedKey, "otpNumber" : nums}),
		contentType : "application/json; charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
		},
		success : function(res){
			console.log(res); 
			if(res == "success"){
				location.href = "/workfit/main?flag=commuteSuccess";
			}else{
				
				$("#pleaseInsertNum").text("인증번호가 틀립니다. 다시 입력해주세요.");
				$("#pleaseInsertNum").removeClass("text-muted");
				$("#pleaseInsertNum").css("color","red");
			}
			
		
		}
	});
	
	
}
</script>
<body class="authentication-bg" data-layout-config="{&quot;darkMode&quot;:false}">
        <div id="qrBox" class="account-pages mt-5 mb-5 fadein">
            <div class="container">
                <div class="row justify-content-center">

	                 <div class="card shadow-lg " style="border-radius:27px; width:640px; height:700px;">
	
						<div class="card-body text-center p-5 mt-4">
							<!-- 환영문구 -->
							<div class="text-center w-75 m-auto">
								<h1 class="apple4 text-dark text-center mt-3 mb-1">${resultMap.memName }님, 
									안녕하세요!</h1>
							</div>
							<!-- QR 이미지 -->
							<img class="rounded"
								src="${resultMap.url }"
								style="widht: 300px; height: 300px;"><br> 
								<span class="apple5 text-muted mt-2" id="pleaseInsertNum"></span> 
								<div>
									<input id="simpleinput" style="font-size: 24px; width: 240px; border:none; border-bottom:1px solid #8e9399; color:#9da9b0;" type="text" class="apple5 mt-2 mb-2 text-center" placeholder="인증번호를 입력해주세요">
								</div>
							<button id="qrInsert" type="button" class="apple7 btn blackBtn" style="width: 100px; font-size: 17px;" onclick="fn_verify()">인증하기</button>
	
							<p class="text-muted mt-3 mb-3">
								<a href="/workfit/main" class="apple6 text-muted ml-1"  style="font-size: 19px;">
									출근없이 접속하기
								</a>
							</p>
	
							<p class="text-muted mt-3 mb-2">
								<a href="#" class="apple2 text-muted ml-1" style="font-size:17px;"><b>QR코드가
										보이지 않으시나요?</b></a>
							</p>
						</div>
					</div>
                        <!-- end card -->
                        <!-- end row -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->

        <footer class="footer footer-alt">
            2022 - 2024 © Hyper - Coderthemes.com
        </footer>

        <!-- bundle -->
        <script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>
        
    

</body>


</html>