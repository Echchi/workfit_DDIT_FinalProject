<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<div class="content-page">
		<div class="content">
			<div class="row mt-1">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="card-title">
								<h1 class="apple4 page-title text-dark text-center mb-3 mt-5 headerTitle"
									style="font-size: 20px; letter-spacing: 2px; font-weight: bold;">멤버십 결제</h1>
							</div>
							<!--------------실험--------------------------------->
							<div class="row mt-sm-5 mt-3 mb-3 nav nav-pills bg-nav-pills nav-justified mb-3" >
								<div class="col-md-4">
									<div class="card card-pricing">
										<div class="card-body text-center">
											<!-- <p class="apple2 card-pricing-plan-name font-weight-bold text-uppercase">Blue MemberShip</p> -->
											<li class="nav-item">
												<a href="#home1" data-toggle="tab" aria-expanded="false" class="nav-link rounded-0">
													<i class="mdi mdi-home-variant d-md-none d-block"></i>
													<span class="d-none d-md-block">Blue MemberShip</span>
												</a>
											</li>
											<i class="card-pricing-icon dripicons-user text-primary"></i>
											<h2 class="card-pricing-price">₩100,000 <span>/ 월</span></h2>
											<ul class="card-pricing-features">
												<li>사용자 수: 25명</li>
												<li>Storage : 10GB</li>
												<li>지원기능 수 : 10개</li>
											</ul>
											<br>
											<p>특징: ~~~~~~~</p>
											<button class="btn btn-primary mt-4 mb-2 btn-rounded" data-value="10000" data-code="블루멤버십" data-num="${payNum }"
											onclick="payment(this)">블루 멤버십 도입</button>
										</div>
									</div> <!-- end Pricing_card -->
								</div> <!-- end col -->

								<div class="col-md-4">
									<div class="card card-pricing card-pricing-recommended">
										<div class="card-body text-center">
											<div class="card-pricing-plan-tag">Recommended</div>
											<!-- <p class="apple 5card-pricing-plan-name font-weight-bold text-uppercase">Platinum MemberShip</p> -->
											<li class="nav-item">
												<a href="#profile1" data-toggle="tab" aria-expanded="false" class="nav-link rounded-0">
													<i class="mdi mdi-home-variant d-md-none d-block"></i>
													<span class="d-none d-md-block">Gold MemberShip</span>
												</a>
											</li>
											<i class="card-pricing-icon dripicons-briefcase text-primary"></i>
											<h2 class="card-pricing-price">₩200,000 <span>/ 월</span></h2>
											<ul class="card-pricing-features">
												<li>사용자 수: 50명</li>
												<li>Storage : 50GB</li>
												<li>지원기능 수 : 15개</li>
											</ul>
											<br>
											<p>특징: ~~~~~~~</p>
											<button class="btn btn-primary mt-4 mb-2 btn-rounded" data-value="50000"
											data-code="골드멤버십" data-num="${payNum }"
											onclick="payment(this)">플레티넘 멤버십 도입	</button>
										</div>
									</div> <!-- end Pricing_card -->
								</div> <!-- end col -->

								<div class="col-md-4">
									<div class="card card-pricing">
										<div class="card-body text-center">
											<!-- <p class="apple5 card-pricing-plan-name font-weight-bold text-uppercase">Platinum MemberShip</p> -->
											<li class="nav-item">
												<a href="#settings1" data-toggle="tab" aria-expanded="false" class="nav-link rounded-0">
													<i class="mdi mdi-home-variant d-md-none d-block"></i>
													<span class="d-none d-md-block">Platinum MemberShip</span>
												</a>
											</li>
											<i class="card-pricing-icon dripicons-store text-primary"></i>
											<h2 class="card-pricing-price">₩350,000 <span>/ 월</span></h2>
											<ul class="card-pricing-features">
												<li>사용자 수: 100명</li>
												<li>Storage : 100GB</li>
												<li>지원기능 수 : 20개</li>
											</ul>
											<br>
											<p>특징: ~~~~~~~</p>
											<button class="btn btn-primary mt-4 mb-2 btn-rounded" data-value="100000"
											data-code="플레티넘멤버십" data-num="${payNum }"
											onclick="payment(this)">플레티넘 멤버십 도입</button>
										</div>
									</div> <!-- end Pricing_card -->
								</div> <!-- end col -->
							</div>
							<div class="tab-content">
								<div class="tab-pane" id="home1">
									<p>블루멥버십</p>
								</div>
								<div class="tab-pane" id="profile1">
									<p>골드멤법십</p>
								</div>
								<div class="tab-pane" id="settings1">
									<p>플레티넘 멤버십</p>
								</div>
							</div>
							<!---실험---------------------------------------------->
						</div>
						<!-- end of content-header -->
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- iamport.payment.js -->
	<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		var header = '${_csrf.headerName}';
		var token = '${_csrf.token}';
		var IMP = window.IMP; // 생략 가능
		// IMP.init('imp40457482')	;

		function payment(pthis) {
			IMP.init('imp40457482');
			let price = pthis.dataset.value;
			let serviceName = pthis.dataset.code;
			let payNum = pthis.dataset.num;

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
						price: price
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
						}
					}
					alert("총체적 성공")
				} else {
					alert(rsp.error_msg);
				}
			});  //카카오페이 결제 종료


		}

	</script>

<style>
.shadowDiv{
	box-shadow: 5px 5px 5px 5px skyblue;
}

</style>