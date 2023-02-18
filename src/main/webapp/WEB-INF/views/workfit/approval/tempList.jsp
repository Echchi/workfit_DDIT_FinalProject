<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!----------------------------- 리스트 테이블 ------------------------------------>
<!-- 데이터 테이블 있는 페이지 레이아웃 -->  
<div class=' row mt-2'>                                                                                                         
	<div class='col-12'>                                                                                                          
		<div class='card mr-2 workfitCardBg'>                                                                                                         
	       	<div class='card-body p-4'>
				<div class='card p-3' style="border-radius: 0.7rem;">
					<h5 class='apple4 page-title text-dark pl-3 pt-2'
						style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>임시저장함</h5>
					<hr class="ml-3 mr-3 mt-1 mb-1">
					<div class="apple4 pl-3 pr-3 text-dark pb-2"
						style="font-size: 19px;">
						<span class="badge badge-warning badge-pill">TIP</span><br>
						임시저장함은 자신이 상신 중인 문서를 잠시 보관하는 공간입니다<br>
	           			저장한 상태 그대로를 불러올 수 있으며 바로 상신이 가능합니다
					</div>

				</div>


				<div class="card p-4" style=" border-radius: 0.7rem;">
					<table id="datatable-buttons" class="apple table dt-responsive nowrap w-100 listTbl">
						<thead>
							<tr  class="apple3 text-dark text-center" style="font-size:19px;">
								<th>순번</th>
								<th>종류</th>
								<th>제목</th>
								<th>작성일</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${tempList}" var="doc" varStatus="status">
								<c:set value="${doc.approvalDocCode }" var="code" />
								<tr class="${doc.approvalDocCode } apple4 text-dark" style="font-size:17px;">
									<td class="workfitMouse apple4 text-dark text-center" onclick="showDetail(this)">${status.count }</td>
									<c:if test="${doc.approvalType eq 1 }">
									<td class="workfitMouse apple4 text-dark text-center" onclick="showDetail(this)">일반</td>
									</c:if>
									<c:if test="${doc.approvalType eq 2 }">
									<td class="workfitMouse apple4 text-dark text-center" onclick="showDetail(this)">일반</td>
									</c:if>
									<c:if test="${doc.approvalType eq 3 }">
									<td class="workfitMouse apple4 text-dark text-center" onclick="showDetail(this)">긴급</td>
									</c:if>
									<td class="workfitMouse apple4 text-dark text-center" onclick="showDetail(this)">${doc.approvalDocTitle }</td>
									<td class="workfitMouse apple4 text-dark text-center" onclick="showDetail(this)"><fmt:formatDate value="${doc.approvalDate }" pattern="YYYY.MM.dd."/> </td>
									<td class="workfitMouse apple4 text-dark text-center"><i onclick="deleteBtn(this)" class="workfitMouse mdi mdi-delete" style="font-size: 18px;"></i></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>	
       		</div>
		</div>                                                                                                               
	</div>
</div>
<!----------------------------- 리스트 테이블 끝------------------------------------>
<!---------------------- 퍼스트 모달(결재 문서 작성)------------------------------ -->
<!-- Scrollable modal -->
<div class="apple3 modal fade text-dark" id="scrollable-modal" tabindex="-1" role="dialog"
	aria-labelledby="scrollableModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-full-width second-modal" role="document">
		<div class="modal-content">
			<div class="modal-header pt-3 pb-2 pl-2">
				<h4 class="apple4 modal-title text-dark pl-2" id="scrollableModalTitle" style="font-size:31px;">결재 상신</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body p-4">

				<!-- 결재 문서 구성 -->
				<form id="submitForm" enctype="multipart/form-data">
					<!--내 정보 -->
					<input type="text" name="myName" id="myName" value="${myInfo.memName}"
						style="display: none;">
					<input type="text" name="myId" id="myId" value="${myInfo.memId}" style="display: none;">
					<input type="text" name="myGrade" id="myGrade" value="${myInfo.approvalMemGrade}"
						style="display: none;">
					<!--내 정보 -->
					<div class="row pl-2 pr-2 pt-2 mr-2 ml-2" style=" background-color:  #f9f9f9">
							<p class="apple5 text-dark pr-1" style="font-size:15px;">보존연한</p>
							<select  style="font-size:15px;height:23px;" class="mr-4">
								<option value="1">1년</option>
								<option value="3">3년</option>
								<option value="5">5년</option>
								<option value="10">10년</option>
							</select>
							
							<p class="apple5 text-dark pr-1" style="font-size:15px;">결재유형</p>
							<select  style="font-size:15px;height:23px;" class="mr-4" id="approvalType" name="approvalType">
								<option value="1">일반</option>
								<option value="2">전결</option>
								<option value="3">긴급</option>
							</select>
							
							<p class="apple5 text-dark pr-1" style="font-size:15px;">공개범위</p>
							<select  style="font-size:15px;height:23px;" class="mr-4" id="approvalScope" name="approvalScope">
								<option value="1">팀</option>
								<option value="2">부서</option>
								<option value="3">회사</option>
							</select>
					</div>
					<div class="p-2">
						<label for="docCode" class="apple3 text-dark"style="font-size:21px;">문서번호</label>
						<input class="apple3 text-dark p-1" style="font-size:19px;width: 100%;" type="text" id="docCode" name="docCode" value="자동입력" disabled> 
						<br><br>
						<label class="apple3 text-dark" for="docTitle" style="font-size:21px;">문서제목</label>
						<input class="form-control" type="text" id="docTitle" class="p-1" name="docTitle" value="양식제목" style="width: 100%; font-size:17px;">
						
						<input type="text" class="mb-1 mt-2" id="approvalTemplateCode" name="approvalTemplateCode" value=""
							style="display: none;">
	
						<!-- 에디터 -->
						<div class="form-group pt-1">
							<textarea id="reportForm" name="reportForm" class="form-control" rows="14" style="width:100%;">
							</textarea>
						</div>
						<!-- 에디터 -->
	
						<!-- 파일업로드 -->
	
						<div class="filebox">
							<input class="upload-name" value="첨부파일" placeholder="첨부파일">
							<label for="attachFile" class="mt-1">파일찾기</label> 
							<input type="file" id="attachFile" multiple name="attachFile">
						</div>
	
						<!-- <input type="file" multiple name="attachFile" id="attachFile" value="">-->
						<div class="row" id="attachDiv"></div> 
					<!-- 파일 업로드 끝 -->

					</div>
					<!-- 결재선 지정 -->


					<div>
						<h5 class="apple3 mt-2 ml-1 text-dark" style="font-size:21px;">결재라인</h5>
						<table class="table mb-0 apple3 text-dark text-center">
							<thead>
								<tr style="font-size:19px;">
									<th scope="col">순서</th>
									<th scope="col">타입</th>
									<th scope="col">직급</th>
									<th scope="col">이름</th>
								</tr>
							</thead>
							<tbody id="approver">
								<tr style="font-size:17px;">
									<td colspan="4" id="approvalBtn" readonly data-toggle="modal" class=" text-center text-dark workfitMouse"
										data-target="#full-width-modal-lg-third" data-dismiss="modal">
										<p style="font-size:19px;" class="apple4 m-2">결재자 선택</p>
									</td>
								</tr>
							</tbody>

						</table>
						<hr/>
						<div readonly data-toggle="modal" data-target="#full-width-modal-lg-third" class="workfitMouse ml-1"	data-dismiss="modal" class="pt-3 ml-1 apple3 text-dark">
							<div  style="border-bottom:1px solid #f0f3f8; border-top:1px solid #f0f3f8" class="mb-2 pt-2 pb-2">
								<h4 class="apple3 text-dark ml-2" style="font-size:21px;">참조</h4>
							</div>
							<div id="reference">
								<div id="referBtn" readonly data-toggle="modal"
									data-target="#full-width-modal-lg-third" data-dismiss="modal" class="workfitMouse text-dark text-center apple3">
									<p style="font-size:19px;" class="apple4 m-2 mt-3">참조자 선택</p>
								</div>
								<!-- <input type="text" id="referBtn" value="참조자가 없습니다." readonly data-toggle="modal" data-target="#full-width-modal-lg-third" data-dismiss="modal"> -->
							</div>
						</div>
					</div>


					<!-- 결재선 지정 끝-->

					<div class="modal-footer mt-5">
						<input type="button" value="상신" class="apple4 btn " style ="font-size:19px; color:white; background-color:#5F7CBB;" data-toggle="modal" data-target="#reqAppDetailModalComment" data-dismiss="modal">
						<input type="button" value="닫기" class="apple4 btn btn-light" style="font-size:19px;" data-dismiss="modal">
					</div>
					<sec:csrfInput />
				</form>
			</div>
			<!-- 결재 문서 구성 -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!---------------------- 퍼스트 모달(결재 문서 작성)끝------------------------------ -->
<!---------------------- 쎄컨드 모달(결재선 지정)------------------------------ -->

<!-- Full width modal -->
<div id="full-width-modal-lg-third" class="apple3 modal fade" tabindex="-1"
	role="dialog" aria-labelledby="fullWidthModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-full-width second-modal">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-dark" id="fullWidthModalLabel" style="font-size:31px;">결재선 지정</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<div class="row pr-3 pl-3 justify-content-center">
					<!--  조직도 트리 적용 -->
					<!-- 사원 검색하는 태그 시작 -->
					<div class="col-4 m-1" style="border: 2px solid #f0f3f8; border-radius:8px;  height: 600px; overflow : auto;">
						<div class="form-group  ml-3 mt-4 ">
							<div class="input-group">
								<input id="byhMemSearchInput" type="text" class="form-control col-8" placeholder="사원명 입력">
								<div class="input-group-append">
									<button id="byhTreeSearch" class="btn btn-dark" type="button" onclick="fn_byhSearchTree()">검색</button>
								</div>
							</div>
							<!-- 사원 검색하는 태그 끝 -->
						</div>
						<!-- 조직도가 시작되는 UL태그 시작 -->
						<ul style="margin: 14px"id="codeList" class="filetree treeview workfitMouse"></ul> 
						<!-- 조직도가 시작되는 UL태그 끝 -->
					</div>
					<!--  조직도 트리 적용 끝-->
					<!--  가운데 -->
					<div class="col-1 ml-3 mr-5 align-self-center">
						<!-- 사이버튼 부분 -->
						<div  class="align-self-center"> 
							<div class=" mt-1 ">
								<button type="button" class="workfitMouse btn btn-outline-primary" onclick="addAppLine(this)">결재&gt;</button>				
							</div>
							<div class=" mt-1 ">
								<button type="button" class="workfitMouse btn btn-outline-primary" onclick="addAppLine(this)">합의&gt;</button>				
							</div>
							<div class=" mt-1 ">
								<button type="button" class="workfitMouse btn btn-outline-primary" onclick="addReferenceLine()">참조&gt;</button>				
							</div>
						</div>
						<!-- 사이버튼 부분 끝-->
					</div>
					<!--  가운데 끝 -->
					<!--  오른쪽 -->
					<div class="col-4" style="border: 2px solid #f0f3f8;  border-radius:8px; height: 600px;">
						<div class="row" style="height: 400px;">
							<table id="appLineTable" class="table  table-centered mb-0 text-dark apple3" style="height: 130px;  width: 100%;">
								<thead class="text-center" style="font-size:17px;">
									<tr>
										<th>순서</th>
										<th>타입</th>
										<th>직급</th>
										<th>결재자</th>
										<th class="text-center">삭제</th>
									</tr>
								</thead>	
								<tbody id="appLineBody"  class="text-dark text-center" style="font-size:17px;">
									<tr>
										<td colspan="5" id="appLineChk"><p class="text-dark apple4 text-center m-2" style="font-size:19px;">결재자가 없습니다</p></td>
									</tr>
								</tbody>						
							</table>
						</div>
						<div id="referDiv" class="ml-2 text-dark">
							<div class="row  apple6 pt-2 pb-2" id="referDivMark1" style="font-size: 20px; border-top:1px solid #f0f3f8"">참조</div>
							<div class="row justify-content-center" id="referDivMark2"><p class="text-dark apple4 text-center m-2" style="font-size:19px;">참조자가 없습니다</p></div>
						</div>
					</div>
				</div>
				<!-- 결재선 검색  부분 끝-->
				<!-- 결재선 표시 부분  -->

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-toggle="modal" style="background-color:#5F7CBB" data-target="#scrollable-modal" data-dismiss="modal" onclick="insertPerson()">확인</button>
				<button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!---------------------------------------------- 쎄컨드 모달(결재선 지정)끝------------------------------------------------------------>

<!----------------------써드 모달(결재 의견 작성 및 제출)----------------------------------------------------->

<div id="standard-modal" class="apple3 modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog fourth-modal">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">결재 의견 작성</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <textarea rows="10" cols="20" title="결재의견" id="appComment212" name="appComment212">


				</textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-toggle="modal" data-target="#scrollable-modal" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitReport()">확인</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" style="z-index: 2000;" id="reqAppDetailModalComment" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" >
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h4 class="modal-title apple3" id="myCenterModalLabel">결재 의견 작성</h4>
                <button id="ModalCloseBtn2" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
			<div class="modal-body">
				<textarea class="form-control apple3" id="appComment" name="appComment" rows="5" style="resize:none;" placeholder="의견을 등록해주세요(선택사항)"></textarea>
			</div>
			<div class='modal-footer'> 
				<button type="button" id="finalAppBtn" style="background-color:#5F7CBB" onclick="submitReport()" class="btn btn-primary apple4">상신</button>
				<button type="button" class="btn btn-light apple4"  data-dismiss="modal">닫기</button>
           	</div>
		</div>
    </div>
</div>

<!----------------------써드 모달(결재 의견 작성 및 제출)끝----------------------------------->
<!--------------------------------------------------삭제 모달------------------------------------------------------------------------->
<!-- Top modal -->
<div id="top-modal" class="apple3 modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="topModalLabel"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body" id="deleteMent">
				해당 문서 삭제
            </div>
            <div class="modal-footer">
				<button type="button" style="display: none;" id="idSave"></button>
				<button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="deleteTempDoc(this)">확인</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--------------------------------------------------삭제 모달 끝 -------------------------------------------------------------------->


<script>

	$(function(){
		$.fn.dataTable.ext.errMode = 'none';
		var lang_kor = {
			"search" : "검색 : ",
			"paginate" : {
                  "first" : "첫 페이지",
                  "last" : "마지막 페이지",
                  "next" : "<i class='dripicons-chevron-right'></i>",
                  "previous" : "<i class='dripicons-chevron-left'></i>"
              },
		};
		
		console.log("dt있는지?:", $.fn.dataTable.isDataTable('#datatable-buttons'));
		
		$('#datatable-buttons').DataTable({
			destroy : false,
			info : false,
			lengthChange : false,
			language : lang_kor
		});
		$('.dataTables_paginate').addClass('pagination-rounded');
		
	});	



	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
	
	//퍼스트 모달 폼안의 요소들 선언
	var approvalType = document.querySelector('#approvalType');
	var approvalScope = document.querySelector('#approvalScope');
	var docTitle = document.querySelector('#docTitle');
	var reference = document.querySelector('#reference');
	var inputDocCode = document.querySelector('#docCode');
	//퍼스트 모달 안의 결재선에 들어가는 티바디
	var approver = document.querySelector('#approver');
	//퍼스트 모달 안의 첨부파일 라인
	var attachDiv = document.querySelector("#attachDiv");

	//세컨드 모달 안의 결재선 들어가는 티바디
    var appLineBody = document.querySelector("#appLineBody");
	//세컨드 모달 안의 참조라인 디브
	var referDiv = document.querySelector("#referDiv");
	//세컨드 모달 참조라인 디브 1
	var referDivMark1 = document.querySelector("#referDivMark1");

	//임시저장 첨부 파일 그대로 갈것
	var attachList = [];
	//첨부파일 삭제시 디비에서 지워줄 목록 저장 배열
	var delAttachList = [];

	//에디터 불러오기
	window.onload = function () {
		CKEDITOR.replace('reportForm');
	}

	
	$("#attachFile").on('change',function(){
		console.log("작동하니?");
		var fileName = []
		fileName = document.querySelector("#attachFile").files;
		console.log("파일네임:",fileName);
		let realFile = fileName[0].name;
		console.log("realFile:",realFile);

		let spanTag = document.createElement("span");
		let hTag = document.createElement("h5");
		let divTag = document.createElement("div");
		
		hTag.className = 'apple';
		hTag.innerHTML ="첨부파일";
		divTag.className = 'col-12';
		divTag.id = 'attachFileDiv';
		spanTag.innerHTML = `\${realFile}  <i class="mdi mdi-delete" onclick="deleteAttach(this)"></i>`;

		divTag.append(spanTag);
		// attachDiv.append(hTag);
		attachDiv.append(divTag);
		
	});
	
	// 삭제 함수
	function deleteTempDoc(pthis){
		let delCode = pthis.parentElement.children[0].getAttribute("class");
		console.log("삭제 시작해보자 delCode:", delCode);

		let xhr = new XMLHttpRequest();
		xhr.open('POST','/workfit/approval/delTempDoc',true);
		xhr.setRequestHeader(header, token);
		xhr.setRequestHeader('Content-Type','text/plain; charset=utf-8');
		xhr.send(delCode);
		xhr.onreadystatechange = function () {
			if (xhr.status == 200 && xhr.readyState == 4) {

				var rslt = xhr.responseText;
				$("#top-modal").modal("hide"); 
				toastr.success( '<h4 style="font-size:17px;" class="apple4">삭제 성공</h4>');
				setTimeout(() => window.location.reload(), 1500);

			}
		}

		//delCode 가지고 아작스로 삭제 하면됨 
		// 난중에 만들도록
	}

	//리스트에서 삭제 모달 띄우는 함수
	function deleteBtn(pthis) {
		let topModalLabel = document.querySelector('#topModalLabel');	//	삭제 모달 안의 제목 h4 태그
		let deleteMent = document.querySelector('#deleteMent');	// 삭제 모달 안의 내용
		let idSave = document.querySelector('#idSave');	//삭제 모달안에 문서 코드 숨길 버튼 

		let docCode = pthis.parentElement.parentElement.getAttribute("class").substring(0, pthis.parentElement.parentElement.getAttribute('class').lastIndexOf(" "));
		let dTtile = pthis.parentElement.parentElement.children[2].innerText;

		topModalLabel.innerText = `임시저장된 \${dTtile} 문서를 삭제하시겠습니까?`;
		deleteMent.innerText = dTtile + " 문서 삭제";
		idSave.className = docCode;
		$("#top-modal").modal("show");

	}


//-------------------------reportList에서 이식한 함수들---------------------------------------------
	//결재 상신 최종 처리 fucntion
	function submitReport(){
		let formData = new FormData(submitForm);
		let approvalContent = CKEDITOR.instances.reportForm.getData();
		let appComment = document.querySelector("#appComment");
		formData.append("approvalContent", JSON.stringify(approvalContent));//ck에디터 내용 추가


		//approvalDoc 테이블 데이터 생성
		var approvalDocVO = {};

		approvalDocVO.approvalDocCode = inputDocCode.value;
		approvalDocVO.approvalTemplateCode = approvalTemplateCode.value;
		approvalDocVO.approvalType = document.querySelector("#approvalType").value;
		approvalDocVO.approvalDocTitle = docTitle.value;
		approvalDocVO.approvalContent = approvalContent;
		approvalDocVO.approvalScope = document.querySelector("#approvalScope").value;

		formData.append("approvalDocVO", JSON.stringify(approvalDocVO));

		//approval테이블 데이터 생성
		var approvalList1 = [];
		var myInfo = {};
		myInfo.memId = document.querySelector("#myId").value;
		myInfo.approvalFlag = '1';
		myInfo.approvalComment = appComment.value;
		myInfo.approvalMemGrade = document.querySelector("#myGrade").value;	//변경 필요
		myInfo.agreementStatus = "결재";
		myInfo.memName = document.querySelector("#myName").value;
		approvalList1.push(myInfo);

		for(let i of approver.children){
			console.log("이거 확인좀 해봐:",i);
			console.log("이거 확인좀 해봐:",i.getAttribute('class'));
			var approvalVO= {
				'memId':i.getAttribute('class'),
				'approvalFlag': i.children[0].innerText*1 +1,
				'agreementStatus': i.children[1].innerText,
				'approvalMemGrade': i.children[2].innerText,
				'memName':i.children[3].innerText
			}
			approvalList1.push(approvalVO);
		}
		formData.append("approvalList", JSON.stringify(approvalList1));
		//approval테이블 데이터 생성 끝


		//첨부파일 데이터 생성		
		let files = attachFile.files;
		for(let i = 0; i< files.length ; i++){
			console.log("파일이 들어가긴해?:", files[i]);
			formData.append("uploadFiles", files[i]);
			// 자동으로 배열로 들어가게 됨!!
		}


		//결재 참조 데이터 생성
		var referenceList1 = [];
		for(let i of reference.children){
			var referenceVO = {
				// memId : i.getAttribute('class')
				memId : i.classList[0]
			};
			referenceList1.push(referenceVO);
		}
		formData.append("referenceList", JSON.stringify(referenceList1));

		//첨부파일 유지 데이터
		formData.append("attachList",JSON.stringify(attachList));
		//첨부파일 삭제 데이터
		formData.append("delAttachList",JSON.stringify(delAttachList));


		$.ajax({
			method:"post",
			url:"/workfit/approval/uploadTemp",
			data:formData,
			cache:false,
			contentType:false,
			processData:false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(rslt){
				$("#standard-modal").modal("hide"); 
				toastr.success( '<h4 style="font-size:17px;" class="apple4">상신 성공</h4>');
				setTimeout(() => window.location.reload(), 1500);
			}
		})//ajax종료

	}	




	// 세컨드 모달 안에 결재 라인/참조라인 넣는 함수
	function insertPerson(){

		var indexText;
		var typeText;
		var rankText;
		var nameText;
		var idText;

		console.log("결재 첫번째 tr 값:  ", appLineBody.children);
		//티바디 안의 태그 일단 삭제하기
		console.log("결재 라인 개수  ", appLineBody.children.length);

		if(!document.getElementById('appLineChk')){
		// if(appLineBody.children.length > 0){
			while (approver.hasChildNodes()){
				approver.removeChild( approver.firstChild);       
			}

			for(let i of appLineBody.children){

				indexText = i.innerText.split('	',5)[0];
				typeText = i.innerText.split('	',5)[1];
				rankText = i.innerText.split('	',5)[2];
				nameText = i.innerText.split('	',5)[3];
				// idText = i.children[3].getAttribute("class").substring(3);
				idText = i.children[3].getAttribute("class")
				console.log("idText = " + idText);
				var trTag = document.createElement("tr");
				var tdTag_index = document.createElement("td");
				var tdTag_type = document.createElement("td");
				var tdTag_rank = document.createElement("td");
				var tdTag_name = document.createElement("td");

				trTag.setAttribute('readonly','readonly');
				trTag.setAttribute('data-toggle','modal');
				trTag.setAttribute('data-target','#full-width-modal-lg-third');
				trTag.setAttribute('data-dismiss','modal');
				trTag.setAttribute('class',idText + ' apple3 text-dark');	//클래스의 사원 아이디 부여
				trTag.setAttribute('style','font-size:19px;');
				
				tdTag_index.setAttribute('scope','row')
				tdTag_index.innerText = indexText;
				tdTag_type.innerText = typeText;
				tdTag_rank.innerText = rankText;
				tdTag_name.innerText = nameText;

				trTag.append(tdTag_index);
				trTag.append(tdTag_type);
				trTag.append(tdTag_rank);
				trTag.append(tdTag_name);

				approver.append(trTag);
			}
		}

		if(document.getElementById('appLineChk')){
			console.log("approver.children",approver.children);	
			
			while (approver.hasChildNodes()){
				approver.removeChild( approver.firstChild );       
			}

			let rTag = document.createElement('tr');
			let dTag = document.createElement('td');

			dTag.setAttribute('colspan','4');
			dTag.setAttribute('readonly','readonly');
			dTag.setAttribute('data-toggle','modal');
			dTag.setAttribute('data-target','#full-width-modal-lg-third');
			dTag.setAttribute('data-dismiss','modal');
			dTag.setAttribute('style','font-size:19px;');
			dTag.setAttribute('class','apple4 m-2 workfitMouse');
			dTag.innerText = "결재자가 없습니다"
			dTag.id="approvalBtn";

			rTag.append(dTag);
			approver.append(rTag);
		}
			


		console.log("referDiv.children: ", referDiv.children);
		console.log("참조자 개수", referDiv.children.length);
		if(referDiv.querySelectorAll('div').length < 2){
			while(reference.hasChildNodes()){
				reference.removeChild(reference.firstChild);       
			}
			for(let i of referDiv.children){
				var spanTag = document.createElement("span");
				spanTag.innerHTML = `<a href="javascript: void(0);" class="btn btn-sm btn-light">\${i.innerText}    </a>`;
				// i.innerText + "  ";
				console.log("span태그 class에 들어갈 id 값: " , i.getAttribute('class').substring(3));
				// spanTag.setAttribute("class", i.getAttribute('class').substring(3));	// 사원 아이디 클래스에 부여하기
				spanTag.className = `\${i.getAttribute('class').substring(3)} mr-1 mt-1`
				reference.append(spanTag);
			}
			reference.firstChild.remove();
		}else{
			while(reference.hasChildNodes()){
				reference.removeChild(reference.firstChild);       
			}
			let divTag = document.createElement("div");
			divTag.innerText = "참조자가 없습니다";
			divTag.setAttribute("readonly","readonly");
			divTag.setAttribute("data-toggle","modal");
			divTag.setAttribute("data-target","#full-width-modal-lg-third");
			divTag.setAttribute("data-dismiss","modal");
			divTag.setAttribute('style','font-size:19px;');
			divTag.setAttribute('class','apple4 m-2 text-center workfitMouse');
			divTag.id = "referBtn";
			reference.append(divTag);
		}


	}

	// 참조 라인 삭제 버튼
	function deleteReferLine(pthis){
		console.log("deleteReferLine pthis:", pthis);
		console.log("deleteReferLine pthis의 부모요소:", pthis.parentElement);
		pthis.parentElement.remove();
		let spanCnt = referDiv.children.length;
		console.log("deleteReferLine:",spanCnt);
		if(spanCnt == 1){
			let divTag = document.createElement('div');
			divTag.className = "row";
			divTag.id = "referDivMark2"
			divTag.innerText = "참조자가 없습니다";
			referDiv.append(divTag);
		}

	}


	// 결재 라인 삭제 버튼 메서드
	function deleteAppLine(pthis){
		console.log("속성을 구해보자 ", pthis.parentElement.getAttribute);
		console.log("부모요소는?:", pthis.parentElement);
		console.log("부모부모요소는?:", pthis.parentElement.parentElement);
		pthis.parentElement.parentElement.remove();
		let trCnt = appLineBody.children.length;
		console.log("첫번째 티알 구하기:", appLineBody.children[0]);
		for (let i = 0; i < trCnt; i++) {
			appLineBody.children[i].children[0].innerHTML = i+1; 
		}

		if(trCnt ==0 ){
			let trTag = document.createElement('tr');
			let tdTag = document.createElement('td');

			trTag.setAttribute("style", "height:70px;");
			tdTag.setAttribute("colspan", "5");
			tdTag.id = 'appLineChk';
			tdTag.innerText = "결재자가 없습니다";
			trTag.append(tdTag);
			appLineBody.append(trTag);

		}
	}

	//세컨드 모달 참조 라인 추가 메소드
	function addReferenceLine(){
		var referId = $(click_history[0]).parent().attr("id");
		var referName = click_history[0].innerText.split(' ',1);
		var referRank = click_history[0].innerText.split(' ',2)[1];
		var referSpanTag = document.createElement("span");
		referSpanTag.innerHTML = `<a href="javascript: void(0);" class="apple3 btn btn-sm btn-light mr-1 mt-1" style="font-size:17px;" onclick="deleteReferLine(this)">\${referRank} : \${referName}&nbsp;<i class="mdi mdi-delete mr-2"></i>`;
		// referSpanTag.innerHTML = `\${referRank} : \${referName}&nbsp;<a href="javascript: void(0);" class="action-icon" onclick="deleteReferLine(this)"><i class="mdi mdi-delete"></i>&nbsp;&nbsp;&nbsp;`;
		referSpanTag.setAttribute("class", referId);
		if(document.getElementById("referDivMark2")){
			console.log('referDiv.children2:' , referDiv.children[0]);
			console.log('referDiv.children1:' , referDiv.children[1]);
			let del = document.querySelector('#'+referDiv.children[0].id);	
			console.log("del:", del);
			referDiv.children[1].remove();
			// del.remove();
		}	

		referDivMark1.after(referSpanTag);
	}

	//세컨드 모달 결재라인 추가
	function addAppLine(pthis){
		
		//영호 조직도에서 가져온 값
		var appId = $(click_history[0]).parent().attr("id");
		var name = click_history[0].innerText.split(' ',1);
		var rank = click_history[0].innerText.split(' ',2)[1];
		console.log("아이디 확인:", appId);
		console.log("이름 확인:", name);
		console.log("직급확인:", rank);
	// 		console.log("클릭이벤트 확인 li의 텍스트 확인 :", $(click_history[0]).parent().text());
		
		if(document.getElementById('appLineChk')){
			console.log("결재자라인 있느지 체크")
			console.log("appLineBody.firstChild: " , appLineBody.firstChild);
			console.log("appLineBody.children[0]: " , appLineBody.children[0]);
			appLineBody.children[0].remove();
		}

		var addAppLinetrTag = document.createElement("tr")
		var indexTdTag = document.createElement("td")
		var tpyeTdTag = document.createElement("td")
		var memNameTdTag = document.createElement("td")
		var rankTdTag = document.createElement("td")
		var deleteTdTag = document.createElement("td")
		let trCnt = appLineBody.children.length;
		
		//순번
		indexTdTag.innerHTML= trCnt+1;
		indexTdTag.setAttribute('class','table-user')
		// indexTdTag.setAttribute('heigt','50px');
		indexTdTag.setAttribute('style','height:50px table-layout:fixed;');
		//결재유형(결재 vs 합의)
		tpyeTdTag.innerHTML = pthis.innerText.substring(0,2);
		//이름
		memNameTdTag.innerHTML = name;
		memNameTdTag.setAttribute("class",appId);
		
		//직급
		rankTdTag.innerHTML = rank;

		//삭제
		deleteTdTag.setAttribute("class","table-action text-center");
		deleteTdTag.innerHTML = '<a href="javascript: void(0);" class="action-icon" onclick="deleteAppLine(this)"> <i class="mdi mdi-delete"></i></a>'
		
		// deleteTdTag.innerHTML = "삭제버튼";
		addAppLinetrTag.append(indexTdTag);
		addAppLinetrTag.append(tpyeTdTag);
		addAppLinetrTag.append(rankTdTag);
		addAppLinetrTag.append(memNameTdTag);
		addAppLinetrTag.append(deleteTdTag);
		appLineTable.setAttribute('style','height:50px;');
		appLineBody.append(addAppLinetrTag);
	}

//-------------------------reportList에서 이식한 함수들 끝---------------------------------------------

	//임시저장된 첨부파일 삭제 메서드
	function deleteAttach(pthis){
		console.log("pthis:",pthis);
		console.log("pthis.parentElement:",pthis.parentElement)
		console.log("pthis.parentElement.getAttribute:",pthis.parentElement.getAttribute('class'));
		delAttachList.push(pthis.parentElement.getAttribute('class'));
		attachList.pop(pthis.parentElement.getAttribute('class'));
		pthis.parentElement.remove();
		console.log("delAttachList:",delAttachList);
		console.log("attachList:",attachList);

	}

	//디테일 창 띄우는 함수(퍼스트 모달)
	function showDetail(pthis) {
		// let docCode = pthis.parentElement.getAttribute("class").substring(0, pthis.parentElement.getAttribute('class').lastIndexOf(" "));
		console.log("tr클래스 확인 : ", pthis.parentElement.getAttribute("class"));
		let docCode = pthis.parentElement.classList[0];
		inputDocCode.setAttribute('value', docCode);

		console.log("docCode substr버전:", docCode);
		let data = {
			docCode: docCode
		};

		let xhr = new XMLHttpRequest();
		xhr.open('post', "/workfit/approval/showTempDetail", true);
		xhr.setRequestHeader(header, token);
		xhr.send(JSON.stringify(data));
		xhr.onreadystatechange = function () {
			if (xhr.status == 200 && xhr.readyState == 4) {
				var rslt = xhr.responseText;
				pRslt = JSON.parse(rslt);
				console.log("파싱한 데이터:", pRslt);
				

				// 첨부 파일 설정

				if(pRslt.attachList.length != '0'){
					while (attachDiv.hasChildNodes()){
						attachDiv.removeChild( attachDiv.firstChild );       
					}
					let hTag = document.createElement("h5");
					let divTag = document.createElement("div");
					hTag.className = 'apple3 ml-2';
					hTag.innerHTML ="첨부파일";
					divTag.className = 'col-12';
					divTag.id = 'attachFileDiv';
					
					for(let i of pRslt.attachList){
						attachList.push(i.approvalAttachCode);
						console.log("attachList 배열로 들어오는지 확인", attachList);
						let spanTag = document.createElement("span");
						spanTag.innerHTML = `\${i.approvalAttachName}  <i class="mdi mdi-delete" onclick="deleteAttach(this)"></i>`;
						spanTag.setAttribute('class',i.approvalAttachCode);
						divTag.append(spanTag);
					}

					
					attachDiv.append(hTag);
					attachDiv.append(divTag);

				}else{
					// while (attachDiv.hasChildNodes()){
					// 	attachDiv.removeChild( attachDiv.firstChild );       
					// }
				}

				//결재 유형 설정
				for(let i of approvalType.children){
					if(i.value == pRslt.appDocVO.approvalType){
						i.setAttribute('selected','');
					}
				}
				//문서 공개범위 설정
				for(let i of approvalScope.children){
					if(i.value == pRslt.appDocVO.approvalScope){
						i.setAttribute('selected','');
					}
				}

				//결재 문서 제목 설정
				docTitle.setAttribute('value', pRslt.appDocVO.approvalDocTitle);

				//결재 내용 설정
				CKEDITOR.instances.reportForm.setData(pRslt.appDocVO.approvalContent);
	
				// 세컨드 모달 결재라인 만들기
				if(pRslt.appLineList.length == '1'){

				}else{
					while (appLineBody.hasChildNodes()){
						appLineBody.removeChild( appLineBody.firstChild );       
					}

					// if(document.getElementById('appLineChk')){
					// 	console.log("결재자라인 있느지 체크")
					// 	console.log("appLineBody.firstChild: " , appLineBody.firstChild);
					// 	console.log("appLineBody.children[0]: " , appLineBody.children[0]);
					// 	appLineBody.children[0].remove();
					// }
					
					for(let i = 1; i < pRslt.appLineList.length; i++){

						let addAppLinetrTag = document.createElement("tr")
						let indexTdTag = document.createElement("td")
						let tpyeTdTag = document.createElement("td")
						let memNameTdTag = document.createElement("td")
						let rankTdTag = document.createElement("td")
						let deleteTdTag = document.createElement("td")
						let trCnt = appLineBody.children.length;
						
						//순번
						indexTdTag.innerHTML= trCnt+1;
						indexTdTag.setAttribute('class','table-user')
						// indexTdTag.setAttribute('heigt','50px');
						indexTdTag.setAttribute('style','height:50px table-layout:fixed;');
						//결재유형(결재 vs 합의)
						tpyeTdTag.innerHTML = pRslt.appLineList[i].agreementStatus
						//이름
						memNameTdTag.innerHTML = pRslt.appLineList[i].memName;
						memNameTdTag.setAttribute("class",pRslt.appLineList[i].memId);
						
						//직급
						rankTdTag.innerHTML = pRslt.appLineList[i].approvalMemGrade;
						
						//삭제
						deleteTdTag.setAttribute("class","table-action text-center");
						deleteTdTag.innerHTML = '<a href="javascript: void(0);" class="action-icon" onclick="deleteAppLine(this)"> <i class="mdi mdi-delete"></i></a>'
						
						//요소 추가해주기
						addAppLinetrTag.append(indexTdTag);
						addAppLinetrTag.append(tpyeTdTag);
						addAppLinetrTag.append(rankTdTag);
						addAppLinetrTag.append(memNameTdTag);
						addAppLinetrTag.append(deleteTdTag);
						appLineTable.setAttribute('style','height:50px;');
						appLineBody.append(addAppLinetrTag);
					}
						
				}



				// 퍼스트 모달 결재라인 만들기
				if(pRslt.appLineList.length == '1'){

				}else{
					while (approver.hasChildNodes()){
						approver.removeChild( approver.firstChild );       
					}
					for(let i = 1; i < pRslt.appLineList.length; i++){
						let appTrTag = document.createElement("tr");
						let tdTag_index = document.createElement("td");
						let tdTag_type = document.createElement("td");
						let tdTag_rank = document.createElement("td");
						let tdTag_name = document.createElement("td");
						
						appTrTag.setAttribute('style','font-size:19px;');
						
						appTrTag.className = pRslt.appLineList[i].memId;
						appTrTag.setAttribute('readonly','readonly');
						appTrTag.setAttribute('data-toggle','modal');
						appTrTag.setAttribute('data-target','#full-width-modal-lg-third');
						appTrTag.setAttribute('data-dismiss','modal');

						tdTag_index.setAttribute('scope','row')
						tdTag_index.innerText = i;
						tdTag_type.innerText = pRslt.appLineList[i].agreementStatus;
						tdTag_rank.innerText = pRslt.appLineList[i].approvalMemGrade;
						tdTag_name.innerText = pRslt.appLineList[i].memName;

						appTrTag.append(tdTag_index);
						appTrTag.append(tdTag_type);
						appTrTag.append(tdTag_rank);
						appTrTag.append(tdTag_name);
						approver.append(appTrTag);
					}

				}	

				// 세컨드 모달 참조 라인 만들기
				if(pRslt.referList == null || pRslt.referList.length == '0'){

				}else{
					while (referDiv.hasChildNodes()){
						referDiv.removeChild(referDiv.firstChild );       
					}	
					
					let divTag = document.createElement('div');
					divTag.innerHTML = `<div class="row" id="referDivMark1" style="font-size: 20px;">참조</div>`
					referDiv.append(divTag);

					for(let i of pRslt.referList){
						var referSpanTag = document.createElement("span");
						referSpanTag.innerHTML = `<a href="javascript: void(0);" class="btn btn-sm btn-light mt-1 mr-1" onclick="deleteReferLine(this)">\${i.memGrade} : \${i.memName}&nbsp;<i class="mdi mdi-delete"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`;
						referSpanTag.setAttribute("class", i.memId);

						if(document.getElementById("referDivMark2")){
							console.log('referDiv.children:' , referDiv.children);
							referDiv.children[1].remove();
						}	
						referDiv.append(referSpanTag);
					}


				}

				//퍼스트 모달 참조 라인 만들기
				if(pRslt.referList == null || pRslt.referList.length == '0'){

				}else{
					while(reference.hasChildNodes()){
						reference.removeChild(reference.firstChild);       
					}

					for(let i of pRslt.referList){
						let spanTag = document.createElement("span");
						spanTag.innerHTML = `<a href="javascript: void(0);" class="btn btn-sm btn-light mr-1 mt-1">\${i.memGrade} : \${i.memName}    </a>`;
						spanTag.setAttribute("class", i.memId);
						reference.append(spanTag);
					}

				}

				$("#scrollable-modal").modal("show");
			}

		}
	}

   	//---------------------------영호꺼--------------------------------------------------------------------------------------------------------------------------------------------//
	   $(function() {
		
		$.ajax({
			type : 'get',
			url : '/workfit/getTreeData',
			contentType : 'application/json; charset=utf-8',
			success : function(result){
				
				
				
				$.each(result,function(i,e){
					console.log(e);
					// 사원테이블에서 온 데이터인지, 부서테이블에서 온 데이터인지에 따라서 codeId, parentId가 결정되도록 차별성을 둬야 하므로 아래와 같은 코드를 작성함 
					if(e.deptCode != null){
						var codeId = 'dep'+e.deptCode;
						var codeNm = e.deptName;
						if(e.deptDirect != null){
							var parentId = 'dep'+e.deptDirect;
						}else{
							var parentId = e.deptDirect;
						}
						
					}else{ // member테이블에서 온 데이터인 경우 
						
						if(e.deptFk[e.deptFk.length-1] == 'N'){ // 미배정 member인 경우 
							var codeId = 'non'+e.memId;
							var codeNm = e.memName+" "+e.memJobGrade;
							var parentId = 'dep'+e.deptFk;
							
						}else{
							
							var codeId = 'emp'+e.memId;
							var codeNm = e.memName+" "+e.memJobGrade;
							var parentId = 'dep'+e.deptFk;
						}
						
					}
					
//						var codeLvl = e.codeLvl;
					
					// 일단 각각의 노드들이 li태그요소라고 보면 되고, 처음에는 파일로 간주하여 li를 생성하고 이후 해당태그를 부모로 갖는 노드가 나타나면 해당 태그를 파일에서 폴더로 바꿔주는 느낌의 로직? 또는 알고리즘 
					var li = '<li onselectstart="return false" ondragstart="return false" id="'+ codeId +'"><i class="dripicons-folder"></i><img style="display : none;" src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"><img width="15" height="14" src="${pageContext.request.contextPath }/resources/uploads/profileImages/지윤.png"><i class="dripicons-user"></i><span onclick="oneclick(this)">'+codeNm+'</span></li>';
					
					if(parentId == null) { // 부모가 없는 li요소들 
							$("#codeList").append(li);
															
							
					} else {  // 부모가 있는 li요소들은 else문을 들어감 
								
				    var parentLi = $("li[id='"+ parentId +"']");
							    
					var div = '<div onclick=myclick(this) class="hitarea expandable-hitarea"></div>'	
								  
					parentLi.addClass("expandable")
								  
								  // 모든 부모 li요소들은 직계자식으로 div태그를 단 한개씩만 가질 수 있음 (find해서 하나도 찾지 못했다는 것은 해당 태그에 div태그를 append해야함을 의미) 
								  if(parentLi.find("div").length == 0){
									  parentLi.append(div);	
									  
								  }

									// 부모요소의 img자식 태그 중 직계자식img태그만 그 모양을 폴더로 바꿔주면 됨 
								      parentLi.children("img").attr("src","${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif");
									  parentLi.children("img").css("display","none");	  
								 	
									  
								  // 부모 li요소의 직계자식(ul)  
							      var bUl = parentLi.children("ul");
								

									
							      if(bUl.length == 0) {
							          li = "<ul style='display : none;'>" + li + "</ul>";
										
							          parentLi.append(li);

							      } else {
							    	  
							    	  
									 bUl.append(li);
							      }
						  }
				})
			
				
				
				// 각각의 Ul태그 중 마지막 li요소들만을 배열형태로 가져옴 
				var ulArr = $("ul[id='codeList'] li:last-child");
				for(let i = 0; i < ulArr.length; i++){
					// li요소 안에 div 태그가 하나라도 존재한다면(해당 li요소가 폴더라면) 폴더 밑으로 아무것도 보이지 않게 함 
					if($(ulArr[i]).find("div").length != 0){
						$(ulArr[i]).attr("class","closed expandable lastExpandable");
						$(ulArr[i]).children("div").attr("class","hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea");
													
					}else{
						
						$(ulArr[i]).addClass("last");
						if($(ulArr[i]).attr("id").substr(0,3)=='dep'){
							console.log("if문 안들어오나??");
							ulArr[i].removeChild(ulArr[i].children[1]);
						}
						
					}
					
				}	
				


	        	// li중에서 폴더인 녀석들만 더블클릭 시 열고 접히는 이벤트를 줌 (이때 이벤트 버블링을 막아주는 코드 작성)
	        	var liArr2 = $("ul[id='codeList'] li");
	        	
	        	for(let i = 0; i < liArr2.length; i++){
	            		$(liArr2[i]).on("dblclick",function(e){
	             			e.stopPropagation();
	                		$(liArr2[i]).children("div").click();
	                		
	                		console.log("더블클릭 했어?");
		        	
		        	
	            		}) // 더블클릭에 대한 이벤트 설정 끝 
	            		
	    				
	        		
	        	} // for문 끝 
	        	
				
	        	
	        	// 우클릭에 대한 이벤트 로직  + 부모 li의 폴더를 하나씩 지워주는 로직도 추가 + 파일 li의 i태그를 지워주는 로직도 추가 
            	var Contextmenu = !function() {
        			
        			
        			var allLi = $("ul[id='codeList'] li");
        			
        			for(let i = 0; i < allLi.length; i++){
        				if($(allLi[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
							// 모든 li요소들 중 파일인 녀석들만 우클릭 시 원하는 메뉴가 나오도록 설정함    
							
							// li요소들 중에 i태그(폴더 그림)을 지워준다.. 
							$(allLi[i]).find(".dripicons-folder").remove();
							$(allLi[i]).find("img").css("display","none");
							
        					
        				}else{  // 여기서 폴더를 한 개씩 제거 해주는 작업을 해준다 
        					$(allLi[i]).children("img")[0].remove();
        					$(allLi[i]).children(".dripicons-user").remove();
        					
        				}
        			}
        			
        			
        			
        		}();  // var Contextmenu 끝 
	        	


				
        		
        		
        		
			} // success  
			
			

			
				
			
		}) // ajax 끝 
		
		

		
		
    		
    		
	}); // $(function(){}) 끝 

	
	
	
	// 폴더 클릭시 + , - 가 바뀜고 동시에 안의 폴더 및 파일들이 나타나게 하는 함수  
	function myclick(a){
		

		
		var myul = $(a).parent().children("ul");
		if(myul.css("display")=="none"){
			myul.css("display","block");
			
			
		}else{
			myul.css("display","none");
			
			
		}
		
		
		//마지막 li태그요소가 아닌 li요소들은 아래와 같은 과정을 거쳐서 +, - 를 전환해야함 
		if($(a).attr("class") == "hitarea expandable-hitarea"){
			$(a).attr("class", "hitarea collapsable-hitarea")
			return;
		}

		if($(a).attr("class") == "hitarea collapsable-hitarea"){
			
			$(a).attr("class", "hitarea expandable-hitarea")
			return;
		}
		
		
		
		// 각각의 UL태그 중에서 마지막 li태그요소가 마지막 폴더라면 아래와 같은코드를 거치도록 해야함
		if($(a).attr("class") == "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"){
			$(a).attr("class", "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea")
			$(a).parent().attr("class","closed collapsable lastCollapsable");
			return;
		}
		
		if($(a).attr("class") == "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea"){
			$(a).attr("class", "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea")
			$(a).parent().attr("class","closed expandable lastExpandable");
			return;
			
			
		}
		
		
	}
	
	
	// window 객체로 선언함 
	click_history = []; 
	
	function oneclick(a){
		
		click_history.push(a); 	
		
		if(click_history.length == 1){
//				$(a).css("background-color","green");
			$(a).addClass('clickMember');
			
		}else{
			
			for(let i = 0; i < click_history.length - 1; i++){
				$(click_history[i]).removeClass('clickMember');
			}

			for(let i = 0; i < click_history.length - 1; i++){
				click_history.shift();
			}
			
			$(a).addClass('clickMember');
//				$(a).add("background-color","green");
		}
	}
		
	var result2 = [];
	var folderOpenFlag = false;
	
	function fn_byhSearchTree(){
		
		// 검색할 때마다 시작 부분에 기존에 색칠되있는 녀석들을 다 지워주는 작업이 필요 
		for(el of click_history){
			$(el).removeClass('clickMember');
		}
		
		for(el of click_history){
			click_history.shift();
			
		}
			
	
		var memVal = $("#byhMemSearchInput").val();
		console.log(memVal);
		
		
		var result = [...$("ul[id='codeList'] li")].filter(element => {
			if($(element).find("div").length == 0){
				if($(element).attr("id").substr(0,3) != 'dep'){
					
					
					
					return $(element).text().includes(memVal);
				}
				
			}
							
		});
		
		result.map((element)=>{
					click_history.push($(element).children("span"));
					$(element).children("span").addClass('clickMember');
			
		})
		
		
		
		
		console.log(result);
		
		fn_closeAnyOpened(); // << 폴더를 다 닫아주는 로직인데 얘는 무조건 실행되야 하는거 아님??
		
		$(result).dblclick();
//			$(result).children("span").click();
		
		result2 = [...$("ul[id='codeList'] li")].filter(element => {
//				if($(element).find(result).length != 0){

			for(el of result){
				if($(element).find(el).length != 0){
					
					var checkingDiv = true;
					break;
				}
			}

			if(checkingDiv){

				console.log("div클릭하기 전"+$(element).children("div"))
				
				
				
				$(element).children("div").click();
				return $(element).find(result).length != 0;
			}
			
		})
							
		folderOpenFlag = true;
		console.log(result2);
		
	}
	
	
	function fn_closeAnyOpened(){
		
		var allLiArrForByh = [...$("ul[id='codeList'] li")];
		
		
//			if(!folderOpenFlag){
			
			console.log("폴더 닫는 로직 실행되??");
			for(let i = 0; i < allLiArrForByh.length; i++){
						
				if($(allLiArrForByh[i]).children("div").length != 0){
					var elementDiv = $(allLiArrForByh[i]).children("div");
					

				
				
				
					var myul = $(elementDiv).parent().children("ul");
					
					if(myul.css("display") =="block"){
						
						myul.css("display","none");
						
					}
					
					
					//마지막 li태그요소가 아닌 li요소들은 아래와 같은 과정을 거쳐서 +, - 를 전환해야함 
					if($(elementDiv).attr("class") == "hitarea expandable-hitarea"){
						$(elementDiv).attr("class", "hitarea collapsable-hitarea")
					}
			
					if($(elementDiv).attr("class") == "hitarea collapsable-hitarea"){
						
						$(elementDiv).attr("class", "hitarea expandable-hitarea")
					}
					
					
					
					// 각각의 UL태그 중에서 마지막 li태그요소가 마지막 폴더라면 아래와 같은코드를 거치도록 해야함
					if($(elementDiv).attr("class") == "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"){
						$(elementDiv).attr("class", "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea")
						$(elementDiv).parent().attr("class","closed collapsable lastCollapsable");
					}
					
					if($(elementDiv).attr("class") == "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea"){
						$(elementDiv).attr("class", "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea")
						$(elementDiv).parent().attr("class","closed expandable lastExpandable");
						
					}
				
				} // div가 존재할 때 if문 끝... 
				
			
			}
			
			folderOpenFlag = false;
//			}
		
		
	}		
			
	//----------------------------------------영호꺼 끝----------------------------------------------//
</script>
<style>
.second-modal {
	width: 70%;
}

.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

/* 조직도에서 클릭 시 색상을 입혀주는 클래스 시작 */
.clickMember{
		color: #fff;
	    background-color: #35b8e0;
	    border-color: #35b8e0;
		}
/* 조직도에서 클릭 시 색상을 입혀주는 클래스 끝 */


	
.listTbl tr:hover{
	background-color: #e7ecf1;  

}

.listTbl th, .listTbl td{
	border-bottom: 1px solid #dbdee0 !important;
}


.page-item.active .page-link{
   background-color: #5F7CBB;

}
.dataTables_filter{
   font-family: 'apple3';
}


#datatable-buttons > tbody > tr:hover {
	background-color: #e7ecf1;
	cursor: pointer;
}
</style>