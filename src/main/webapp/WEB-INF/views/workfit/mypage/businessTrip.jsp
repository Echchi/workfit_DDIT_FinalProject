<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.table th, .table td {
    vertical-align : middle;
    border-bottom: 1px solid #dbdee0 !important;
    padding: 10px;
}
i{
	cursor: pointer;
}
</style>
<!--  맨위에 보여주는 페이지 -->
<div class='row mt-2'>
	<div class='col-12'>
		<div class='mr-2 card p-3 workfitCardBg'style="border-radius: 0.7rem;">
			<div class='card p-3' style="border-radius: 0.7rem;">

				<h5 class='apple4 page-title text-dark pl-3 pt-2'
					style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>출장</h5>

				<hr class="ml-3 mr-3 mt-1 mb-1">
				<div class="apple4 pl-3 pr-3 text-dark pb-2"
					style="font-size: 19px;">
					<span class="badge badge-warning badge-pill">TIP</span><br>
                           	 출장에 대한 일정 및 경비에 대한 사항을 기입하고 승인을 요청하는 기능을 제공합니다<br>
				</div>
			</div>
		</div>
	
	
	
		<div class='card mr-2 workfitCardBg'>
			<div class='card-body p-4'>
				<div class='card-title'>
					<h5 class='apple4 page-title text-dark ml-3'
						style='font-size: 26px; letter-spacing: 2px;'>출장</h5>
				</div>
				<div class='row mb-2'>
					<!--  월별 날짜 출력 -->
					<div class='col-12'>
						<h1 class="apple4 text-dark text-center" id="dateHeader"
							style="font-size: 30px;">
							<i class="dripicons-chevron-left mr-3"></i><i
								class="dripicons-chevron-right ml-3"></i>
						</h1>
					</div>
					<!--  월별 날짜 출력 끝-->
				</div>
			<!-- end of content-header -->
				<div class='row ml-3 mr-3'>
					<div class='col-sm-4 offset-8'>
						<div class='text-sm-right'>
							<button type='button'
								class='btn workfitBtn mb-2 apple3 ml-3 mr-1 pl-3 pr-3 text-center'style="padding-top: 10px; padding-bottom:10px;font-size:17px;"
								data-toggle="modal" data-target="#businessTrip-modal">출장
								신청</button>
						</div>
					</div>
					<table class='apple3 alternative-page-datatable table text-dark text-center mb-0'>                                                                
		           		<thead>                                                                                                           
			                <tr class="apple5" style="font-size: 17px;">                                                                                                           
				                <th scope='col'>순번</th>                                                                       
				                <th scope='col'>일자</th>                                                                     
				                <th scope='col'>출장지</th>                                                                  
				                <th scope='col'>사유</th>                                                                  
				                <th scope='col'>승인여부</th>                                                                      
				                <th scope='col'>상세보기</th>                                                                      
				                <th scope='col'>삭제</th>                                                                      
			             	</tr>                                                                                                          
		              	</thead>                                                                                                          
		              	<tbody id="btTable" style="font-size: 17px;">
	            		</tbody>
	            	</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end of content-->
<!-- ---------------  출장 모달 --------------- -->
<div id="businessTrip-modal" class="modal fade text-dark apple4" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title ml-1" id="standard-modalLabel" style="font-size: 30px;">출장 신청서</h1>
               
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
				<!-- 문서 상단 내용  -->
				<div class='card shadow p-2 bg-white rounded'>
					<div class='card-body pl-3 pr-3 pt-2 pb-0'>
					<form action="" id="insertFrm">
						<div class='card-title row' style="font-size: 16px">
								<!--  회원 아이디 -->
								<input type="hidden" name="memId" value="${memId }">
	<!-- 							<div class="col-12 mb-3" > -->
								<div class="col-12 mb-3 text-center" style="background-color: #e9ecef; border-radius: 0.25rem;">
									<h4 class="apple4 text-dark" style="font-size: 20px;">출장 신청 개요</h4>
								</div>
								<div class="form-group col-2">
									<label for="memName">성명</label><input
										class="form-control text-dark" type="text" required name="memName"
										value="${memName }" disabled="disabled">
								</div>
								<div class="form-group col-2">
									<label for="memDeptName" >부서</label><input
										class="form-control text-dark" type="text" required name="memDeptName"
										value="${memDeptName }" disabled="disabled">
								</div>
								<div class="form-group offset-2 col-6">
									<label for="businessTripDate" >출장기간</label>
									<div class="row">
										<div class="col-5">
											<input type="text" class="form-control date" value="시작날짜" name="businessTripStartDate"
													data-provide="datepicker" data-date-format="yyyy/mm/dd" data-date-location ="ko">
										</div>
										<div class="col-0 p-0">
											<span class="apple4" style=" vertical-align: -webkit-baseline-middle;">~</span> 
										</div>
										<div class="col-5">
											<input type="text" class="form-control date" value="종료날짜" name="businessTripEndDate"
													data-provide="datepicker" data-date-format="yyyy/mm/dd" data-cancel-class="btn-warning"> 
										</div>
									</div>
								</div>
								<div class="form-group col-6">
									<label for="businessTripLocation">출장지</label> <input
										class="form-control" type="text" required name="businessTripLocation"
										placeholder="장소를 입력해주세요">
								</div>
								<div class="form-group col-6">
									<label for="businessTripConfirmid">출장 승인자</label>
									<select class="form-control select2" name="businessTripConfirmid" data-toggle="select2">
									    <option>승인자를 선택해주세요</option>
									    <optgroup label="${memDeptName}">
<%-- 									    	<c:forEach var="mem" items="${myDeptList }"> --%>
										        <option value="DDIT457">이철희 (부장)</option>
										        <option value="ADMIN">이철준 (사장)</option>
<%-- 									    	</c:forEach> --%>
									    </optgroup>
									</select>
								</div>
								<div class="form-group col-6">
									<label for="businessTripPurpose">출장목적</label> <input
										class="form-control" type="text" required name="businessTripPurpose"
										placeholder="출장목적을 입력해주세요">
								</div>
								<div class="form-group col-6 text-right">
									<button type="button" class="btn btn-light" style="position:absolute ; bottom : 0px; right:12px" onclick="calculate()">출장경비 계산</button>
								</div>
								<hr/>
								<div class="col-12 mb-3 mt-3 text-center" style="background-color: #e9ecef; border-radius: 0.25rem;">
									<h4 class="apple4 text-dark" style="font-size: 20px;">예상 출장 경비</h4>
								</div>
								<table class="table table-hover text-dark text-center" id="businessTrip" style="font-size: 16px;">
									<tbody>
										<tr>
											<td class="tr-title" style="padding-left: 30px;">숙박비 
												<button type="button" class="btn" data-toggle="tooltip" data-placement="top" title=""  data-html="true" data-original-title="숙박비 : 1일당 50,000원 ">
													<i class="dripicons-information"></i>
												</button>
											</td>
											<td>
												<input class="form-control cost text-dark font-weight-bold" type="text" name="roomCost"
													placeholder="0,000원">
											</td>
											<td width="20%">
												<button class="btn btn-light modifyCost" style="width : 100%;" type="button">적&nbsp;&nbsp;용</button>
											</td>
										</tr>
										<tr>
											<td class="tr-title" style="padding-left: 30px;">교통비 
												<button type="button" class="btn" data-toggle="tooltip" data-placement="top" title=""  data-html="true" data-original-title="교통비 : 1일당 30,000원 ">
													<i class="dripicons-information"></i>
												</button>
											</td>
											<td>
												<input class="form-control cost text-dark font-weight-bold" type="text" name="transportCost"
													placeholder="0,000원">
											</td>
											<td width="20%">
												<button class="btn btn-light modifyCost" style="width : 100%;" type="button">적&nbsp;&nbsp;용</button>
											</td>
										</tr>
										<tr>
											<td class="tr-title" style="padding-left: 40px;">식비 
												<button type="button" class="btn" data-toggle="tooltip" data-placement="top" title=""  data-html="true" data-original-title="식비 : 1일당 10,000원 ">
													<i class="dripicons-information"></i>
												</button>
											</td>
											<td>
												<input class="form-control cost text-dark font-weight-bold" type="text" name="foodCost"
													placeholder="0,000원">
											</td>
											<td width="20%">
												<button class="btn btn-light modifyCost" style="width : 100%;" type="button">적&nbsp;&nbsp;용</button>
											</td>
										</tr>
										<tr>
											<td class="tr-title">기타</td>
											<td>
												<input class="form-control cost text-dark font-weight-bold" type="text" name="etcCost"
													placeholder="0,000원">
											</td>
											<td width="20%">
												<button class="btn btn-light modifyCost" style="width : 100%;" type="button">적&nbsp;&nbsp;용</button>
											</td>
										</tr>
										<tr>
											<td class="tr-title" >합계</td>
											<td colspan="2">
												<input class="form-control text-dark text-center font-weight-bolder" 
													type="text" name="totalCost" readonly="readonly"
													style="background-color: white; border: none;" value="0,000원">
											</td>
										</tr>
									</tbody>
								</table>
								<sec:csrfInput/>
						</div><!--  end of card-title -->
						</form>
					</div><!-- end of card-body -->
				</div><!--  end of card -->
            </div><!-- end of modal-body -->
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:  #5F7CBB; color: white" onclick="insertBusinessTrip()">신청</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ---------------  출장 모달 끝 ----------------->
<!--  휴가 삭제 모달창 시작 -->
<div id="delete-modal" class="modal fade text-dark" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title apple6 text-dark" id="standard-modalLabel" style="font-weight: bolder; font-size: 18px">신청 내역을 삭제하시겠습니까 ?</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body" style="font-size: 17px">
            </div>
            <p style="display: none" id="delCode"></p>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="btDelete(this)">확인</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--  출장 삭제 모달창 끝 -->

<!--  지도 띄울 모달 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script> -->
<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=geocoder"></script> -->
<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=4hm33jxj4j&callback=initMap&submodules=geocoder"></script> -->

<script>
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
	let leftArrow = document.querySelector(".dripicons-chevron-left");
	let rightArrow = document.querySelector(".dripicons-chevron-right");
	let dateHeader = document.querySelector("#dateHeader");

	// --------------------------- 현재 날짜 가져오기
	let time = dayjs();
	var timeString = time.format("YYYY년 MM월")
	console.log("최초 현재 날짜 : ", time)
	console.log("최초 현재 날짜 : ", timeString)
	var spanTag = document.createElement("span");
	spanTag.id = "searchTime";
	spanTag.innerHTML = timeString;
	leftArrow.after(spanTag);

	// bind 나 call apply 를 사용할 경우는 화살표 함수 말고 기본함수식 쓰기 !
	var changeDate = function(flag) {
		if (flag == 'left') {
			// 현재 날짜에서 월 빼기
			time = time.subtract(1, "M");
			var minusDateString = time.format("YYYY년 MM월");
			// console.log(this.nextSibling);
			this.nextSibling.innerHTML = minusDateString;
			reload();
		} else {
			// 현재 날짜에서 월 더하기
			time = time.add(1, "M");
			// console.log(time)
			var plusDateString = time.format("YYYY년 MM월");
			this.previousSibling.innerHTML = plusDateString;
			reload();
		}
	}

	leftArrow.onclick = changeDate.bind(leftArrow, 'left');
	rightArrow.onclick = changeDate.bind(rightArrow, 'right');
	// --------------------------- 현재 날짜 출력 끝
	
	// --------------------------- 출장비 계산하기
	var roomInput = document.querySelector("[name=roomCost]");				// 숙박비
	var transInput = document.querySelector("[name=transportCost]");	// 교통비
	var foodInput = document.querySelector("[name=foodCost]");				// 식비
	var totalInput = document.querySelector("[name=totalCost]");			// 합계
	var etcInput = document.querySelector("[name=etcCost]");			// 기타 
	var dateLabel =  document.querySelector('label[for="businessTripDate"]')	// 출장기간
	var calculate = () => {
		var startDay = document.querySelector("[name=businessTripStartDate]").value;
		var endDay = document.querySelector("[name=businessTripEndDate]").value;
		var start = dayjs(startDay);
		var end = dayjs(endDay);
		var duration = end.diff(start, "day") + 1; // 4일
		
		// (일) 넣어주기
		var spanTag = dateLabel.querySelector("span"); 
		if(!spanTag ){	// 없으면 요소 만들어주고
			var text = document.createElement("span")
			text.innerHTML = " ( " + duration + "일 )";
			dateLabel.append(text);
		}else{			// 있으면 내용물 바꿔주기
			spanTag.innerHTML = " ( " + duration + "일 )";
		}
		
		
		// 숙박비
		roomInput.value = ( 50000 * duration ).toLocaleString('ko-KR') + "원";
		// 교통비    
		transInput.value = ( 30000 * duration ).toLocaleString('ko-KR') + "원";
		// 식비     
		foodInput.value = ( 10000 * duration * 3 ).toLocaleString('ko-KR') + "원";
		
		// 총 합계 계산하기
		totalCalculate();
			
		
	}
	
	// 총 합계 계산하는 함수
	var totalCalculate = () => {
		totalValue = roomInput.value.replaceAll(",", "").replaceAll("원", "") * 1
				+ transInput.value.replaceAll(",", "").replaceAll("원", "") * 1
				+ foodInput.value.replaceAll(",", "").replaceAll("원", "") * 1
				+ etcInput.value.replaceAll(",", "").replaceAll("원", "") * 1
 
		totalInput.value = totalValue.toLocaleString('ko-KR') + "원"; 
		
	}
	
	// input 요소 글자 넣을때마다 원 / , 찍어주기
	var costInputs = document.querySelectorAll('.cost');
	for(let cost of costInputs){
		cost.addEventListener('keyup', function(e) {
		  let value = e.target.value;
// 		  console.log(typeof value)
		  value = (value.replaceAll(',', '').replaceAll("원", ""))*1;
		  if(isNaN(value)) {
			  e.target.value = 0 + "원";
		  }else{
			  var formatValue = value.toLocaleString('ko-KR') + "원";
			  e.target.value = formatValue;
		  }
		})
		
	}
	
	// 적용하기 버튼 누르면 다시 계산하는 함수
	var modifyBtns = document.querySelectorAll('.modifyCost');
	for(let Btn of modifyBtns){
		Btn.addEventListener('click', function(e) {
			totalCalculate();
		});
	}
	// 출장 신청하기
	var insertFrm = document.querySelector("#insertFrm");
	var insertBusinessTrip = () => {
		var formData = new FormData(insertFrm);
		
		// 만들어야할 데이터 => 출장 일시 (시작 ~ 종료)  / 출장비 ={json형식으로 넣기}
		var startData = formData.get("businessTripStartDate");
		var endData = formData.get("businessTripEndDate");

		var costJSON = {};
		costJSON.roomCost = formData.get("roomCost").replaceAll(',', '').replaceAll("원", "");
		costJSON.transportCost = formData.get("transportCost").replaceAll(',', '').replaceAll("원", "");
		costJSON.foodCost = formData.get("foodCost").replaceAll(',', '').replaceAll("원", "");
		costJSON.etcCost = formData.get("etcCost").replaceAll(',', '').replaceAll("원", "");
		costJSON.totalCost = formData.get("totalCost").replaceAll(',', '').replaceAll("원", "");
		
		formData.append("businessTripDate", startData + ' ~ ' + endData);
		formData.append("businessTripExpense", JSON.stringify(costJSON));
		
		formData.delete("businessTripStartDate");
		formData.delete("businessTripEndDate");
		formData.delete("roomCost");
		formData.delete("transportCost");
		formData.delete("foodCost");
		formData.delete("etcCost");
		formData.delete("totalCost");
		
		for(let key of formData.keys()){
			console.log( key, " : ", formData.get(key));
		}
		
		var xhr = new XMLHttpRequest();
		xhr.open("post", "/workfit/mypage/insertBusinessTrip", true);
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log(xhr.responseText);
				$('#businessTrip-modal').on('hidden.bs.modal', function (e) {
					console.log("이거 먹음 ???")
					var selectBox = document.querySelector("#select2-businessTripConfirmid-7h-container");
					selectBox.title = "승인자를 선택해주세요";
					selectBox.innerHTML = "승인자를 선택해주세요";
					dateLabel.innerHTML ="출장기간";
					$(this).find('form')[0].reset();
				});
				$('#businessTrip-modal').modal("hide");
				toastr.success( '<h4 style="font-size:17px;" class="apple4">출장신청 완료</h4>');
				reload();
			}			
		}
		xhr.setRequestHeader(header, token);
		xhr.send(formData);
		
	}
	
	// 신청 삭제 모달창 띄우기
	var delModal = document.querySelector("#delete-modal");
	var codeTag = document.querySelector("#delCode")
	var deleteBusiness = function(iThis){
		$("#delete-modal").modal('show');
		
		// 필요한 값 찾기
		var trTag = iThis.closest("tr").children;
		console.log("tr태그", trTag);
		console.log("디스 ? ", iThis);
		var delbtDate = trTag[1].innerHTML;			// 해당 출장 날짜 
		var delbtName = trTag[2].innerHTML;			// 해당 출장 지역
		var delbtCode = iThis.id;					// 해당 출장 코드(시퀀스)
		
// 		// 모달 헤더 값 바꾸기 
		var modalTitle = delModal.querySelector("h4");
		modalTitle.innerHTML = "출장 신청 내역을 삭제하시겠습니까 ?";
		
// 		// 모달 컨텐트 바꾸기 
		var modalBody = delModal.querySelector(".modal-body");
		modalBody.replaceChildren();
		var pTag = document.createElement("p");
		pTag.innerHTML = "출장지 : "+delbtName +"<br><br>"+ delbtDate;
		pTag.setAttribute("class", "apple3");
		modalBody.append(pTag);
		
// 		// 휴가 코드 모달에 박기
		codeTag.innerHTML = delbtCode; 
	};
	
	var btDelete = function(iThis){		// 여기서 iThis 삭제 모달 확인 버튼
		var code = document.querySelector("#delCode").innerHTML;
		console.log("p태그 값 오닁 : ", code)
		var deleteAjax = new XMLHttpRequest();
		deleteAjax.open("post", "/workfit/mypage/deleteBusinessTrip", true);
		deleteAjax.onreadystatechange = () => {
			if(deleteAjax.readyState == 4 & deleteAjax.status == 200){
				console.log("delete 함수")
				console.log(deleteAjax.responseText);
				// 아작스 delete 성공일 경우 
				if(deleteAjax.responseText == "OK"){
					$("#delete-modal").modal('hide');
					reload();
				}
			}
		}
		deleteAjax.setRequestHeader(header, token);
// 		deleteAjax.setRequestHeader("Content-Type", "application/json");
		deleteAjax.send(code)
	}

	// 출장 상세보기 모달띄우기
	var startInput = document.querySelector("[name=businessTripStartDate]")
	var endInput = document.querySelector("[name=businessTripEndDate]")
	var locationInput = document.querySelector("[name=businessTripLocation]")
	var purposeInput = document.querySelector("[name=businessTripPurpose]")
	var select = document.querySelector("[name=businessTripConfirmid]")
	var showDetail = function(btId){
		console.log("출장 상세보기 코드 번호 : ", btId)
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/workfit/mypage/getOneBusiness/"+btId);
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				var json = JSON.parse(xhr.responseText);
				/*
				{
				    "businessTripCode": "14",
				    "memId": "a001",
				    "businessTripConfirmid": "a001",
				    "businessTripPurpose": "123",
				    "businessTripDate": "2023/03/06 ~ 2023/03/17",
				    "businessTripExpense": "{\"roomCost\":\"600000\",\"transportCost\":\"360000\",\"foodCost\":\"360000\",\"etcCost\":\"\",\"totalCost\":\"1320000\"}",
				    "businessTripLocation": "대덕",
				    "businessTripStatus": "N",
				    "businessTripSigndate": 1674045164000,
				    "memName": "조현수"
				}
				*/
				var days = json.businessTripDate.split(" ~ ");
				var expenseJson = JSON.parse(json.businessTripExpense);
				
				
				// json 정보들 넣기
				startInput.value = days[0];
				endInput.value = days[1];
				locationInput.value = json.businessTripLocation;
				purposeInput.value = json.businessTripPurpose;
				roomInput.value = Number(expenseJson.roomCost).toLocaleString('ko-KR') + "원";
				transInput.value = Number(expenseJson.transportCost).toLocaleString('ko-KR') + "원";
				foodInput.value = Number(expenseJson.foodCost).toLocaleString('ko-KR') + "원";
				etcInput.value = Number(expenseJson.etcCost).toLocaleString('ko-KR') + "원";
				totalInput.value = Number(expenseJson.totalCost).toLocaleString('ko-KR') + "원";
				var selectBox = document.querySelector(".select2-selection__rendered");
				selectBox.title = json.confirmName + " (" + json.confirmJobGrade +")"
				selectBox.innerHTML = json.confirmName + " (" + json.confirmJobGrade +")"
				startInput.disabled = true;
				endInput.disabled = true;
				locationInput.disabled = true;
				purposeInput.disabled = true;
				roomInput.disabled = true; 
				transInput.disabled = true;
				foodInput.disabled = true; 
				etcInput.disabled = true;
				totalInput.disabled = true;
				select.disabled = true;
				$('#businessTrip-modal').modal("show");
			}
		}
		xhr.send();
	}
	
	// 출장 신청 내용 리로드 하는 함수 ~~
	var memId = document.querySelector("[name=memId]").value;
	let tbody = document.querySelector("#btTable")
	var reload = () => {
		var findTime = time.format("YYYY/MM/DD");
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/workfit/mypage/myBusinessTrip?memId=" + memId + "&time=" + findTime, true);
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log(" 리로드 하기~~~~~~")
				var businessTrips = JSON.parse(xhr.responseText);
				console.log(businessTrips);
				/*
				{
				    "businessTripCode": "1",
				    "memId": "a000",
				    "businessTripConfirmid": "a02",
				    "businessTripPurpose": "시장조사",
				    "businessTripDate": "2023/01/02 ~ 2023/01/06",
				    "businessTripExpense": "{\"roomCost\":\"250000\",\"transportCost\":\"150000\",\"foodCost\":\"150000\",\"etcCost\":\"\",\"totalCost\":\"550000\"}",
				    "businessTripLocation": "대덕인재",
				    "businessTripStatus": "N"
				}
					순번	일자	출장지	사유	승인여부	삭제
				*/
				var tBodyText = "";
				var indexNum = 0;
				if(businessTrips.length < 1){
					tBodyText += `<tr><td colspan='7'>출장 신청 내역이 없습니다</td></tr>`;
				}else{
					for(let bTrip of businessTrips){
						indexNum ++;	
						tBodyText += `<tr>`;
						tBodyText += `<td>\${indexNum }</td>`;						// 순번
						var dayArr = bTrip.businessTripDate.split(" ~ ")
						tBodyText += '<td>'+ dayArr[0].replaceAll("/", ".") + ". ~ " + dayArr[1].replaceAll("/", ".")+'.<s/td>';		// 일자
						tBodyText += `<td>\${bTrip.businessTripLocation }</td>`;	// 출장지
						tBodyText += `<td>\${bTrip.businessTripPurpose }</td>`;		// 사유
						if(bTrip.businessTripStatus == 'N' ){
							tBodyText += `<td>승인대기</td>`;						// 승인 아직 안되었을 경우
							tBodyText += `<td><button type="button" class='btn text-dark' style="font-size : 13px; background-color : #CFD5DF;" onclick="showDetail('\${bTrip.businessTripCode}')">상세보기</button></td>`;						// 승인 아직 안되었을 경우
							tBodyText += `<td><i class="mdi mdi-delete-outline" style="font-size : 18px; onclick="deleteBusiness(this)" id="\${bTrip.businessTripCode}"></i></td>`; // 삭제
						}else if(bTrip.businessTripStatus == 'D' ){
							tBodyText += `<td>반려</td>`;						// 승인 되었을 경우
							tBodyText += `<td><button type="button" class='btn text-dark' style="font-size : 13px; background-color : #CFD5DF;" onclick="showDetail('\${bTrip.businessTripCode}')">상세보기</button></td>`;						// 승인 아직 안되었을 경우
							tBodyText += `<td><i class="mdi mdi-delete-off-outline" style="font-size : 18px;"></i></td>`; // 삭제
						}else{
							tBodyText += `<td>승인완료</td>`;						// 승인 되었을 경우
							tBodyText += `<td><button type="button" class='btn text-dark' style="font-size : 13px; background-color : #CFD5DF;" onclick="showDetail('\${bTrip.businessTripCode}')">상세보기</button></td>`;						// 승인 아직 안되었을 경우
							tBodyText += `<td><i class="mdi mdi-delete-off-outline" style="font-size : 18px;"></i></td>`; // 삭제
						}
						tBodyText += `</tr>`;
						
					}
				}
			}
			tbody.innerHTML = tBodyText;			
		}
		xhr.send();
	}
	// 출장 신청 모달창 닫을 때 이벤트 

	$(function() {
// 		getGeocoder();
		reload();
		$('#businessTrip-modal').on('hidden.bs.modal', function (e) {
			console.log("이거 먹음function에 들어있는거임~~ ???")
			var selectBox = document.querySelector(".select2-selection__rendered");
			console.log("이거 있니 ?", selectBox);
			selectBox.title = "승인자를 선택해주세요";
			console.log(selectBox.title);
			selectBox.innerHTML = "승인자를 선택해주세요";
			dateLabel.innerHTML ="출장기간";
			startInput.disabled = false;
			endInput.disabled = false;
			locationInput.disabled = false;
			purposeInput.disabled = false;
			roomInput.disabled = false; 
			transInput.disabled = false;
			foodInput.disabled = false; 
			etcInput.disabled = false;
			totalInput.disabled = false;
			$(this).find('form')[0].reset();
		});
// 		$('#businessTrip-modal').modal("show");
	})
	
// 	$(document).off('.datepicker.data-api');
	// date-picker 설정
// 	$('.datepicker').datepicker({
// 	    format: 'yyyy/mm/dd',
// 	    locale : 'kr'
// 	});
	
	// ----------------------------- 지도 관련 script
// 	var map = null;

// 	function initMap() {
//     	map = new naver.maps.Map('map', {
//         	center: new naver.maps.LatLng(37.3595704, 127.105399),
//            	zoom: 10
//        	});
//    	}
	
	// 대덕인재 개발원 geocoder 사용해보기
// 	var getGeocoder = () => {
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("get", "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocod?query=은구비남로 55", false);
// 		xhr.onreadystatechange = () => {
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				console.log(xhr.responseText)
// 			}
// 		};
// 		xhr.setRequestHeader(header, token);
// 		xhr.setRequestHeader("Content-Type", "application/json")
// 		xhr.setRequestHeader('X-NCP-APIGW-API-KEY-ID', '4hm33jxj4j');	// 앱 등록 시 발급받은 Client ID
// 		xhr.setRequestHeader('X-NCP-APIGW-API-KEY', '7CXFKIY34hJfv9UGl4BjTQem1xaCXynemCoKovEV');		// 앱 등록 시 발급 받은 Client Secret

// 		xhr.send();
// 	}
// naver.maps.Service.geocode({
//         address: '불정로 6'
//     }, function(status, response) {
//         if (status !== naver.maps.Service.Status.OK) {
//             return alert('Something wrong!');
//         }

//         var result = response.result, // 검색 결과의 컨테이너
//             items = result.items; // 검색 결과의 배열
// 			console.log(items)
//         // do Something
// });

</script>
<style>
.modal-content {
	overflow-y: initial;
	height: 90%;
}

.modal-body {
	height: 70%;
	overflow-y: auto;
}

#businessTrip-modal .col-3, .col-8 {
	border: 1px solid grey;
}
.tr-title{
	width: 20%;
	background-color: #f7f7f7;
}
#businessTrip td{
	font-size : 17px;
	vertical-align : middle;
}
</style>

