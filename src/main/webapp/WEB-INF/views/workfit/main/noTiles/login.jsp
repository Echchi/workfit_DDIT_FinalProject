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
		
		
<style>

.blackBtn{
	background-color:black; color:white; border-radius:27px;
}		
		
		</style>
		
		

</head>
<body style="background-color:rgb(250,251,254);" class="authentication-bg" data-layout-config="{&quot;darkMode&quot;:false}">
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
	
<!-- bundle -->
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>
        
    
</body>
</html>