<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	
<div class="row mt-2">
	<div class="col-12">
	<div class='card mr-2 workfitCardBg' >                                                                                              
		<div class='card-body pl-4 '>                                                                                         
			<div class='card-title row'>
				<!-- 이미지 출력하기  -->
				<div class="card shadow-lg mt-3 col-3 ml-1 mr-1" style="border-radius: 27px; backdrop-filter: blur(10px);">
					<div class="card-body p-3">
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;">
							<c:choose> 
								<c:when test="${empty member.memProfileUrl }"> 
									<c:set value="${member.memName }" var="name"/>
									<h1 class="apple4 text-grey text-center" style="font-size:50px;">${fn:substring(name,0,1) }</h1>
								</c:when> 
								<c:otherwise> 
									<img alt="이미지 오류" src="${member.memProfileUrl }" style="width: 100%; height: 100%;">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="col-2 align-self-end apple3 text-dark pb-4 pl-4">
					<h1 class="apple5" style="font-size:30px;">${member.memName } <span class="apple3" style="font-size: 20px">님</span></h1> 
					<h1 class="apple5" style="font-size:25px;"> ${member.memEnName }</h1>
					<button type="button" class="workfitBtn pl-2 pr-2 apple3"  data-toggle="modal" data-target="#signup-modal"> 수정 </button>
				</div>
				<div class="col-3 align-self-end apple3 pb-4 pl-3" style="font-size: 20px;">
					<h3 style="font-size:20px;"><i class="mdi mdi-cellphone-iphone"></i> ${member.memTel }</h3>
					<h3 style="font-size:20px;"><i class="mdi mdi-email-multiple"></i> ${member.memEmail }</h3>
					
				</div>
			</div>
		</div>	
	</div>	
	</div>	
	<!-- 이미지 출력하기  -->
	<div class=" col-12 apple4 text-left text-dark">
		<hr>
		<h1 style="font-size:25px;"> 기본정보</h1>
		<h1 style="font-size:18px;"> 아이디 : ${member.memId }</h1>
		<h1 style="font-size:18px;"> 비밀번호 : ${member.memPass }</h1>
		<h1 style="font-size:18px;"> 생년월일 : <fmt:formatDate value="${member.memBirth}" pattern="yyyy/MM/dd"/> </h1>
		<hr>
		<h1 style="font-size:25px;"> 자기소개</h1>
		<h1 style="font-size:18px;"> 자기소개 : ${member.memIntro }</h1>
		<h1 style="font-size:18px;"> 직급 : ${member.memJobGrade }</h1>
		<h1 style="font-size:18px;"> 사원번호 : ${member.memDeptId }</h1>
		<h1 style="font-size:18px;"> 계약형태 : ${member.memWorktype }</h1>
		<h1 style="font-size:18px;"> 입사일 : <fmt:formatDate value="${member.memWorkStartDay}" pattern="yyyy/MM/dd"/></h1>
	
	</div>
</div>
		<!-- end of content-->
		<!-- Signup modal-->
		
		
<!--  회원 정보수정 모달  -->		
	<div id="signup-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title apple4 text-dark text-center" id="myCenterModalLabel">내 정보 수정</h4>
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            </div>
	            <div class="modal-body">
	                <div class="text-center mt-2 mb-4">
	                </div>
	                <form class="pl-3 pr-3 modifyAjax">
		                <input class="form-control" type="text" id="memId" name="memId" value="${member.memId }" hidden >
	                    <div class="form-group">
	                        <label for="profileImg">프로필사진</label>
	                        <div id="sumnailProfile">
	                        	<c:choose> 
									<c:when test="${empty member.memProfileUrl }"> 
										<c:set value="${member.memName }" var="name"/>
										<h1 class="apple4 text-grey text-left" style="font-size:50px;">${fn:substring(name,0,1) }</h1>
									</c:when> 
									<c:otherwise> 
										<img alt="이미지 오류" src="${member.memProfileUrl }" style="width: 100px; height: 100px;">
									</c:otherwise>
								</c:choose>
	                        </div>
	                        <input class="form-control" type="file" id="profileImg" name="profileImg" >
	                    </div>
	                    <div class="form-group">
	                        <label for="memId">이름</label>
	                        <input class="form-control" type="text" id="memName" name="memName" required="" value="${member.memName }">
	                    </div>
	                    <div class="form-group">
	                        <label for="memEnName">영어이름</label>
	                        <input class="form-control" type="text" id="memEnName" name="memEnName" required="" value="${member.memEnName }">
	                    </div>
						<div class="form-group">
						    <label for="memIntro">자기소개</label>
						    <textarea class="form-control" id="memIntro" name="memIntro" rows="5">${member.memIntro }</textarea>
						</div>
	                    <div class="form-group">
	                        <label for="memTel">전화번호</label>
	                        <input class="form-control" type="tel" id="memTel" name="memTel" required="" value="${member.memTel }">
	                    </div>
	                    <div class="form-group">
	                        <label for="memEmail">이메일</label>
	                        <input class="form-control" type="email" id="memEmail" name="memEmail" required="" value="${member.memEmail }">
	                    </div>
	                    <div class="form-group">
	                        <label for="memZipcode">우편번호</label>
	                        <input class="form-control" type="text" id="memZipcode" name="memZipcode" required="" value="${member.memZipcode }">
	                    </div>
	                    <div class="form-group">
	                        <label for="memAddr">주소</label>
	                        <input class="form-control" type="text" id="memAddr" name="memAddr" required="" value="${member.memAddr }">
	                    </div>
	                    <div class="form-group">
	                        <label for="memAddrDetail">상세주소</label>
	                        <input class="form-control" type="text" id="memAddrDetail" name="memAddrDetail" required="" value="${member.memAddrDetail }">
	                    </div>
	                    <div class="form-group text-center">
	                        <input class="btn btn-primary" type="submit" value="수정하기"/>
	                    </div>
	                </form>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<script>
		// 사진 썸네일 보여주기
		let sumnailDiv = document.querySelector("#sumnailProfile");
		let profileImg = document.querySelector("#profileImg");
		profileImg.onchange = () => {
	        let fileReader = new FileReader();  // 파일 읽어주는 아저씨(고마웡)
	        fileReader.readAsDataURL(profileImg.files[0]);
	        fileReader.onload = () => {
	//             console.log(fileReader.result); // 읽은 내용이 result에 있음
	            let myImg = document.createElement("img");
	            myImg.width = 100; myImg.height = 100;
	            myImg.src = fileReader.result;
	            sumnailDiv.innerHTML = "";    		// 가지고 있는 거 다 버리기!
	            sumnailDiv.appendChild(myImg);    	// div태그에 img 태그 자식으로 넣기!
	        };
		};
		
		var header = '${_csrf.headerName}';
		var token =  '${_csrf.token}';
		
		// 회원 정보 수정하기 
		let modifyForm = document.querySelector(".modifyAjax");
		modifyForm.addEventListener("submit", () => {
			event.preventDefault();
			
			// 파일 객체 읽어오기
			let files = profileImg.files;	
			let formData = new FormData(modifyForm);	
			formData.append("profileImg", files[0]);
			
			// 비동기 시작
			let ajax = new XMLHttpRequest();
			ajax.open("post", "${webPath}/workfit/mypage/modify", true);
			ajax.onreadystatechange = function() {
				if(ajax.readyState == 4 && ajax.status == 200){
					let memberVO = JSON.parse(ajax.responseText);
					console.log("response결과",memberVO); // memberVO 객체 json 형태로 들어옴
				};
			};
			ajax.setRequestHeader(header, token);
			ajax.send(formData);
			setTimeout(() => location.reload(), 200);
		});
		
	</script>
	<style>
	.modal-content{
		overflow-y: initial;
		height: 80%;
	}
	.modal-body{
		height: 250px;
		overflow-y: auto;
	}
	</style>
	
