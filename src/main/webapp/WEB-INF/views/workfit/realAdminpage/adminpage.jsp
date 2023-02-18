<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.membershipList ul li {
	font-size: 17px;
    list-style: none;
    padding: 10px 0 10px 0px;
/*
    margin: 0;
    background-image: url(/resources/assets/images/logo/workfitLogo.png);
    background-position: left center;
    background-repeat: no-repeat;
    background-size:25px;
*/
}
.membershipList ul{
	padding-left: 0;
}
i{
	font-size: 25px;
}
</style>
<div class="row mt-2">
	<div class="col-12">
		<div class='mr-2 card p-3 workfitCardBg'
			style="border-radius: 0.7rem;">
			<div class='card p-3' style="border-radius: 0.7rem;">

				<h5 class='apple4 page-title text-dark pl-3 pt-2'
					style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>멤버십 결제</h5>

				<hr class="ml-3 mr-3 mt-1 mb-1">
				<div class="apple4 pl-3 pr-3 text-dark pb-2"
					style="font-size: 19px;">
					<span class="badge badge-warning badge-pill">TIP</span><br>
					멤버십 결제 페이지에서는그룹웨어 멤버십을 관리 및 구매할 수 있습니다<br>
					블루, 골드, 플래티넘에 따라 기능을 확인할 수 있으며 카카오톡 결제로 빠른 결제가 가능합니다
				</div>
			</div>
		</div>

		<div class="card mr-2 workfitCardBg">
			<div class="card-body  p-4">
				<div class="card-title ml-3">
					<h5 class='apple4 page-title text-dark pl-2 pt-2 mb-1' style='margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;'>멤버십 결제</h5>
				</div>
				<div class="row ml-3 mr-3 mt-3 apple4" >
					<!-- ------------------------------------------------ 1번째 멤버쉽 ------------------------------------------------ -->
	            	<div class="col-4">
						<div class="card" style="box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.85vrem; height : 820px">
							<div class="card-body" >
								<div class="card-title">
									<c:choose>
										<c:when test="${myService eq '1' }">
											<span  class="apple4 page-title pb-2  mr-5"
												style="font-size: 40px; color: #5F7CBB;  letter-spacing: 2px; font-weight: 600;">
											블루
											</span>
											<span class="text-dark apple5" style="background-color: rgb(95,124,187, 0.2); position: absolute; right: 27px; top: 14px; font-size: 18px;">&nbsp;현재 이용중인 멤버십&nbsp;</span>
										</c:when>
										<c:otherwise>
											<span  class="apple4 page-title pb-2"
												style="font-size: 40px; color: #5F7CBB;  letter-spacing: 2px; font-weight: 600;">
											블루
											</span>
<!-- 											<span class="text-dark apple5" style="background-color: rgb(95,124,187, 0.2); position: absolute; right: 27px; top: 14px; font-size: 18px;">&nbsp;현재 이용중인 멤버십&nbsp;</span> -->
										</c:otherwise>
									</c:choose>
									<div style="border : 2px solid #5F7CBB"></div>
								</div>
								<div class="apple5" style="font-size: 28px; font-weight: 600; color: black;">
								 ₩89,000/개월
								</div>
								<div class="apple4 pt-1" style="font-size: 17px; font-weight: 600;">
									합리적인 비용으로 그룹웨어를 이용해보세요.<br>
									경제적으로 이용하기에 적합한 서비스입니다.<br> 
								</div>
								<div class=" apple5 membershipList" style="font-weight: 600; font-size: 17px;    padding-top: 49px;">
									<ul>
										<li>
								    	 	 <i class="card-pricing-icon dripicons-user pr-1" style="color: black; font-size: 19px;"></i>
									    	 <span style="color: black; font-size: 19px;">
									    	 	유저수
									    	 </span>
									    	 <span class="text-dark" style="padding-left : 10px">30명</span>
										</li>
										<li>
									    	 <i class="dripicons-cloud-upload pr-1" style="color: black;font-size: 17px;"></i>
									    	 <span style="color: black; font-size: 19px;">
									    	 	저장공간
									    	 </span>
									    	 <span class="text-dark" style="padding-left : 10px">50GB</span>
										
										</li>
										<li>
								    	 	 <i class="mdi mdi-ballot-outline pr-1" style="font-size: 19px; color: black;"></i>
									    	 <span style="color: black; font-size: 19px;">
									    	 	지원기능
									    	 </span>
									    	 <span class="text-dark" style="padding-left : 10px">8개</span>
										
										</li>
									</ul>
								</div>
								<div class="row text-dark text-center pt-3 pr-3 pl-3" style="font-size: large;" >
									<div class="col-3">
										<i class="mdi mdi-file-document-multiple-outline"></i><p>전자결재</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-calendar-month"></i><p>일정관리</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-account-reactivate"></i><p>조직도</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-email-edit"></i><p>메일</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-bulletin-board"></i><p>게시판</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-briefcase-clock-outline"></i><p>예약</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-cloud-print-outline"></i><p>문서함</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-clock-fast"></i><p>근태관리</p>
									</div>
								</div>
								<div>
									<button class="btn btn-primary mb-2 btn-rounded" 
										style="background-color: #5F7CBB; width: 100%; font-weight: 600; font-size: 19px; margin-top: 156px;"  
										data-users="30" data-value="10000" data-storage="10737418240" 
	 									data-code="1" data-num="${payNum }" onclick="payment(this)">구독 결제</button>   
								</div>
						  	</div>
						</div>
	            	</div>
					<!-- ------------------------------------------------ 2번째 멤버쉽 ------------------------------------------------ -->
					<div class="col-4">
						<div class="card" style="box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.85vrem; height : 820px;">
							<div class="card-body" >
								<div class="card-title">
									<c:choose>
										<c:when test="${myService eq '2' }">
											<span class="apple4 page-title pb-2  mr-5"
											style="font-size: 40px; color: #fe9301;  letter-spacing: 2px; font-weight: 600;">
											골드
											</span>
											<span class="text-dark apple5" style="background-color: rgb(254,147,1, 0.2); position: absolute; right: 27px; top: 14px; font-size: 18px;">&nbsp;현재 이용중인 멤버십&nbsp;</span>    
										</c:when>
										<c:otherwise>
											<span class="apple4 page-title pb-2"
										style="font-size: 40px; color: #fe9301;  letter-spacing: 2px; font-weight: 600;">
											골드
											</span>
<!-- 											<span class="text-dark apple5" style="background-color: rgb(254,147,1, 0.2); position: absolute; right: 27px; top: 14px; font-size: 18px;">&nbsp;현재 이용중인 멤버십&nbsp;</span>     -->
										</c:otherwise>
									</c:choose>
									<div style="border : 2px solid #fe9301"></div>
								</div>
								<div class="apple5" style="font-size: 28px; font-weight: 600; color: black;">
								 ₩149,000/개월
								</div>
								<div class="apple5 pt-1" style="font-size: 17px; font-weight: 600;">
								 2배로 늘어난 유저수와 <br>200GB로 확장된 저장공간을 이용해보세요.<br>
								 덧붙여, 추가된 알림 기능도 매우 편리하답니다.
								</div>
								<div class="pt-3 apple5 membershipList" style="font-weight: 600; font-size: 17px">
									<ul>
										<li>
								    	 	 <i class="card-pricing-icon dripicons-user pr-1" style="color: black; font-size: 19px;"></i>
									    	 <span style="color: black; font-size: 19px;">
									    	 	유저수
									    	 </span>
									    	 <span class="text-dark" style="padding-left : 10px">60 명</span>
										</li>
										<li>
									    	 <i class="dripicons-cloud-upload pr-1" style="color: black; font-size: 19px;"></i>
									    	 <span style="color: black; font-size: 19px;">
									    	 	저장공간
									    	 </span>
									    	 <span class="text-dark" style="padding-left : 10px">200GB</span>
										
										</li>
										<li>
								    	 	 <i class="mdi mdi-ballot-outline pr-1" style="font-size: 19px; color: black; "></i>
									    	 <span style="color: black; font-size: 19px;">
									    	 	지원기능
									    	 </span>
									    	 <span class="text-dark" style="padding-left : 10px">9 개</span>
										
										</li>
									</ul>
								</div>
								<div class="row text-dark text-center pt-3 pr-3 pl-3" style="font-size: large;" >
									<div class="col-3">
										<i class="mdi mdi-file-document-multiple-outline"></i><p>전자결재</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-calendar-month"></i><p>일정관리</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-account-reactivate"></i><p>조직도</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-email-edit"></i><p>메일</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-bulletin-board"></i><p>게시판</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-briefcase-clock-outline"></i><p>예약</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-cloud-print-outline"></i><p>문서함</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-clock-fast"></i><p>근태관리</p>
									</div>
									<div class="col-3 pt-2" style="border-radius: 0.85rem; background-color: rgb(254,147,1, 0.2)">
										<i class="dripicons-bell noti-icon"></i><p>알림</p>
									</div>
								</div>
								<div>
									<button class="btn btn-primary mb-2 btn-rounded"
										style="background-color: #5F7CBB; width: 100%; font-weight: 600; font-size: 19px; margin-top: 64px;"  
										data-users="60" data-value="50000" data-storage="53687091200" 
										data-code="2" data-num="${payNum }" onclick="payment(this)">구독 결제</button> 
								</div>
						  	</div>
						</div>
					</div>
					<!-- ------------------------------------------------ 3번째 멤버쉽 ------------------------------------------------ -->
					<div class="col-4">
						<div class="card" style="box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.85vrem; height : 820px;">
							<div class="card-body" >
								<div class="card-title">
									<c:choose>
										<c:when test="${myService eq '3' }">
											<span class="apple4 page-title pb-2 mr-5"
											style="font-size: 40px; color: #d45be9;  letter-spacing: 2px; font-weight: 600;">
											플래티넘
											</span>
											<span class="text-dark apple5" 
												style="background-color: rgba(231,91,233, 0.3); position: absolute; right: 27px; top: 14px; font-size: 18px;">&nbsp;현재 이용중인 멤버십&nbsp;</span>
										</c:when>
										<c:otherwise>
											<span class="apple4 page-title pb-2"
											style="font-size: 40px; color: #d45be9;  letter-spacing: 2px; font-weight: 600;">
											플래티넘
											</span>    
										</c:otherwise>
									</c:choose>
									<div style="border : 2px solid #d45be9"></div>
								</div>
								<div class="apple5" style="font-size: 28px; font-weight: 600; color: black;">
								 ₩350,000/개월
								</div>
								<div class="apple5 pt-1" style="font-size: 17px; font-weight: 600;">
									 급격히 성장하고 있는 회사에게 꼭 필요한 서비스입니다.<br>
									 파격적인 저장공간과 추가로 제공되는 <br>대시보드, 데이터 시각화 기능을 체험해보세요.
								</div>
								<div class="pt-3 apple5 membershipList" style="font-weight: 600; font-size: 19px;">
									<ul>
										<li>
								    	 	 <i class="card-pricing-icon dripicons-user pr-1" style="color: black; font-size: 19px;"></i>
									    	 <span style="color: black; font-size: 19px;">
									    	 	유저수
									    	 </span>
									    	 <span class="text-dark" style="padding-left : 10px">120명</span>
										</li>
										<li>
									    	 <i class="dripicons-cloud-upload pr-1" style="color: black; font-size: 19px;"></i>
									    	 <span style="color: black; font-size: 19px;">
									    	 	저장공간
									    	 </span>
									    	 <span class="text-dark"  style="padding-left : 10px">1TB</span>
										
										</li>
										<li>
								    	 	 <i class="mdi mdi-ballot-outline pr-1" style="font-size: 19px; color: black;"></i>
									    	 <span style="font-size: 19px; color: black;">
									    	 	지원기능
									    	 </span>
									    	 <span class="text-dark" style="padding-left : 10px">12개</span>
										
										</li>
									</ul>
								</div>
								<div class="row text-dark text-center pt-3 pr-2 pl-2" style="font-size: large;" >
									<div class="col-3">
										<i class="mdi mdi-file-document-multiple-outline"></i><p>전자결재</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-calendar-month"></i><p>일정관리</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-account-reactivate"></i><p>조직도</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-email-edit"></i><p>메일</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-bulletin-board"></i><p>게시판</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-briefcase-clock-outline"></i><p>예약</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-cloud-print-outline"></i><p>문서함</p>
									</div>
									<div class="col-3">
										<i class="mdi mdi-clock-fast"></i><p>근태관리</p>
									</div>
									<div class="col-3 pt-2" style="border-bottom-left-radius: 0.85rem; border-top-left-radius: 0.85rem; background-color: rgb(212,91,233, 0.15)">
										<i class="dripicons-bell noti-icon"></i><p>알림</p>
									</div>
									<div class="col-3 pt-2" style=" background-color: rgb(212,91,233, 0.15)">
										<i class="mdi mdi-desktop-mac-dashboard"></i><p>대시보드</p>
									</div>
<!-- 									<div class="col-3 pt-2" style=" background-color: rgb(212,91,233, 0.15)"> -->
<!-- 										<i class="mdi mdi-chat-processing-outline"></i><p>챗봇</p> -->
<!-- 									</div> -->
									<div class="col-3 pt-2" style="border-bottom-right-radius: 0.85rem; border-top-right-radius: 0.85rem; background-color: rgb(212,91,233, 0.15)">
										<i class="mdi mdi-chart-areaspline"></i><p style="">데이터<br>시각화</p>
									</div>
								</div>
								<div>
									<button class="btn btn-primary mt-4 mb-2 btn-rounded" 
										style="background-color: #5F7CBB; width: 100%; font-weight: 600; font-size: 19px;" 
										data-users="120" data-value="100000" data-storage="107374182400" 
									data-code="3" data-num="${payNum }" onclick="payment(this)">구독 결제</button>
								</div>
						  	</div>
						</div>
					</div>
				</div>
				<!--------------  조종은 실험 시작--------------------------------->
				<!--------------  조종은 실험 끝 --------------------------------->
				<!--------------  조팀장 실험--------------------------------->
<!-- 				<div class="apple4 row ml-3 mr-3 nav nav-pills bg-nav-pills nav-justified"> -->
<!-- 					-----------------블루멤버쉽----------------- -->
<!-- 					<div class="col-md-3"> -->
<!-- 						<div id="basic" class="card card-pricing" style="height: 800px;"> -->
<!-- 							<div id="basicChk" class="card-body text-center"> -->
<!-- 								<div class="card-pricing-plan-tag">Recommended</div> -->
<!-- 								<p class="apple2 card-pricing-plan-name font-weight-bold text-uppercase">Blue MemberShip</p> -->
<!-- 								<li class="nav-item"> -->
<!-- 									<a href="#home1" data-toggle="tab" aria-expanded="false" -->
<!-- 									class="nav-link rounded-0"> -->
<!-- 									<i class="mdi mdi-home-variant d-md-none d-block"></i> -->
<!-- 									<span class="apple5 d-none d-md-block"><h3>블루 멤버십</h3></span> -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 								<i class="card-pricing-icon dripicons-user text-primary"></i> -->
<!-- 								<h2 class="card-pricing-price">₩100,000 <span>/ 분기</span></h2> -->
<!-- 								<ul class="apple5 card-pricing-features text-dark" style="font-size: 40;"> -->
<!-- 									<li>사용가능 유저: 25명</li> -->
<!-- 									<li>Storage : 10GB</li> -->
<!-- 									<li>지원기능: 8개</li> -->
<!-- 								</ul> -->
<!-- 								<br> -->
<!-- 								<p>특징</p> -->
<!-- 								<p>8가지 기본 그룹웨어 기능 제공</p> -->
<!-- 								<p>10GB의 기본 용량 제공</p> -->
<!-- 								<p>유저 수 25명 사용 가능</p> -->
<!-- 								<button class="btn btn-primary mt-4 mb-2 btn-rounded" data-users="25" data-value="10000" data-storage="10737418240" -->
<%-- 									data-code="1" data-num="${payNum }" onclick="payment(this)">멤버십	도입</button> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						end Pricing_card -->
<!-- 					</div>  -->
<!-- 					end col -->
<!-- 					-----------------블루멤버쉽----------------- -->
					
<!-- 					-----------------골드멤버십----------------- -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="card card-pricing card-pricing-recommended"> -->
<!-- 						<div id="gold" class="card card-pricing" style="height: 800px;"> -->
<!-- 							<div id="goldChk" class="card-body text-center"> -->
<!-- 								<div class="card-pricing-plan-tag">Recommended</div> -->
<!-- 								<p class="apple 5card-pricing-plan-name font-weight-bold text-uppercase">Platinum MemberShip</p> -->
<!-- 								<li class="nav-item"> -->
<!-- 									<a href="#profile1" data-toggle="tab" aria-expanded="false" -->
<!-- 										class="nav-link rounded-0"> -->
<!-- 										<i class="mdi mdi-home-variant d-md-none d-block"></i> -->
<!-- 										<span class="apple5 d-none d-md-block"><h3>골드 멤버십</h3></span> -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 								<i class="card-pricing-icon dripicons-briefcase text-primary"></i> -->
<!-- 								<h2 class="card-pricing-price">₩200,000 <span>/ 분기</span></h2> -->
<!-- 								<ul class="apple5 card-pricing-features text-dark" style="font-size: 40;"> -->
<!-- 									<li>사용가능 유저: 50명</li> -->
<!-- 									<li>Storage : 50GB</li> -->
<!-- 									<li>지원기능: 9개</li> -->
<!-- 								</ul> -->
<!-- 								<br> -->
<!-- 								<p>특징</p> -->
<!-- 								<p>블루 멤버십 대비 늘어난 용량과 유저수 그림으로 표현하면..?어떨까?</p> -->
<!-- 								<p>알람 기능 추가</p> -->
<!-- 								<button class="btn btn-primary mt-4 mb-2 btn-rounded" data-users="50" data-value="50000" data-storage="53687091200" -->
<%-- 									data-code="2" data-num="${payNum }" onclick="payment(this)">멤버십	도입 </button> --%>
<!-- 							</div> -->
<!-- 						</div>  -->
<!-- 						</div> -->
<!-- 						end Pricing_card -->
<!-- 					</div>  -->
<!-- 					end col -->
<!-- 					-----------------골드멤버십----------------- -->
<!-- 					-----------------플레티넘 멤버십----------------- -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<div id="platinum" class="card card-pricing" style="height: 800px;"> -->
<!-- 							<div id="platinumChk" class="card-body text-center"> -->
<!-- 								<p class="apple5 card-pricing-plan-name font-weight-bold text-uppercase">Platinum MemberShip</p> -->
<!-- 								<li class="nav-item"> -->
<!-- 									<a href="#settings1" data-toggle="tab" aria-expanded="false" -->
<!-- 										class="nav-link rounded-0"> -->
<!-- 										<i class="mdi mdi-home-variant d-md-none d-block"></i> -->
<!-- 										<span class="apple5 d-none d-md-block"><h3>플레티넘 멤버십</h3></span> -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 								<i class="card-pricing-icon dripicons-store text-primary"></i> -->
<!-- 								<h2 class="card-pricing-price">₩350,000 <span>/ 분기</span></h2> -->
<!-- 								<ul class="apple5 card-pricing-features text-dark" style="font-size: 40;"> -->
<!-- 									<li>사용가능 유저: 100명</li> -->
<!-- 									<li>Storage : 100GB</li> -->
<!-- 									<li>지원기능: 12개</li> -->
<!-- 								</ul> -->
<!-- 								<br> -->
<!-- 								<p>특징</p> -->
<!-- 								<p>100GB 용량 업그레이드!</p> -->
<!-- 								<p>유저 수 총 100명!</p> -->
<!-- 								<p>3가지의 특별한 서비스 추가 제공</p> -->
<!-- 								<p>대시보드 커스텀</p> -->
<!-- 								<p>데이터 시각화</p> -->
<!-- 								<p>챗봇</p> -->
<!-- 								<button class="btn btn-primary mt-4 mb-2 btn-rounded" data-users="100" data-value="100000" data-storage="107374182400" -->
<%-- 									data-code="3" data-num="${payNum }" onclick="payment(this)">멤버십 도입</button> --%>
<!-- 							</div> -->
<!-- 						</div>  -->
<!-- 						end Pricing_card -->
<!-- 					</div>   -->
<!-- 					end col -->
<!-- 					-----------------플레티넘 멤버십----------------- -->
<!-- 				</div> -->
				<!---실험---------------------------------------------->
			</div>
			<!-- end of content-header -->
		</div>
	</div>
</div>


	<!-- iamport.payment.js -->
	<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>

		$(function(){
			let mySerive = ${myService};
			let basic = document.querySelector("#basic");
			let gold = document.querySelector("#gold");
			let platinum = document.querySelector("#platinum");

			console.log("사용중인 서비스:", mySerive);

			if(mySerive == 1){
				basic.className = "card card-pricing card-pricing-recommended";
				gold.className = "card card-pricing";
				platinum.className = "card card-pricing";
				let basicChk = document.querySelector("#basicChk");
				let divTag = document.createElement("div");
				divTag.innerHTML = '<div class="card-pricing-plan-tag">현재 이용중인 멤버십</div>';
				
				basicChk.prepend(divTag);
			}
			
			if(mySerive == 2){
				basic.className = "card card-pricing";
				gold.className = "card card-pricing card-pricing-recommended";
				platinum.className = "card card-pricing";
				let goldChk = document.querySelector("#goldChk");
				let divTag = document.createElement("div");
				divTag.innerHTML = '<div class="card-pricing-plan-tag">현재 이용중인 멤버십</div>';
				console.log("divTag:", divTag);
				goldChk.prepend(divTag);
				
			}
			if(mySerive == 3){
				basic.className = "card card-pricing";
				gold.className = "card card-pricing";
				platinum.className = "card card-pricing card-pricing-recommended";
				let platinumChk = document.querySelector("#platinumChk");
				let divTag = document.createElement("div");
				divTag.innerHTML = '<div class="card-pricing-plan-tag">현재 이용중인 멤버십</div>';
				platinumChk.prepend(divTag);
			}

		})

		var header = '${_csrf.headerName}';
		var token = '${_csrf.token}';
		var IMP = window.IMP; // 생략 가능
		// IMP.init('imp40457482')	;

		function payment(pthis) {
			IMP.init('imp40457482');
			let price = pthis.dataset.value;
			let serviceName = pthis.dataset.code;
			let payNum = pthis.dataset.num;
			let storageSize = pthis.dataset.storage;
			let users = pthis.dataset.users;

			console.log("price, serviceName, payNum:", price, serviceName, payNum);

			IMP.request_pay({ // param
				pg: "kakaopay",
				pay_method: "kakaopay",
				merchant_uid: payNum,
				name: serviceName,
				amount: price, //가격 
				buyer_email: "nang1825@naver.com",
				buyer_tel: '010-2559-1825'
			}, function (rsp) { // callback
				if (rsp.success) {
					let jsonData = {
						serviceName: serviceName,
						payNum: payNum,
						price: price,
						storageSize : storageSize,
						users : users
					}
					console.log("jsonData:", jsonData);
					let xhr = new XMLHttpRequest();
					xhr.open('post', "/workfit/admin/payment", true);
					xhr.setRequestHeader(header, token);
					xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
					xhr.send(JSON.stringify(jsonData));//보낼데이터 payNum,serviceName,amount
					xhr.onreadystatechange = function () {
						if (xhr.status == 200 && xhr.readyState == 4) {
							let rslt = xhr.responseText;
							console.log(rslt);
							toastr.success( '<h4 style="font-size:17px;" class="apple4">승인완료</h4>');
							setTimeout(() => window.location.reload(), 900);
						}
					}
				} else {
					alert(rsp.error_msg);
				}
			});  //카카오페이 결제 종료


		}

	</script>

	<style>
		.shadowDiv {
			box-shadow: 5px 5px 5px 5px skyblue;
		}
	</style>