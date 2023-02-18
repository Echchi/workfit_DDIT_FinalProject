<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!--  휴가 신청 모달창  -->
<div id="vacation-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="" class="pl-3 pr-3 insertVacation">
	        <div class="modal-header">
		        <div class="text-center mt-2">
		            <h1 class="apple4 text-dark text-left ml-3 mt-2" style="font-size:30px;">휴가 신청</h1>
		            <h1 class="apple4 text-grey text-left ml-3" style="font-size:20px;">${memName}</h1>
		        </div>
	        </div>
            <div class="modal-body apple3 text-dark" >
                	<input type="hidden" name="memIdFk" value="${memId }" >
                    <div class="form-group">
                        <label for="v_startend" style="font-size: 18px">날짜</label>
   						<input type="text" class="form-control date" id="v_startend" data-toggle="date-picker" data-cancel-class="btn-warning">
                    </div>
                    <div class="form-group">
                        <label for="vTypeFk"  style="font-size: 18px">종류</label>
   						<select class="form-control select2" name="vTypeFk" data-toggle="select2">
						    <option>종류선택</option>
						    <optgroup label="연차/대체휴가" class="V">
						    	<c:set value="${vacationType['V'] }" var="vList"/>
						    	<c:forEach items="${vList }" var="item">
						        	<option value="${item.vctCode }">${item.vcType }</option>
						    	</c:forEach>
						    </optgroup>
						    <optgroup label="병가" class="S">
						    	<c:set value="${vacationType['S'] }" var="vList"/>
						    	<c:forEach items="${vList }" var="item">
						        	<option value="${item.vctCode }">${item.vcType }</option>
						    	</c:forEach>
						    </optgroup>
						    <optgroup label="공가" class="O">
						    	<c:set value="${vacationType['O'] }" var="vList"/>
						    	<c:forEach items="${vList }" var="item">
						        	<option value="${item.vctCode }">${item.vcType }</option>
						    	</c:forEach>
						    </optgroup>
						    <optgroup label="기타" class="E">
						    	<c:set value="${vacationType['E'] }" var="vList"/>
						    	<c:forEach items="${vList }" var="item">
						        	<option value="${item.vctCode }">${item.vcType }</option>
						    	</c:forEach>
						    </optgroup>
						</select>
                    </div>
                    <div class="form-group">
                        <label for="vReason"  style="font-size: 18px">사유</label>
                        <input class="form-control" type="text" required name="vReason" placeholder="사유를 입력해주세요">
                    </div>
					<sec:csrfInput/>
            </div>
            <div class="modal-footer">
				<button type="submit" class="btn" style="background-color: #5f7cbb; color: white;">신청</button>
				<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
            </div>
        </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--  휴가 신청 모달창 끝 -->
<!--  휴가 삭제 모달창 시작 -->
<div id="delete-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title apple6 text-dark" id="standard-modalLabel" style="font-weight: bolder; font-size: 18px">신청 내역을 삭제하시겠습니까 ?</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
            </div>
            <p style="display: none" id="delCode"></p>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color: #5f7cbb; color: white;" onclick="vacDelete(this)">확인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--  휴가 삭제 모달창 끝 -->

<!--  맨위에 보여주는 페이지 -->
<div class='row mt-2'>                                                                                                         
	<div class='col-12'>        
		<div class='mr-2 card p-3 workfitCardBg'
				style="border-radius: 0.7rem;">
				<div class='card p-3' style="border-radius: 0.7rem;">
	
					<h5 class='apple4 page-title text-dark pl-3 pt-2'
						style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>나의 휴가</h5>
	
					 <hr class="ml-3 mr-3 mt-1 mb-1">
					<div class="apple4 pl-3 pr-3 text-dark pb-2"
					style="font-size: 19px;">
						<span class="badge badge-warning badge-pill">TIP</span><br>
                           	 나의 휴가 사용 현황을 한눈에 확인할 수 있으며 휴가 상세 내역을 조회 가능합니다<br>
					</div>
				</div>
			</div>                                                                                                  
		<div class='card mr-2 workfitCardBg'>                                                                                                         
        	<div class='card-body p-4'>                                                                                                 
           		<div class='card-title'>                                                                                             
              		<h5 class='apple4 page-title text-dark ml-4' style='font-size: 26px; letter-spacing: 2px;'>휴가 관리</h5>                                                       
           		</div>                                                                                                               
	           	<div class='row mb-2'>
	           		<!--  월별 날짜 출력 -->
	            	<div class='col-12'>
		            	<h1 class="apple4 text-dark text-center" id="dateHeader" style="font-size:30px;">
							<i class="dripicons-chevron-left mr-3"></i><i class="dripicons-chevron-right ml-3"></i>
						</h1>
	            	</div>                                                                                      
	           		<!--  월별 날짜 출력 끝-->
	            </div>
	            <div class="row break mt-4 ml-3 mr-3 apple3"> 
	            	<div class="col pr-1">
						<div class="card" style="background-color: rgba(54,155,243, 0.2); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
							<div class="card-body row" >
								<div class="col-5 text-center">
									<i class="mdi mdi-airplane-takeoff text-dark" style="font-size: 45px"></i>
								</div>
								<div class="col-7">
							    	<h4 class="text-dark">총 휴가일 수</h4>
							    	<h6 class="apple5 text-dark" style="font-size: 25px;">12<span style="font-size: 15px"> 개</span></h6>
								</div>
						  	</div>
						</div>
	            	</div>
	            	<div class="col pr-1">
						<div class="card" style="background-color: rgba(50,199,96, 0.2); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
							<div class="card-body row" >
								<div class="col-5 text-center pl-0 pr-0">
									<i class="mdi mdi-sticker-check text-dark" style="font-size: 45px"></i>
								</div>
								<div class="col-7">
							    	<h4 class="text-dark pl-0">휴가 잔여일 수</h4>
							    	<h6 class="apple5 remainDate text-dark" style="font-size: 25px;">${12 - useDate }<span style="font-size: 15px" class="text-secondary"> 개</span></h6>
								</div>
						  	</div>
						</div>
	            	</div>
	            	<div class="col pr-2">
						<div class="card" style="background-color: rgba(254,92,91, 0.2); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
							<div class="card-body row" >
								<div class="col-5 text-center pl-0 pr-0">
									<i class="mdi mdi-sticker-minus text-dark" style="font-size: 45px"></i>
								</div>
								<div class="col-7">
							    	<h4 class="text-dark">휴가 사용일 수</h4>
							    	<h6 class="apple5 usedDate text-dark" style="font-size: 25px;">${useDate }<span style="font-size: 15px"> 개</span></h6>
								</div>
						  	</div>
						</div>
	            	</div>
                </div>                                                                               
	        <!-- end of content-header -->                                                                                                               
	           	<div class='row ml-3 mr-3'> 
		              	<div class='col-sm-4 offset-8'>                                                                                            
		                	<div class='text-sm-right'>  
		                    	<button type='button' class='btn btn-primary mb-2 apple4 text-center' data-toggle="modal" data-target="#vacation-modal">근태 현황/ 신청</button>                                            
		                 	</div>                                                                                                         
		            	</div>                                                                                                   
	          		<!-- 테이블을 넣어보자 -->   
	           		<table class='alternative-page-datatable table table-hover mb-0'>                                                                
		           		<thead>                                                                                                           
			                <tr>                                                                                                           
				                <th class='apple4' scope='col'>일자</th>                                                                       
				                <th class='apple2' scope='col'>일수</th>                                                                     
				                <th class='apple2' scope='col'>휴가유형</th>                                                                  
				                <th class='apple2' scope='col'>사유</th>                                                                      
				                <th class='apple2' scope='col'>삭제</th>                                                                      
			             	</tr>                                                                                                          
		              	</thead>                                                                                                          
		              	<tbody>
	            		</tbody>
	            	</table>
	        	</div>                                                                                                               
	        </div>
    	</div>
   	</div>
</div>
<!-- end of content-->
<script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
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
	var changeDate = function(flag){
		if(flag == 'left'){
			// 현재 날짜에서 월 빼기
			time = time.subtract(1, "M");
			var minusDateString = time.format("YYYY년 MM월");
				// console.log(this.nextSibling);
			this.nextSibling.innerHTML = minusDateString;
			reload();
		}else{
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
	
	// --------------------------- 휴가 신청하기 ! 
	let insertVacationForm = document.querySelector('.insertVacation');
	insertVacationForm.addEventListener('submit', () => {
		event.preventDefault();
		
		// 날짜 형식 처리
		let date = document.querySelector('#v_startend').value;
		let splitdate = date.split(" - ");
		var startDate = splitdate[0].split("/");
		startDate = `\${startDate[2]}/\${startDate[0]}/\${startDate[1]}`;
		var endDate = splitdate[1].split("/");
		endDate = `\${endDate[2]}/\${endDate[0]}/\${endDate[1]}`;
		
		// formData 수정
		var formData = new FormData(insertVacationForm);
		formData.delete("v_startend");
		formData.append("vStart", startDate)
		formData.append("vEnd", endDate)
		for (var key of formData.keys()) {
		   console.log(key);
		}
		var xhr = new XMLHttpRequest();
// 		true => 비동기 방식
		xhr.open("post", "/workfit/mypage/insertVacation", true);
		xhr.onreadystatechange = () =>{
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log(xhr.responseText)
				if(xhr.responseText == "OK"){
					$('#vacation-modal').modal('hide');
					reload();
				};
			}
		}
		xhr.setRequestHeader(header, token);
		xhr.send(formData);
	})
	// ------------------------------- 휴가 신청 아작스 처리 끝 
	
	// ------------------------------- 삭제 버튼 누르면 휴가 신청 삭제하기
	var delModal = document.querySelector("#delete-modal");
	var codeTag = document.querySelector("#delCode")
	var deleteModal = function(iThis){
		$("#delete-modal").modal('show');
		
		// 필요한 값 찾기
		var trTag = iThis.closest("tr").children;
		var delDate = trTag[0].innerHTML;		// 해당 휴가 날짜 
		var delvacName = trTag[2].innerHTML;	// 해당 휴가 이름
		var delCode = iThis.id;					// 해당 휴가 코드(시퀀스)
		
		// 모달 헤더 값 바꾸기 
		var modalTitle = delModal.querySelector("h4");
		modalTitle.innerHTML = delvacName + " 신청 내역을 삭제하시겠습니까 ?";
		
		// 모달 컨텐트 바꾸기 
		var modalBody = delModal.querySelector(".modal-body");
		modalBody.replaceChildren();
		var pTag = document.createElement("p");
		pTag.innerHTML = delDate;
		pTag.setAttribute("class", "apple3");
		modalBody.append(pTag);
		
		// 휴가 코드 모달에 박기
		codeTag.innerHTML = delCode; 
		
	}
	// 삭제 확인 버튼 누르면 진행되는 아작스 함수
	var vacDelete = function(iThis){		// 여기서 iThis 삭제 모달 확인 버튼
		var code = document.querySelector("#delCode").innerHTML;
		console.log("p태그 값 오닁 : ", code)
		var deleteAjax = new XMLHttpRequest();
		deleteAjax.open("post", "/workfit/mypage/deleteVacation", true);
		deleteAjax.onreadystatechange = () => {
			if(deleteAjax.readyState == 4 & deleteAjax.status == 200){
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
	// ------------------------------- 삭제하기 끝 !!
	
	// ------------------------------- 테이블 정보 다시 불러오는 메소드 !!!
	let tbody = document.querySelector("tbody")
	var reload = () => {
		// {memId : 'w001', findTime : '2023/01/23' }
		let jsonData = {};
		jsonData.memId = document.querySelector('input[name="memIdFk"]').value;
		jsonData.findTime = time.format("YYYY/MM/DD");
		console.log(jsonData)
		
		let ajax = new XMLHttpRequest();
		// json DATA 만들기 끝
		
		ajax.open("post", "/workfit/mypage/myVacationList", true);
		ajax.onreadystatechange = () =>{
			if(ajax.readyState == 4 & ajax.status == 200){
				console.log(" 리로드 하기~~~~~~")
				var vacations = JSON.parse(ajax.responseText);
				console.log(vacations)
				var tBodyText = "";
				if(vacations.length == 0){
					tBodyText += `<tr>`;
					tBodyText += `<td colspan='5' class="text-center">휴가 신청 내역이 없습니다</td>`;
					tBodyText += `<tr>`;
					
				}
				for(var vacation of vacations){
					// 시간 포맷 정해주기 
					var startTime = dayjs(vacation.vstart).format("YYYY/MM/DD(ddd)");
					var endTime = dayjs(vacation.vend).format("YYYY/MM/DD(ddd)");
					var vacaTime = "";
					if(startTime == endTime){ vacaTime = startTime; }
					if(startTime != endTime){
						var customEnd = dayjs(endTime).format("DD(ddd)");
						vacaTime = startTime + " - " + customEnd;
					}
					var diffTime = dayjs(vacation.vend).diff(dayjs(vacation.vstart), "d") +1; 
					tBodyText += `<tr>`;
					tBodyText += `<td>\${vacaTime }</td>`;
					tBodyText += `<td>\${diffTime }일</td>`;
					tBodyText += `<td>\${vacation.vcType }</td>`;
					tBodyText += `<td>\${vacation.vreason }</td>`;
					tBodyText += `<td><i class="mdi mdi-delete-outline" onclick="deleteModal(this)" id="\${vacation.vcode}"></i></td>`;
					tBodyText += `</tr>`;
				}
				tbody.innerHTML = tBodyText;
			}
		}
		ajax.setRequestHeader(header, token);
		ajax.setRequestHeader('Content-Type', 'application/json');
		ajax.send(JSON.stringify(jsonData));
	};
	// ----------------------------- 테이블 정보 가져오는 아작스 reload() 함수 끝 
	
	$(function(){
		reload();
		
	});
	
	
</script>
<style>
.break{
	font-weight: bold;
}
</style>

