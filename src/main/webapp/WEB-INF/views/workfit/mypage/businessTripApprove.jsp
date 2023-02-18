
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.table td, .table thead th{
	vertical-align : middle;
	border-bottom: 1px solid #dbdee0 !important;
    padding: 10px;
	height: 55.76px;
}
.table tr:hover{
  	background-color: #e7ecf1;  
}  	
input[type="checkbox"] {
	accent-color : #5f7cbb;
}
tbody > tr{
	cursor: pointer;
}
</style>
<!--  맨위에 보여주는 페이지 -->
<div class='row mt-2'>
	<div class='col-12'>
		<div class='mr-2 card p-3 workfitCardBg'
			style="border-radius: 0.7rem;">
			<div class='card p-3' style="border-radius: 0.7rem;">

				<h5 class='apple4 page-title text-dark pl-3 pt-2'
					style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>출장 승인</h5>

				<hr class="ml-3 mr-3 mt-1 mb-1">
				<div class="apple4 pl-3 pr-3 text-dark pb-2"
					style="font-size: 19px;">
					<span class="badge badge-warning badge-pill">TIP</span><br>
                           	 출장 신청에 대한 승인 및 반려 처리를 진행하는 페이지입니다<br>
				</div>
			</div>
		</div>
	
	
	
		<div class='card mr-2 workfitCardBg'>
			<div class='card-body p-4'>
				<div class='card-title'>
					<h5 class='apple4 page-title text-dark ml-3'
						style='font-size: 26px; letter-spacing: 2px;'>출장 승인</h5>
				</div>
				<div class='row mb-3'>
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
				            <button type="button" class="btn workfitBtn mb-2 apple3 pl-3 pr-3 text-center" style="padding-top: 10px; padding-bottom:10px;font-size:17px;" 
				            	onclick="approveBT('OK', 'multiple')">일괄 승인</button>                                                                      
						</div>
					</div>
					<table class='apple3 alternative-page-datatable table mb-0 text-center text-dark'>                                                                
		           		<thead>                                                                                                           
			                <tr class="apple5">                                                                                                           
				                <th scope='col'><input type="checkbox" id="checkAll" onclick="checkAll()"/></th>                                                                       
				                <th scope='col'>순번</th>                                                                       
				                <th scope='col'>신청자</th>                                                                      
				                <th scope='col'>신청내용</th>                                                                      
				                <th scope='col'>일자</th>                                                                     
				                <th scope='col'>승인여부</th>                                                                      
			             	</tr>                                                                                                          
		              	</thead>                                                                                                          
		              	<tbody id="btTable">
	            		</tbody>
	            	</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end of content-->
<!--  상세 페이지 모달 -->
<div id="detail-modal" class="modal fade apple3" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title ml-1 text-dark" id="standard-modalLabel" style="font-size: 30px;">출장 신청</h1>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
				<!-- 문서 상단 내용  -->
				<div class='card shadow p-2 bg-white rounded'>
					<div class='card-body p-3 pt-2'>
						<div class='card-title row' style="font-size: 16px">
								<!--  회원 아이디 -->
								<input type="hidden" name="businessTripCode" value="">
	<!-- 							<div class="col-12 mb-3" > -->
								<div class="col-12 mb-3 text-center" style="background-color: #e9ecef; border-radius: 0.25rem;">
									<h4 class="apple4 text-dark" style="font-size: 20px;">출장 신청 개요</h4>
								</div>
								<div class="col-2">
									<label for="memName" class="text-dark">신청자</label>
									<div id="memName"></div>
								</div>
								<div class=" col-2">
									<label for="memDeptName" class="text-dark">부서</label>
									<div id="memDeptName">${memDeptName }</div>
								</div>
								<div class=" offset-2 col-6">
									<label for="businessTripDate" class="text-dark">출장기간</label>
									<div id="businessTripDate"></div>
								</div>
								<div class=" col-6">
									<label for="businessTripLocation" class="text-dark">출장지</label>
									<div id="businessTripLocation"></div>
								</div>
								<div class=" col-6">
									<label for="businessTripPurpose" class="text-dark">출장목적</label>
									<div id="businessTripPurpose"></div> 
								</div>
								<hr/>
								<div class="col-12 mb-3 mt-3 text-center" style="background-color: #e9ecef; border-radius: 0.25rem;">
									<h4 class="apple4 text-dark" style="font-size: 20px;">예상 출장 경비</h4>
								</div>
								<table class="table table-hover text-dark text-center" id="businessTrip" style="font-size: 16px;">
									<tbody>
										<tr>
											<td class="tr-title">숙박비</td>
											<td>1</td>
										</tr>
										<tr>
											<td class="tr-title">교통비</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="tr-title">식비</td>
											<td>3</td>
										</tr>
										<tr>
											<td class="tr-title">기타</td>
											<td>4</td>
										</tr>
										<tr>
											<td style="background-color: #f7f7f7">합계</td>
											<td>
												<input class="form-control text-center" type="text" name="totalCost" readonly="readonly"
													value="0,000원">
											</td>
										</tr>
									</tbody>
								</table>
						</div><!--  end of card-title -->
					</div><!-- end of card-body -->
				</div><!--  end of card -->
            </div><!-- end of modal-body -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" style="background-color: #5f7cbb; color: white;" onclick="approveBT('OK', 'single')">승인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal" onclick="approveBT('NO', 'single')">반려</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--  상세 페이지 모달 끝-->

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
	
	// 상세 페이지 모달 띄우는 함수
	var memName = document.querySelector("#memName")		// 신청자
	var memDptName = document.querySelector("#memDeptName")		// 소속
	var btLocation = document.querySelector("#businessTripLocation")		// 출장지
	var btDate = document.querySelector("#businessTripDate")		// 출장기간
	var btPurpose = document.querySelector("#businessTripPurpose")		// 숙박비
	var total = document.querySelector("input[name=totalCost]")		// 숙박비
	var btCode = document.querySelector("input[name=businessTripCode]")		// 출장코드
	let trs = document.querySelectorAll(".tr-title")					// 돈 넣을 td들
	var showDetail = function(btId){
		console.log(btId);
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/workfit/mypage/getOneBusiness/"+btId);
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log(JSON.parse(xhr.responseText));
				var res = JSON.parse(xhr.responseText)
				
				// 모달에 데이터 넣어주기
				memName.innerHTML = res.memName;						// 이름
				btLocation.innerHTML = res.businessTripLocation;		// 출장지
				
				var dayArr = res.businessTripDate.split(" ~ ")
				btDate.innerHTML = '<td>'+ dayArr[0].replaceAll("/", ".") + ". ~ " + dayArr[1].replaceAll("/", ".")+'.<s/td>';		// 일자
				
				btPurpose.innerHTML = res.businessTripPurpose;			// 출장 목적
				btCode.value = res.businessTripCode;					// 출장 코드 번호
				         
				var money = JSON.parse(res.businessTripExpense);
				trs[0].nextElementSibling.innerHTML = money.roomCost + " 원";				// 숙박
				trs[1].nextElementSibling.innerHTML = money.transportCost + " 원";			// 교통비
				trs[2].nextElementSibling.innerHTML = money.foodCost+ " 원";				// 식비
				console.log("money.totalCost >" + money.totalCost + "<")
				if(money.etcCost == ""){
					trs[3].nextElementSibling.innerHTML = " - ";				// 기타
				}else{
					trs[3].nextElementSibling.innerHTML = money.etcCost + " 원";				// 기타
				}
				total.value = money.totalCost + " 원";										// 총합
				$('#detail-modal').modal("show");
			}
		}
		xhr.send();
		
		/*
		{
		    "businessTripCode": "4",
		    "memId": "a01",
		    "businessTripConfirmid": "a001",
		    "businessTripPurpose": "123",
		    "businessTripDate": "2023/01/23 ~ 2023/01/27",
		    "businessTripExpense": "{\"roomCost\":\"250000\",\"transportCost\":\"150000\",\"foodCost\":\"150000\",\"etcCost\":\"\",\"totalCost\":\"550000\"}",
		    "businessTripLocation": "123",
		    "businessTripStatus": "N",
		    "businessTripSigndate": null,
		    "memName": "정종은1"
		}
			var memName = document.querySelector("#memName")		// 신청자
			var memDptName = document.querySelector("#memDeptName")		// 소속
			var btLocation = document.querySelector("#businessTripLocation")		// 출장지
			var btDate = document.querySelector("#businessTripDate")		// 출장기간
			var btPurpose = document.querySelector("#businessTripPurpose")		// 숙박비
		*/
		
	}
	
	// 체크박스 누르면 다른 체크박스들 다 체크하기
	var checkAll = () => {
		var checkBoxAll = document.querySelectorAll("input[type=checkbox]");
		for(let i = 1; i < checkBoxAll.length ; i++){
			checkBoxAll[i].checked = checkBoxAll[0].checked 
		}
		console.log(checkBoxAll)
	}
	
	// 승인/반려 버튼 누르면 승인/반려으로 바꿔주기
	var approveBT = (status, category) => {
		// status (OK / NO) (승인 / 반려)
		// category (single / mulitple) (단일승인/ 일괄승인)
		if(status == 'OK'){
			status = "Y";
		}else{
			status = "D";
		}
		var list = [];
		if(category == 'single'){
			list.push(btCode.value);
		}else if(category == 'multiple'){
			var checkBoxAll = document.querySelectorAll("input[type=checkbox]");
			for(let i = 1; i < checkBoxAll.length ; i++){
				if(checkBoxAll[i].checked){			// i번째 checkbox가 선택되어 있다면
					list.push(checkBoxAll[i].parentElement.id);
				} 
			}				
		}
	
		// {status : Y, btList : [1, 2, 3]}
		var updateJSON = {};
		updateJSON.status = status;
		updateJSON.btList = list;
		
		console.log(updateJSON);
		
		var xhr = new XMLHttpRequest();
		xhr.open("post", "/workfit/mypage/businessTripManage", true);
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log(xhr.responseText);
				$('#detail-modal').modal("hide");
				toastr.success( '<h4 style="font-size:17px;" class="apple4">출장 처리 완료</h4>');
				reload();
			}
		}
		xhr.setRequestHeader('Content-Type', "application/json;charset=utf-8");
		xhr.setRequestHeader(header, token);
		xhr.send(JSON.stringify(updateJSON));
	}
	
	
	// 출장 신청 내용 리로드 하는 함수 ~~
	let tbody = document.querySelector("#btTable");
	var reload = () => {
		var findTime = time.format("YYYY/MM/DD");
		console.log(findTime);
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/workfit/mypage/myBusinessTripApprove?time=" + findTime , true);
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
					      
				선택  순번   신청자	일자		승인여부
      
				*/
				var tBodyText = "";
				var indexNum = 0;
				if(businessTrips.length < 1){
					tBodyText += `<tr><td colspan='7'>출장 신청 내역이 없습니다</td></tr>`;
				}else{
					for(let bTrip of businessTrips){
						indexNum ++;	
						tBodyText += `<tr data-code="\${bTrip.businessTripCode}" >`;
						tBodyText += `<td id='\${bTrip.businessTripCode}'><input type="checkbox" value="" id="approve\${indexNum}"></td>`;							// 선택 
						tBodyText += `<td>\${indexNum }</td>`;						// 순번
						tBodyText += `<td>\${bTrip.memName }</td>`;					// 신청자
						tBodyText += `<td>\${bTrip.businessTripLocation } (출장)</td>`;	// 신청자
						var dayArr = bTrip.businessTripDate.split(" ~ ")
						tBodyText += '<td>'+ dayArr[0].replaceAll("/", ".") + ". ~ " + dayArr[1].replaceAll("/", ".")+'.<s/td>';
						if(bTrip.businessTripStatus == 'N' ){
							tBodyText += `<td>대기</td>`; // 삭제
						}else if(bTrip.businessTripStatus == 'N' ){
							tBodyText += `<td>반려</td>`; // 삭제
						}else{
							tBodyText += `<td>완료</td>`; // 삭제
						}
						tBodyText += `</tr>`;
					};	
				};
			};
			tbody.innerHTML = tBodyText;	
			
			var trs = document.querySelectorAll("#btTable > tr");
			for(let tr of trs){
				console.log("tr 이벤트 주는중 !")
				console.log(tr)
				console.log(tr.dataset.code)
				if(tr.dataset.code){
// 					console.log("이벤트먹음 ? ")
					for(let i = 1 ; i < tr.cells.length ; i++){
						console.log(tr.cells[i])
						tr.cells[i].onclick = showDetail.bind(tr, tr.dataset.code);
					};
				};
			};
		}
		xhr.send();
	};
	

	$(function() {
// 		getGeocoder();
		reload();
// 		$('#detail-modal').modal("show");
	})
	

</script>


