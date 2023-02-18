<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WORKFIT</title>
        <!-- App favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/workfitLogoCut.png">

        <!-- App css -->
        <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath }/resources/assets/css/app-modern.min.css" rel="stylesheet" type="text/css" id="light-style">
		
		<!-- 애니메이션 css -->
		<link href="/resources/assets/css/dashAni.css" rel="stylesheet" type="text/css">
		
<style>
.hide{
	display:none;
}


.blackBtn{
	background-color:black; color:white; border-radius:27px;
}
</style>
</head>
<!-- <body style="background-color:white;"> -->
<body style="background-color:rgb(250,251,254);">
		<div id="openingCard" class="col-12 text-center align-items-center">
			<img src="/resources/opening/WORKFITopening.gif" alt="오프닝" width=600px; height=600px;></img>
			<div class="pt-1">
				<h1 class="apple6" style="font-size:130px;color:black;">WORKFIT</h1>
			</div>
			<div>	
				<button id="start" style="width:270px;font-size:37px; border-radius:51px !important;" class="blackBtn pl-3 pr-3 pt-2 pb-2 apple8">시작하기</button>
			</div>
			<div class="pt-3">
				<p class="apple7" style="font-size:61px;color:black;">우리가 만든 그룹웨어 워크핏</p>
			</div>
<!-- 			<div class="text-center"> -->
<!-- 				<h1 class="h1 apple6" style="font-size:200px; color:black;">WORKFIT</h1> -->
<!-- 			</div> -->
		</div>
		
		
		
		
<!--  로그인 카드  -->
<div id="loginCard" class="account-pages mt-5 mb-5 hide">
	<div class="container">
    	<div class="row justify-content-center">
        	<div class="card shadow-lg" style="border-radius:27px; width:640px; height:600px;">
					<div class="card-body text-center p-5">
						<img src="">
						<div class="text-center w-75 m-auto">
							<h1 class="apple5 text-dark text-center mt-3 mb-4"
								style="font-size: 50px;">WORKFIT</h1>
						</div>
						<form action="/login" method="post" class="text-center">
							<div class="form-group pt-2 col-8 ml-5">
								<input class="apple4 form-control" type="text" name="username"
									required="" placeholder="아이디">
								<div class="apple4 input-group input-group-merge mt-2">
									<input type="password" id="password" name="password"
										class="form-control" placeholder="비밀번호">
									<div class="input-group-append" data-password="false">
										<div class="input-group-text">
											<span class="password-eye"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group mb-3 ">
								<div
									class="custom-control custom-checkbox custom-checkbox-secondary">
									<input type="checkbox" class="custom-control-input"
										id="checkbox-signin" name="remember-me" checked=""> <label
										class="apple3 custom-control-label mt-2" for="checkbox-signin">로그인
										상태 유지 </label>
								</div>
							</div>
							<input
								style="width: 120px; font-size: 17px;"
								type="submit" class="apple7 blackBtn btn" value="로그인">
							<sec:csrfInput/>

								<p class="text-muted mt-3 mb-2">
									<a href="pages-register.html" class="apple2 text-muted ml-1"><b>아이디
											또는 비밀번호를 잊으셨나요?</b></a>
								</p>
						</form>
					</div>
				</div>
            <!-- end card -->
        	<!-- end row -->
      	</div>
    	<!-- end row -->
	</div>
  	<!-- end container -->
</div>

</body>
<script>
console.log(131232132)
if("${state}" == 'success'){
	alert("카드돌립시다..")
}

var start = document.querySelector("#start");

start.onclick=()=>{
var openingCard = document.querySelector("#openingCard");
var loginCard = document.querySelector("#loginCard");
	openingCard.classList.add("fadeout");
	openingCard.classList.add("hide");
	loginCard.classList.remove("hide");
	loginCard.classList.add("fadein");

}

</script>
</html>
