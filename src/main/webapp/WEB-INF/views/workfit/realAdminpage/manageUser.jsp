<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="content-page">
		<div class="content">
			<div class="row mt-2">
				<div class="col-12">
				<div class='workfitCardBg card mr-2'>                                                                                                 
        			<div class='card-body p-4'> 
					<div class='card p-3' style="border-radius: 0.7rem;">
	
					<h5 class='apple4 page-title text-dark pl-3 pt-2'
						style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>유저관리</h5>
	
					<hr class="ml-3 mr-3 mt-1 mb-1">
					<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size: 19px;">
						<span class="badge badge-warning badge-pill">TIP</span><br>
						유저관리 페이지에서는 멤버십 결제에 따른 유저를 관리할 수 있습니다<br>
						총 유저, 사용 중인 유저, 추가 가능 유저를 한 눈에 살펴볼 수 있으며 엑셀을 통해 일괄등록이 가능합니다 
					</div>

				
							<div class="pl-2 pr-2 justify-content-center apple4"> 
								<div class="row justify-content-center apple4">
									<div class="col-2 mr-4 mt-3">
										<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
											<div class="card-body" >
												<div class="text-center">
													<h4 class="appl4 card-title text-dark" style="font-size:26px;">총 유저</h4>
												</div>
													<h4 class="apple5 text-dark text-center" style="font-size: 31px;">${numMap['totalNum']} 명</h4>
											</div>
										</div>
									</div>
									<div class="col-2 mr-4 mt-3">
										<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
											<div class="card-body" >
												<div class="text-center">
													<h4 class="appl4 card-title text-dark" style="font-size:26px;">사용 중인 유저</h4>
												</div>
													<h4 class="apple5 text-dark text-center" style="font-size: 31px;">${numMap['presentNum']} 명</h4>
											</div>
										</div>
									</div>
									<div class="col-2 mr-4 mt-3">
										<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
											<div class="card-body" >
												<div class="text-center">
													<h4 class="appl4 card-title text-dark" style="font-size:26px;">추가 가능 유저</h4>
												</div>
													<h4 class="apple5 text-dark text-center" style="font-size: 31px;">${numMap['availableNum']} 명</h4>
											</div>
										</div>
									</div>
								</div>
<!-- 								<div class="col pr-1"> -->
<!-- 									<div class="card border-secondary shadow-lg" style="border-radius: 0.7rem" onclick="moveFirstTab()"> -->
<!-- 										<div class="card-body row" > -->
<!-- 											<div class="col-7"> -->
<!-- 												<h4 class="appl4 card-title text-dark">사용중인 유저</h4> -->
<%-- 												<h1 class="apple7 card-text" style="text-align: center;">${numMap['presentNum']} 명</h1> --%>
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->


<!-- 								<div class="col pr-2"> -->
<!-- 									<div class="card border-secondary shadow-lg" style="border-radius: 0.7rem" onclick="moveSecondTab()"> -->
<!-- 										<div class="card-body row" > -->
<!-- 											<div class="col-7"> -->
<!-- 												<h4 class="appl4 card-title text-dark">추가 가능 유저</h4> -->
<%-- 												<h1 class="apple7 card-text" style="text-align: center;">${numMap['availableNum']} 명</h1> --%>
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div>							 -->
<!-- 							<div class="card-title">
<!-- 								<h1 class="apple4 page-title text-dark text-center mb-3 mt-5 headerTitle" -->
<!-- 								style="font-size: 20px; letter-spacing: 2px; font-weight: bold;">유저 관리</h1> -->
<!-- 							</div> --> 
<!-- 							------------실험------------------------------- -->
 							<ul class="apple3 nav nav-tabs mb-3" onclick="clickCheck()" style="font-size:19px;"> 
 								<li class="nav-item"> 
 									<a href="#home" id="firstTab" data-toggle="tab" aria-expanded="true" class="nav-link" > 
 										<i class="mdi mdi-home-variant d-md-none d-block"></i> 
 										<span class="apple3 d-none d-md-block text-dark">사용중 유저</span> 
 									</a> 
 								</li> 
 								<li class="nav-item">
 									<a href="#profile" id="secondTab" data-toggle="tab" aria-expanded="true" class="nav-link active"> 
 										<i class="mdi mdi-account-circle d-md-none d-block"></i> 
 										<span class="apple3 d-none d-md-block text-dark">부서 미배정 유저</span> 
 									</a> 
 								</li> 
<!--  								<li class="nav-item">  -->
<!--  									<a href="#settings" id="thirdTab" data-toggle="tab" aria-expanded="false" class="nav-link">  -->
<!--  										<i class="mdi mdi-settings-outline d-md-none d-block"></i>  -->
<!--  										<span class="apple3 d-none d-md-block text-dark">사용중지 유저</span>  -->
<!--  									</a>  -->
<!--  								</li>  -->
<!--  								<li class="nav-item"> -->
<!--  									<a href="#aaa" id="fourthTab" data-toggle="tab" aria-expanded="false" class="nav-link">  -->
<!--  										<i class="mdi mdi-settings-outline d-md-none d-block"></i>  -->
<!--  										<span class="apple3 d-none d-md-block">사용중지 유저</span>  -->
<!--  									</a>  -->
<!--  								</li>   -->
 							</ul> 
							<!--------------------------- 전체 인원 테이블------------------------------------------ -->
							<div class="tab-content">
							
								<div class="tab-pane" id="home">
									<!-- <input type="checkbox" id="checkBox1" name="chk1" onclick="selectAll1(this)" style="float: left;">
                                	<label style="float: left;">전체선택</label> -->
									<!-- 파일 내보내기(HTML TABLE) : <input type="button" id="excelFileExport" value="엑셀 파일 다운로드(TABLE)" /> -->
									<button type="button" class="apple5 btn btn-light mb-1" style="float: right; color:white; background-color:#5F7CBB;" onclick="deleteBtn()">사용중지</button>
									<button type="button" class="btn btn-light mb-2 mr-1"  id="excelFileExport" style="float: right; color:white; background-color:#5F7CBB;">엑셀 출력</button>
									<!-- <table id="scroll-vertical-datatable" class="apple3 table dt-responsive nowrap"> -->
									<table id="scroll-horizontal-datatable" class="ml-4 apple3 table w-100 nowrap text-dark">
									<!-- <table id="allMemberTbl" class="apple3 table table-hover table-centered mb-0"> -->
										<thead>
											<tr class="w-100" style="font-size:19px;">
												<th id="fff">
													<input type="checkbox" class="mt-2" id="checkBox1" name="chk1" onclick="selectAll1(this)">
												</th>
												<th class="tdAlign">회원권한</th>
												<th class="tdAlign">사번</th>
												<th class="tdAlign">이름</th>
												<th class="tdAlign" >직급</th>
												<th class="tdAlign">부서명</th>
												<th class="tdAlign">아이디</th>
												<th class="tdAlign">비밀번호</th>
												<th class="tdAlign">2차 비밀번호</th>
												<th class="tdAlign">이메일</th>
												<th class="tdAlign">입사일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${memAllList }" var="map">
												<tr style="font-size:17px;">
													<td>
														<input type="checkbox" name="chk1" value="${map['MEMID']}" />
													</td>
													<td class="tdAlign">${map['MEMAUTH'] }</td>
													<td class="tdAlign">${map['MEMDEPTID'] }</td>
													<td class="tdAlign">${map['MEMNAME']}</td>
													<td class="tdAlign">${map['MEMJOBGRADE']}</td>
													<td class="tdAlign">${map['DEPTNAME']}</td>
													<td class="tdAlign">${map['MEMID']}</td>
													<td class="tdAlign">${map['MEMPASS']}</td>
													<td class="tdAlign">${map['MEMSECPASS']}</td>
													<td class="tdAlign">${map['MEMEMAIL']}</td>
													<td class="tdAlign">${map['MEMWORKSTARTDAY']}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								
								</div>
								<!--------------------------- 전체 인원 테이블 끝------------------------------------------ -->
								<!--------------------------- 부서 미배정 완료 테이블 ------------------------------------------ -->
								<div class="tab-pane show active" id="profile">
									<button class="apple3 ml-3 mr-1 pl-3 pr-3 workfitBtn" style="z-index:999; padding-top: 9px; padding-bottom:9px;font-size:17px;position:absolute;"onclick="location.href='/workfit/document/get/md000'">양식 다운</button>
									<button type="button" class="apple3 btn btn-light mb-2" onclick="importBtn()" style="padding-top: 9px; padding-bottom:9px; margin-left:150px; color:white; background-color:#5F7CBB; font-size:17px;">엑셀 업로드</button>
									<input type="file" id="excelFile" onchange="excelExport(event)" style="display: none;">
									<button type="button" class="apple3 btn btn-light" style=" padding-top: 9px; padding-bottom:9px; float: right; color:white; background-color:#5F7CBB; font-size:17px;" onclick="memUpdateBtn()">등록</button>
									<table class="apple3 table table-hover table-centered mb-0 text-dark ml-4">
										<thead>
											<tr style="font-size:19px;">
												<th>
													<input type="checkbox" class="mt-2" id="checkBox2" name="chk2" onclick="selectAll2(this)">
												</th>
												<th>사번</th>
												<th>이름</th>
												<th>직급</th>
												<th>연락처</th>
												<th>이메일</th>
												<th>입사일</th>
												<th>부서 배정</th>
												<th>회원권한 부여</th>
											</tr>
										</thead>
										<tbody id="userPlusTbody" style="font-size:17px;">
										</tbody>
									</table>
								</div>
								<!--------------------------- 부서 미배정 완료 테이블 끝------------------------------------------ -->
								<!--------------------------- 사용중지 테이블------------------------------------------ -->
								<div class="tab-pane justify-content-center" id="settings">
									<!-- <input type="checkbox" id="checkBox4" name="chk" onclick="selectAll4(this)" style="float: left;">
                                	<label style="float: left;">전체선택</label> -->
									<button type="button" style="font-size:17px;" class="btn btn-light" style="float: right;" onclick="deleteBtn()">삭제</button>
<!-- 									<table class="apple3 table table-hover table-centered mb-0 text-dark"> -->
									<table id="scroll-vertical-datatable" class="apple3 table dt-responsive nowrap text-dark table-centered text-center">
										<thead>
											<tr id="ddd" style="font-size:19px;">
												<th>
													선택 <input type="checkbox" class="mt-2" id="checkBox3" name="chk3" onclick="selectAll3(this)">
												</th>
												<th>사번</th>
												<th>이름</th>
												<th>직급</th>
												<th>아이디</th>
												<th>사용중지 일자</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${memStopList }" var="map">
												<tr style="font-size:17px;">
													<td>${map['MEMDEPTID'] }</td>
													<td>${map['MEMNAME'] }</td>
													<td>${map['MEMJOBGRADE'] }</td>
													<td>${map['MEMID'] }</td>
													<td>${map['DECEASEDATE'] }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!--------------------------- 사용중지	 테이블 끝------------------------------------------ -->
								<!--------------------------- 사용 중지 사용자 테이블 ------------------------------------------ -->
								<%-- <div class="tab-pane" id="aaa">
									<input type="checkbox" id="checkBox2" name="chk2" onclick="selectAll2(this)" style="float: left;">
                                	<label style="float: left;">전체선택</label> -->
									<button type="button" class="btn btn-light" style="float: right;" onclick="deleteBtn()">삭제</button>
									<table class="apple3 table table-hover table-centered mb-0">
										<thead>
											<tr>
												<th>
													선택 <input type="checkbox" class="mt-2" id="checkBox2" name="chk2" onclick="selectAll1(this)">
												</th>
												<th>회원권한</th>
												<th>사번</th>
												<th>이름</th>
												<th>직급</th>
												<th>부서명</th>
												<th>아이디</th>
												<th>비밀번호</th>
												<th>2차 비밀번호</th>
												<th>이메일</th>
												<th>입사일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${memListInDept }" var="map">
												<tr>
													<td>
														<input type="checkbox" name="chk2" value="${map['MEMID']}" />
													</td>
													<td>${map['MEMAUTH'] }</td>
													<td>${map['MEMDEPTID'] }</td>
													<td>${map['MEMNAME']}</td>
													<td>${map['MEMJOBGRADE']}</td>
													<td>${map['DEPTNAME']}</td>
													<td>${map['MEMID']}</td>
													<td>${map['MEMPASS']}</td>
													<td>${map['MEMSECPASS']}</td>
													<td>${map['MEMEMAIL']}</td>
													<td>${map['MEMWORKSTARTDAY']}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div> --%>
							<!--------------------------- 사용 중지 사용자 테이블 끝------------------------------------------ -->
							</div>
							<!--------------------실험------------------------------>
						</div>
						<!-- end of content-header -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!------------------------------- 모달-------------------------------------------------------------------->	
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="apple3 modal-title" id="staticBackdropLabel">사용 중지 요청</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> <!-- end modal header -->
            <div class="modal-body" id="delModalDiv">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeDelModal()">취소</button>
                <button id="submitBtn" data-value="" type="button" class="btn btn-primary" onclick="submitData(this)">확인</button>
            </div> <!-- end modal footer -->
        </div> <!-- end modal content-->
    </div> <!-- end modal dialog-->
</div> <!-- end modal-->

<!------------------------------- 모달-------------------------------------------------------------------->	

<script>
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
	//공통
	// 참고 출처 : https://redstapler.co/sheetjs-tutorial-create-xlsx/
	function s2ab(s) { 
		var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
		var view = new Uint8Array(buf);  //create uint8array as viewer
		for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
		return buf;    
	}
	function exportExcel(pdata){ 
		// step 1. workbook 생성
		var wb = XLSX.utils.book_new();
	
		// step 2. 시트 만들기 
		var newWorksheet = excelHandler.getWorksheet(pdata);
		
		// step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
		XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());
	
		// step 4. 엑셀 파일 만들기 
		var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
	
		// step 5. 엑셀 파일 내보내기 
		saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
	}

	$(document).ready(function() { 
		let pdata = [];
		$("#excelFileExport").click(function(){
			let data = "a";
			let xhr = new XMLHttpRequest();
			xhr.open("POST", '/workfit/admin/export/', true);
			xhr.setRequestHeader(header, token);
			xhr.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
			xhr.send(data);
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let rslt = xhr.responseText
					console.log("rslt:",rslt);
					console.log("rslt 파싱:", JSON.parse(rslt));
					pdata = JSON.parse(rslt);
					console.log("pdata:", pdata);
					exportExcel(pdata);

				}
			}
		});
	});
</script>
<script>
	var excelHandler = {

			getExcelFileName : function(){
				return '사용유저 목록.xlsx';
			},
			getSheetName : function(){
				return 'Table Test Sheet';
			},
			getExcelData : function(pdata){
				return pdata;
			},
			getWorksheet : function(pdata){
				// return XLSX.utils.table_to_sheet(this.getExcelData());
				return XLSX.utils.json_to_sheet(this.getExcelData(pdata));
			}
	}
</script>


<script>


	var firstTab = document.getElementById("firstTab"); 
	
	firstTab.addEventListener("click",clickTh);
	function clickTh(){
		console.log("리사이즈 중입니다.");	
		var lang_kor = {
			"search" : "검색 : ",
			"paginate" : {
                  "first" : "첫 페이지",
                  "last" : "마지막 페이지",
                  "next" : "<i class='dripicons-chevron-right'></i>",
                  "previous" : "<i class='dripicons-chevron-left'></i>"
              },

		};
		$('#scroll-horizontal-datatable').DataTable({
			destroy: true,
			searchPanes: {
            viewTotal: true
        	},
			info : false,
			lengthChange : false,
			language : lang_kor
			
		});

		$('.dataTables_paginate').addClass('pagination-rounded');
	}
	


	//--------------------데이터 테이블 조작해보기 ---------------------
	function dataTblfuck(){
		console.log("dataTblfuck 작동은해?");
		let firstTab = document.querySelector('#firstTab');
		let tbl = document.querySelector('#ddd');
		if(firstTab.classList.contains('active')){
			console.log("클릭했습니다요");	
			tbl.click();
		}
		// tbl.click();
	}
	
	//--------------------------데이터 테이블 조작해보기 ---------------------------

	//-------전역변수-----------------------------------------------------------
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
	let checkArr = []; //체크된 박스만 넣을 배열	==> 삭제 기능에 전송할 데이터
	let realDataArr = []; // 부서 배정 및 권한 입력할 멤버 데이터 ==> 
	let deleteArr = []; //삭제할 목록
	//-------전역변수-----------------------------------------------------------

	//------------엑셀 임포트-------------------------------------------------------------

	// 카드 클릭시
	function moveFirstTab(){
		firstTab.click();
	}
	
	// 카드 클릭시
	function moveSecondTab(){
		let secondTab = document.querySelector('#secondTab');
		secondTab.click();
	}


	//임포트 버튼 작동
	function importBtn(){
        let excelFile = document.querySelector('#excelFile');
        excelFile.click();
    }

	//실제 임포트 과정
    function excelExport(event) {
        console.log("event:", event);
        console.log("event.target:", event.target);
        let input = event.target;
        let reader = new FileReader();
        reader.onload = function () {
            let fileData = reader.result;
            let wb = XLSX.read(fileData, { type: 'binary' });
            wb.SheetNames.forEach(function (sheetName) {
                var rowObj = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
                console.log("rowObj:", rowObj);
                importData = rowObj;
                console.log("importData:", importData);

                makeTable(importData);

				// //테이블 그리기
                // let d_table = $('#basic-datatable').DataTable({
                //     "columnDefs": [{
                //         "defaultContent": "-",
                //         "targets": "_all"
                //     }],
                //     select : {
                //         info:false
                //     },
                //     data : rowObj,
                //     destroy: true,
                //     columns: [
                //         { data: 'index'},
                //         { data: 'memDeptId' },
                //         { data: 'memName' },
                //         { data: 'memJobGrade' },
                //         { data: 'memTel' },
                //         { data: 'memEmail' },
                //         { data: 'memBirth' }
                //     ]
                // });
            })
        };
        reader.readAsBinaryString(input.files[0]);

    }

	 //테이블 채우기
	function makeTable(data){
		let tbodyTag = document.querySelector("#userPlusTbody");
		while (tbodyTag.hasChildNodes()){
			tbodyTag.removeChild( tbodyTag.firstChild );       
		}
		console.log("data[0]:",data[0]);
		
		for(i of data){
			let date =  dayjs(i.memWorkStartDay).format("YYYY.MM.DD");
			let trTag = document.createElement("tr");
			let tdTag_1 = document.createElement("td");
			let tdTag_2 = document.createElement("td");
			let tdTag_3 = document.createElement("td");
			let tdTag_4 = document.createElement("td");
			let tdTag_5 = document.createElement("td");
			let tdTag_6 = document.createElement("td");
			let tdTag_7 = document.createElement("td");
			let tdTag_8 = document.createElement("td");
			let tdTag_9 = document.createElement("td");
			let tdTag_10 = document.createElement("td");
			
			tdTag_1.innerHTML = `<input type="checkbox" name="chk2" value="\${i.index}" />`
			tdTag_2.innerText = i.memDeptId;
			tdTag_3.innerText = i.memName;
			tdTag_4.innerText = i.memJobGrade;
			tdTag_5.innerText = i.memTel;
			tdTag_6.innerText = i.memEmail;
			// tdTag_7.innerHTML = i.memWorkStartDay;
			tdTag_7.innerHTML = date;
			tdTag_8.innerHTML = `<select id="deptSelected" onChange="getselect()">
									<option value="none" disabled>=====부서 선택======</option>
									<c:forEach items="${deptList }" var="dept">	
										<c:choose>
											<c:when test="${dept.deptName eq '미배정' }">
												<option value="${dept.deptCode }" hidden>${dept.deptName }</option>
											</c:when>
											<c:otherwise>
												<option value="${dept.deptCode }">${dept.deptName }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>`
			tdTag_9.innerHTML = `<select id="authSelected" onChange="getselect()">
									<option value="none" disabled>====권한 선택====</option>
									<option value="ROLE_LV1">LV1</option>
									<option value="ROLE_LV2">LV2</option>
									<option value="ROLE_LV3">LV3</option>
								</select>`																	
								

			trTag.append(tdTag_1);
			trTag.append(tdTag_2);
			trTag.append(tdTag_3);
			trTag.append(tdTag_4);
			trTag.append(tdTag_5);
			trTag.append(tdTag_6);
			trTag.append(tdTag_7);
			trTag.append(tdTag_8);
			trTag.append(tdTag_9);
			tbodyTag.append(trTag);
		}

    }
	
	
	//------------엑셀 임포트------------------------------------------------------------------------------------
	
	// 부서/권한 데이터 controller submmit
	function submitData(pthis){
		console.log("realDataArr:", realDataArr);
		let methodStatus = pthis.dataset.value;
		let xhr = new XMLHttpRequest();
		xhr.open('POST','/workfit/admin/controllUser/' + methodStatus ,true);
		xhr.setRequestHeader(header, token);
		xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
		xhr.send(JSON.stringify(realDataArr));
		xhr.onreadystatechange = function(){
			if(xhr.status == 200 && xhr.readyState == 4 ){
				let rslt = xhr.responseText;
				console.log("controller 반환 데이터:", rslt);
				if(rslt == 2){
					$("#staticBackdrop").modal("hide");
					moveFirstTab();
					toastr.success( '<h4 style="font-size:17px;" class="apple4">승인완료</h4>');
					setTimeout(() => window.location.reload(), 900);
				}
				// window.location.reload();
			}else{
				console.log("전송 실패")
			}
		}
	}

	//부서 배정 전송 버튼 작동
	function memUpdateBtn(){
		let arr = [];//치환용 배열
		let check = document.querySelectorAll("input[type='checkbox']");
		arr = Array.from(check);

		console.log("체크된것 확인:" , arr);

		checkArr.splice(0,checkArr.length);
		realDataArr.splice(0,realDataArr.length);


		for(i of arr){
			if(i.checked == true && i.value !="on" ){
				console.log("i의 value:",i.value);
				checkArr.push(i);
			}
		}

		console.log("checkArr:",checkArr);
		console.log("추가가능 인원 체크:",${numMap['availableNum']});	

		//추가 가능 인원보다 많은 인원 선택시
		if(checkArr.length > ${numMap['availableNum']} * 1){
			console.log("추가 인원 초과");
			toastr.error('<h4 style="font-size:17px;" class="apple4">추가 가능 유저 초과</h4>');
			return;
		}



		for(i of checkArr){
			// let obj = {};
			console.log("chekcArr의 value:", i.value);
			// console.log("i.parentNode:",i.parentNode.parentNode);
			console.log("i.parentNode:",i.closest("tr"));
			console.log("i.parentNode:",i.closest("tr").querySelectorAll("select"));
			let selectArr = i.closest("tr").querySelectorAll("select")
			let deptVal = selectArr[0].options[selectArr[0].selectedIndex].value;
			let authVal = selectArr[1].options[selectArr[1].selectedIndex].value;

			console.log("deptVal:",deptVal);
			console.log("authVal:",authVal);

			console.log("현수야 집중 importData 들어간다:", importData);
			importData[i.value-1].dept = deptVal;
			importData[i.value-1].auth = authVal;

			console.log("importData[i.value-1]:",importData[i.value-1]);


			// obj.memId = i.value;
			// obj.dept = deptVal;
			// obj.auth = authVal;

			realDataArr.push(importData[i.value-1]);
		}
		
		console.log("realDataArr:",realDataArr);

		let modalTitle = document.querySelector("#staticBackdropLabel");
		modalTitle.innerText = "부서 배정 및 권한 부여"
		let delModalDiv = document.querySelector("#delModalDiv");
		delModalDiv.innerHTML = `<p>사용자 \${checkArr.length}명을 추가하시겠습니까?</p>`;
		let submitBtn = document.querySelector('#submitBtn');
		submitBtn.dataset.value = "insert";
		$("#staticBackdrop").modal("show");
	}

	//selectbox change 이벤트
	function getselect() {
		var select = document.getElementById('deptSelected');
		var option = select.options[select.selectedIndex];

		document.getElementById('value').value = option.value;
		document.getElementById('text').value = option.text;
	}

	//모달 닫을때 데이터 지워주기
	function closeDelModal(){
		while(checkArr.length > 0) {checkArr.pop();}	// 체크된 것 배열에서 지우기
		while(realDataArr.length > 0) {realDataArr.pop();}	// 체크된 것 배열에서 지우기
		while(deleteArr.length > 0) {deleteArr.pop();}	// 체크된 것 배열에서 지우기
	}

	//삭제버튼 실행
	function deleteBtn(){
		let arr = [];//치환용 배열
		let check = document.querySelectorAll("input[type='checkbox']");
		arr = Array.from(check);
		console.log("체크된것 확인:" , arr);

		checkArr.splice(0, checkArr.length);
		realDataArr.splice(0, realDataArr.length);
		
		console.log("checkArr.length", checkArr.length);		
		console.log("realDataArr:", realDataArr);


		for(i of arr){
			if(i.checked == true && i.value !="on" ){
				console.log("아이의 value:",i.value);
				checkArr.push(i);
			}
		}

		console.log("checkArr:",checkArr);
		for(i of checkArr){
			console.log("chekcArr의 value:", i);
			console.log("chekcArr의 value:", i.value);
			let obj ={};
			obj.memId = i.value;
			realDataArr.push(obj);
		}

		let delModalDiv = document.querySelector("#delModalDiv");
		let submitBtn = document.querySelector("#submitBtn");
		delModalDiv.innerHTML = `<p>사용자 \${checkArr.length}명을 사용중지 하시겠습니까?</p>`;
		submitBtn.dataset.value = "delete";

		$("#staticBackdrop").modal("show");

	}

	//탭 눌리때마다 체크된거 풀어주기
	function clickCheck(){
		let firstTab = document.querySelector('#firstTab');
		let secondTab = document.querySelector('#secondTab');
// 		let thirdTab = document.querySelector('#thirdTab');
		let fourthTab = document.querySelector('#fourthTab');

		let checkBox1 = document.querySelectorAll("input[name='chk1']");
		let checkBox2 = document.querySelectorAll("input[name='chk2']");
// 		let checkBox3 = document.querySelectorAll("input[name='chk3']");
		let checkBox4 = document.querySelectorAll("input[name='chk4']");

		if(firstTab.classList.contains('active')){
			for(i of checkBox1){
				i.checked = false;
			}
		}
		if(secondTab.classList.contains('active')){
			for(i of checkBox2){
				i.checked = false;
			}
		}
// 		if(thirdTab.classList.contains('active')){
// 			for(i of checkBox3){
// 				i.checked = false;
// 			}
// 		}
		// if(fourthTab.classList.contains('active')){
		// 	for(i of checkBox4){
		// 		i.checked = false;
		// 	}
		// }
	}


	//전체조회 체크박스 전체 체크
	function selectAll1(pthis){
			let chk = document.querySelectorAll("input[name='chk1']");
			for(i of chk){
				i.checked = pthis.checked;
			}
		}

	//부서 배정 인원 체크박스 전체 체크
	function selectAll2(pthis){
		let chk = document.querySelectorAll("input[name='chk2']");
		for(i of chk){
			i.checked = pthis.checked;
		}
	}

	//부서미배정 인원 체크박스 전체 체크
	function selectAll3(pthis){
        let chk = document.querySelectorAll("input[name='chk3']");
        for(i of chk){
            i.checked = pthis.checked;
        }
    }





</script>	

<style>
.page-item.active .page-link{
   background-color: #5F7CBB;

}
.dataTables_filter{
   font-family: 'apple3';
}


#scroll-horizontal-datatable > tbody > tr:hover {
       background-color: #e7ecf1;
       cursor: pointer;
}

.tdAlign{
	text-align: center;
}
</style>

